
import SwiftUI
enum HeaderViewState {
    case full
    case detail
}
struct HeaderView: View {
    @State var searchText: String = ""
    @State var headerViewState: HeaderViewState
    @Binding var path: NavigationPath
    var body: some View {
       // VStack{
        VStack(alignment: .leading) {
            HStack{
                if headerViewState == .detail {
                    Button(action: {
                        path.removeLast()
                    }) {
                        Image(systemName: "chevron.left")
                        Text("")
                    }
                }
                TextField("Search...", text: $searchText)
                    .padding(10)
                    .background(RoundedRectangle(cornerRadius: 5).fill(Color(.systemGray6)))
                    .overlay(
                        RoundedRectangle(cornerRadius: 5)
                            .stroke(Color.gray, lineWidth: 1)
                    )
                    .font(.system(size: 18))
            }
            .padding(.top, 5)
           // if headerViewState == .full {
                HStack(alignment: .bottom){
                    Image(systemName: "mappin.and.ellipse")
                    Text("Deliver to John - Sunnyvale, TX")
                        .font(.callout)
                    Spacer()
                }
                .padding(.bottom,20)
                .padding(.top,5)
           // }
        }
        .padding(.horizontal, 20)
        .background(.orange.opacity(0.7))

       // .frame(height:(headerViewState == .full) ? 65 : 45)
       
    }
}

#Preview {
    struct Preview: View {
            @State var path = NavigationPath()
            var body: some View {
                HeaderView(headerViewState: .full, path: $path)
            }
        }

        return Preview()
   
}
