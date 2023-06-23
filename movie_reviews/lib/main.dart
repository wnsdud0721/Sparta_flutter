import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(), // 홈페이지 보여주기
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // 음식 사진 데이터
    List<Map<String, dynamic>> dataList = [
      {
        "category": "탑건: 매버릭",
        "imgUrl": "https://i.ibb.co/sR32PN3/topgun.jpg",
      },
      {
        "category": "마녀2",
        "imgUrl": "https://i.ibb.co/CKMrv91/The-Witch.jpg",
      },
      {
        "category": "범죄도시2",
        "imgUrl": "https://i.ibb.co/2czdVdm/The-Outlaws.jpg",
      },
      {
        "category": "헤어질 결심",
        "imgUrl": "https://i.ibb.co/gM394CV/Decision-to-Leave.jpg",
      },
      {
        "category": "브로커",
        "imgUrl": "https://i.ibb.co/MSy1XNB/broker.jpg",
      },
      {
        "category": "문폴",
        "imgUrl": "https://i.ibb.co/4JYHHtc/Moonfall.jpg",
      },
    ];

    // 화면에 보이는 영역
    return Scaffold(
      appBar: AppBar(
        // true를 하면 중앙 배열, false를 하면 왼쪽 배열
        centerTitle: false,
        backgroundColor: Colors.white,
        // 그림자를 통해 입체감을 줘서, 붕 떠보이게 만듦
        elevation: 0.0,
        title: Text(
          "Movie Reviews",
          style: TextStyle(
            fontSize: 28,
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        // icon 색상 변경
        iconTheme: IconThemeData(color: Colors.black),
        // actions는 오른쪽, leading은 왼쪽
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.person_outline),
          )
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              decoration: InputDecoration(
                // labelText는 입력을 할 때, 왼쪽 상단으로 text가 움직임
                // hintText는 입력을 할 때, 그대로 있음
                hintText: "영화 제목을 검색해주세요.",
                // textField 테두리
                border: OutlineInputBorder(
                  borderSide: BorderSide(width: 1, color: Colors.black),
                ),
                // prefixIcon : 왼쪽, suffixIcon : 오른쪽
                suffixIcon: IconButton(
                  icon: Icon(Icons.search),
                  onPressed: () {},
                ),
              ),
            ),
          ),
          // 구분선
          Divider(height: 1),
          // Expanded는 Flexible위젯의 fit 옵션이 FlexFit.tight로 고정된 위젯
          // chlid 요소를 렌더링 영역의 최대 사이즈까지 확장시켜 줌
          Expanded(
            // ListView를 Column안에 바로 사용하면 에러가 남
            // ListView는 부모 위젯의 높이에 따라 높이를 맞추는데, Column은 높이가 무한
            child: ListView.builder(
              itemCount: dataList.length,
              itemBuilder: (BuildContext context, int index) {
                String category = dataList[index]['category'];
                String imgUrl = dataList[index]['imgUrl'];

                return Card(
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Image.network(
                        imgUrl,
                        width: double.infinity,
                        height: 200,
                        fit: BoxFit.cover,
                      ),
                      Container(
                        width: double.infinity,
                        height: 200,
                        color: Colors.black.withOpacity(0.5),
                      ),
                      Text(
                        category,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 36,
                        ),
                      )
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
