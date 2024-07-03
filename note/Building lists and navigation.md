# Building lists and navigation

## Section 1. **Create a landmark model**

- 모든 뷰의 정보의 하드코딩을 진행
- 이때 뷰에 전달할 수 있는 데이터 저장 모델을 생성

<br>

## Section 2. **Create the row view**

- 각 랜드마크에 대한 세부 정보를 보여주는 row 뷰 생성
- row 뷰는 랜드마크 정보를 프로퍼티로 갖고있어, 하나의 뷰에서 모든 랜드마크를 표시할 수 있음

<br>

## Section 3. **Customize the row preview**

> Xcode automatically recognizes any previews that you declare with a preview macro in a view’s source file.
> The canvas displays only one preview at a time, but you can define multiple previews and choose among them in the canvas.

> Xcode는 View의 소스 파일에서 Preview 매크로로 선언한 모든 Preview를 자동으로 인식한다.
> 캔버스는 한 번에 하나의 Preview를 표시하지만, 여러 Preview를 정의해 캔버스에서 선택할 수 있다.

- Xcode의 canvas는 [`PreviewProvider`](https://developer.apple.com/documentation/swiftui/previewprovider) 를 준수하는 editor의 모든 타입을 인식하고 표시
- 아래 코드와 같이, `Group` 사용시 여러 View를 하나의 Preview에서 확인 할 수 있다.
    
    ```swift
    #Preview {
        Group {
            LandmarkRow(landmark: landmarks[0])
            LandmarkRow(landmark: landmarks[1])
            LandmarkRow(landmark: landmarks[2])
        }
    }
    ```
    

![8](/img/8.png)

<br>

## Section 4. **Create the list of landmarks**

> When you use SwiftUI’s `List` type, you can display a platform-specific list of views.
> The elements of the list can be static, like the child views of the stacks you’ve created so far, or dynamically generated.
> You can even mix static and dynamically generated views.

> SwiftUI의 `List` type을 사용하면 `List` 플랫폼 별 뷰 목록을 표시할 수 있다.
> `List`의 요소는 지금까지 만든 스택의 자식 뷰처럼 정적일 수도 있고 동적으로 생성될 수 있다.
> 정적 뷰와 동적으로 생성된 뷰를 혼합할 수도 있다.

### [List](https://developer.apple.com/documentation/swiftui/hstack)

- 단일 열에 정렬된 데이터 행을 표시하는 컨테이너
- 선택적으로 하나 이상의 멤버를 선택할 수 있는 기능을 제공

![9](/img/9.png)

<br>

## Section 5. **Make the list dynamic**

> Instead of specifying a list’s elements individually, you can generate rows directly from a collection.
> You can create a list that displays the elements of a collection by passing your collection of data and a closure that provides a view for each element in the collection. The list transforms each element in the collection into a child view by using the supplied closure.

> 요소를 개별적으로 지정하는 대신, 컬렉션에서 직접 행을 생성할 수 있다.
> 데이터 컬렉션과 컬렉션의 각 요소에 대한 뷰를 제공하는 클로저를 전달해 List 생성 가능!
> List는 제공된 클로저를 사용하여 컬렉션의 각 요소를 자식 뷰로 변환한다.

![10](/img/10.png)

- List는 식별 가능한 데이터로 동작
    - 때문에, 데이터와 함께 식별 가능한 속성에 대한 KeyPath를 제공하거나 데이터 자체가 `Identifiable` 를 준수하도록 만들어야 함

<br>

## Section 6. **Set up navigation between list and detail**

### [NavigationView](https://developer.apple.com/documentation/swiftui/navigationview/)

- 예제에서는 NavigationSplitView를 사용했으나 iOS 16이상만 지원해, NavigationView로 변경
- iOS 16.4부터 Deprecated.
- 이후 버전은 `NavigationStack`과 `NavigationSplitView`를 사용
- [**Migrating to new navigation types →**](https://developer.apple.com/documentation/swiftui/migrating-to-new-navigation-types)

<br>

## Section 7. **Pass Data into Child Views**

- 하위 뷰에 데이터를 전달해보자

### [ScrollView](https://developer.apple.com/documentation/swiftui/scrollview/)

```swift
struct ScrollView<Content> where Content : View
```
