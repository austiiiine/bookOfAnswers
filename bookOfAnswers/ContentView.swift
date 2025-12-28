import SwiftUI

struct ContentView: View {
  static let defaultText = "集中注意力，\n在心中默念一個具體的問題，\n由答案之書為你提供指引⋯"

  @State private var chosenAnswer = defaultText
  let answers = ["答案就在你心裡，只是你還沒勇敢去承認。",
                 "先停下來深呼吸，你會看到更清楚的路。",
                 "相信第一次浮現的想法，那通常是最真實的。",
                 "不要急，宇宙正在為你準備更好的答案。",
                 "這件事，值得你再努力一次。",
                 "向前走，你會驚訝自己其實已經準備好了。",
                 "放心去做。",
                 "等待一下，最好的時機還沒到。",
                 "你已比自己想得更接近成功。",
                 "選擇讓你感到平靜的那一個。",
                 "你正在走的路，比你以為的更正確。",
                 "先把心裡的雜訊關掉，你會聽見真正的答案。",
                 "如果你在猶豫，那就代表你已經知道該怎麼做。",
                 "你不需要急著得到所有答案，先跨出下一步就好。",
                 "換一個角度看，它就沒有那麼可怕了。",
                 "你以為的困難，只是開始前的害怕。",
                 "把問題說出口，答案就會變得簡單許多。",
                 "一切正在往對的方向前進。",
                 "你的直覺這次是對的。",
                 "再想一下。你會得到更好的答案。",
                 "你的情緒不是答案，但能指引方向。",
                 "選擇能讓你未來感謝現在的那一個。",
                 "休息一下。",
                 "別小看你正在做的事，它比你想的更重要。",
                 "你現在最需要的是：耐心。",
                 "結果會比你擔心的輕鬆，比你期待的美好。",
                 "有些事情，不需要現在決定。",
                 "放下不必要的負擔，答案就會浮現。",
                 "不要被一時的迷霧嚇到，前面是晴天。",
                 "你已經準備好了，只差相信自己。"]

    var body: some View {
      ZStack {
        Image("background")
          .resizable()
          .scaledToFill()
          .ignoresSafeArea()

        VStack {
          Spacer() // 把漸層推到底部

          LinearGradient(
            colors: [
              Color(red: 10/255, green: 10/255, blue: 40/255).opacity(0.95),
              Color(red: 10/255, green: 10/255, blue: 40/255).opacity(0.0)
            ],
            startPoint: .bottom,
            endPoint: .top
          )
          .frame(height: 580)
          .allowsHitTesting(false)
        }
        .ignoresSafeArea()

        VStack(spacing: 40) {
          Spacer().frame(height: 42)

          // 顯示文字
          VStack {
            Text(chosenAnswer)
              .font(.custom("UoqMunThenKhung", size: 20))
              .fontWeight(.medium)
              .foregroundColor(
                chosenAnswer == ContentView.defaultText
                ? Color(red: 10/255, green: 10/255, blue: 40/255).opacity(0.6)
                : Color(red: 10/255, green: 10/255, blue: 40/255).opacity(0.95)
              )
              .multilineTextAlignment(.center)
              //.background(.opacity(0.2))
          }
          .frame(width: 280, height: 210)
          //.background(.blue.opacity(0.7))

          // 翻開答案之書
          VStack(spacing: 20) {
            ButtonView(
              title: chosenAnswer == ContentView.defaultText ? "翻開答案之書" : "再翻一次",
              icon: chosenAnswer == ContentView.defaultText ? "sparkles" : "arrow.clockwise",
              gradientColors: [
                Color(red: 140/255, green: 150/255, blue: 200/255).opacity(0.45),
                Color(red: 100/255, green: 110/255, blue: 160/255).opacity(0.45)
              ]
            ) {
              chosenAnswer = answers.randomElement() ?? ""
            }
            ButtonView(
              title: "關上答案之書",
              icon: nil,
              gradientColors: [
                Color(red: 80/255, green: 90/255, blue: 140/255).opacity(0.45),
                Color(red: 50/255, green: 60/255, blue: 100/255).opacity(0.45)
              ]
            ) {
              chosenAnswer = ContentView.defaultText
            }
          }
          .padding(.top, 60)


          Spacer()
        }
        .padding(.top, 100)
      }
    }
}

#Preview {
    ContentView()
}
