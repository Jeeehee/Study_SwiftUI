# Section 1. **Create a New Project and Explore the Canvas**

```swift
@main
struct SwiftUI_TutorialsApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
```

- SwiftUI App 생명주기를 사용하는 구조는, `App` Protocol을 준수한다.
- 이 구조의 `body` 속성은 하나 이상의 Scene을 반환하며, 순서대로 표시할 콘텐츠를 제공한다.
- `@main` 은 앱의 진입점을 식별한다.

기본적으로 SwiftUI 뷰 파일은 `struct`와 `#Preview` 로 이루어져있다.

- `struct` : View Protocol을 따르고, View의 Contents와 Layout을 설명
- `#Preview` : struct에 대한 미리보기 화면

<br>

# Section 2. **Customize the Text View**

> You can customize a view’s display by changing your code, or by using the inspector to discover what’s available and to help you write code.
> As you build the Landmarks app, you can use any combination of editors: the source editor, the canvas, or the inspectors. Your code stays updated, regardless of which tool you use.

> 화면에 보이는 요소를 코드를 변경하거나, inspector로 변경할 수 있다.
소스 편집기, 캔버스, inspectors 등 어떤 도구를 사용하든 코드는 항상 최신 상태로 유지된다.

<br>

### Editors

- `Command` + `Control` + UI요소를 클릭하면 아래와 같이 수정 가능한 편집 팝업이 뜬다.

    ![1](/img/1.png)
    ![2](/img/2.png)
    
    - 화면을 바로 수정할 수 있으며, 이때 수정된 UI 요소에 맞추어 코드가 자동 수정된다.
- 코드를 `우클릭`해도 위와 같은 편집 팝업이 뜬다.
    
   ![3](/img/3.png)
    

<br>

# **Section 3. Combine views using stacks**

> the `body` property only returns a single view. You can combine and embed multiple views in stacks, which group views together horizontally, vertically, or back-to-front.

> `body` 는 단 하나의 View만 반환한다. 여러 뷰를 합칠 때는 horizontally, vertically, or back-to-front 방향의 stack에 그룹화하여 포함시킬 수 있다.

<br>

### [Stack](https://developer.apple.com/documentation/swiftui/building-layouts-with-stack-views)

![4](/img/4.png)

- [**HStack**](https://developer.apple.com/documentation/swiftui/hstack)
    - 하위 뷰를 가로 방향으로 정렬
- [**VStack**](https://developer.apple.com/documentation/swiftui/vstack)
    - 하위 뷰를 세로 방향으로 정렬
- [**ZStack**](https://developer.apple.com/documentation/swiftui/zstack)
    - 하위 뷰를 그 하위뷰 위로 정렬
- [**Spacer**](https://developer.apple.com/documentation/swiftui/spacer)
    - 스택 레이아웃을 포함하는 주요 축을 따라 확장되거나, 스택에 포함되지 않은 경우 두 축 모두로 확장되는 유연한 공간
        
        ![5](/img/5.png)
        
- [**.padding()**](https://developer.apple.com/documentation/swiftui/view/padding(_:)-3rxip)
    - View의 각 모서리에 구체적인 패딩 값을 추가하는 메서드
    
<br>

# **Section 4. Create a custom image view**

```swift
struct ImageView: View {
    var body: some View {
        Image("Image")
            .resizable()
            .clipShape(.circle) // 이미지를 Shape과 같이 자름 (like Mask)
            .frame(width: 300, height: 300)
            .scaledToFill()
    }
}

#Preview {
    ImageView()
}
```

![6](/img/6.png)

<br>

# **Section 5~**

![7](/img/7.png)
