# Handling user input

## Section 1. **Mark favorite landmarks**

- Add a star to each `LandmarkRow` that shows a favorite landmark.

<br>

## Section 2. **Filter the list view**

> *State* is a value, or a set of values, that can change over time, and that affects a view’s behavior, content, or layout.
> You use a property with the `@State` attribute to add state to a view.

> *State*는 시간이 지남에 따라 값이 변경될 수 있고, 뷰의 동작, 컨텐트, 레이아웃에 영향을 주는 값의 집합이다.
> 뷰에 state를 추가하려면, `@State` 프로퍼티를 사용해라

<aside>
💡 [State](https://developer.apple.com/documentation/swiftui/state/)

A property wrapper type that can read and write a value managed by SwiftUI.

</aside>

<br>

## Section 3. **Add a Control to Toggle the State**

> A *binding* acts as a reference to a mutable state. When a user taps the toggle from off to on, and off again, the control uses the binding to update the view’s state accordingly.

> *binding* 은 변경 가능한 상태에 대한 참조이다.
> 사용자의 toogle tap event에 따라, 컨트롤은 바인딩을 사용해 뷰의 상태를 그에 맞춰 업데이트한다.

<aside>
💡 [Binding](https://developer.apple.com/documentation/swiftui/binding/)

A property wrapper type that can read and write a value owned by a source of truth

</aside>

```swift
struct LandmarkListView: View {
    @State private var showFavoriteOnly = false
    
    var filteredLandmarks: [Landmark] {
        landmarks.filter {
            !showFavoriteOnly || $0.isFavorite
        }
    }
    
    var body: some View {
        NavigationView {
            List {
                Toggle(isOn: $showFavoriteOnly) {
                    Text("Favorites only")
                }
                
                ForEach(filteredLandmarks) { landmark in
                    NavigationLink {
                        LandmarkDetailView(landmark: landmark)
                    } label: {
                        LandmarkRow(landmark: landmark)
                    }
                }
            }
            .animation(.default, value: filteredLandmarks)
            .navigationTitle("Landmarks")
        }
    }
}

#Preview {
    LandmarkListView()
}
```

![11](/img/11.png)![12](/img/12.png)

<br>

## Section 4. **Use observation for storage**

> To prepare for the user to control which particular landmarks are favorites, you’ll first store the landmark data using the `Observable()` macro.
> With Observation, a view in SwiftUI can support data changes without using property wrappers or bindings. SwiftUI watches for any observable property changes that could affect a view, and displays the correct version of the view after a change.

> 사용자가 어떤 랜드마크가 즐겨찾기 된 상태인지 제어할 수 있도록, 랜드마트 데이터를 `Observable()` macro를 사용해 저장한다.
> Observation을 사용하면 SwiftUI의 뷰는 property wrappers or bindings 를 사용하지 않고도, 데이터 변경을 지원할 수 있다.

<aside>
💡 [Macro `Observable()`](https://developer.apple.com/documentation/observation/observable())

Defines and implements conformance of the Observable protocol.

```swift
@Observable
final class ModelData {
    var landmarks: [Landmark] = load("landmarkData.json")
}
```

</aside>

하지만 이 방법은 iOS17부터 지원하는 기능이어서, 아래와 같이 진행

```swift
final class ModelData: ObservableObject {
    @Published var landmarks: [Landmark] = load("landmarkData.json")
}
```

<br>

## Section 5. **Adopt the model object in your views**

<aside>
💡 [Environment](https://developer.apple.com/documentation/swiftui/environment)

뷰의 Environment에 저장된 값을 읽는다.

EnvironmentValues Key Path를 사용해 읽을 값을 나타낸다

```swift
@Environment(\.landmark) var modelData: ModelData
```

</aside>

<aside>
💡 [EnvironmentValues](https://developer.apple.com/documentation/swiftui/environmentvalues)

A collection of environment values propagated through a view hierarchy.

</aside>

예제에 나와있는 방법은 iOS17부터 지원하는 기능이어서, 아래와 같이 진행

```swift
extension EnvironmentValues {
    var landmark: ModelData {
        ModelData()
    }
}

struct LandmarkListView: View {
    @Environment(\.landmark) var modelData: ModelData
    @State private var showFavoriteOnly = false
    
    var filteredLandmarks: [Landmark] {
        modelData.landmarks.filter {
            !showFavoriteOnly || $0.isFavorite
        }
    }
}
```

<br>

## Section 6. **Create a favorite button for each landmark**

하드코딩 되어있는 랜드마크 목록의 즐겨찾기를, 사용자 이벤트에 변경되도록 `LandmarkDetail` 에 즐겨찾기 버튼을 추가하자

예제를 따라하다보니 생긴 궁금증 ..

`@State` 와 `@Binding` 그리고 `@ObservableObject` ****은 어떻게 다른가 .. !

아래 링크에서 파헤쳐보았다 !
[**@State 와 @Binding 그리고 @ObservableObject 의 차이 포스팅**](https://velog.io/@jee/State-%EC%99%80-Binding-%EA%B7%B8%EB%A6%AC%EA%B3%A0-ObservableObject-%EC%9D%98-%EC%B0%A8%EC%9D%B4)
