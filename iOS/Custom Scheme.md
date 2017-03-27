Custom Scheme
=============

- 커스텀 스킴, 딥링크
- 브라우저에서 앱에서 보기와 같은 기능 구현할 때 

```
자바스크립트가 앱에 등록된 커스텀 스킴을 호출시킨다.
자바스크립트에서 location을 변경시키면
ex) instagram://

iOS 자체에서 instagram:// 으로 등록된 앱을 찾아서 실행시켜준다.
```
- 아이폰 브라우저(사파리)에서도 ```instagram:// ``` 주소창에 치면, 인스타그램이 깔려있는 경우,알림창과 함께 확인을 하면 실행될 것이다.


Custom Scheme 등록 
-----------------
```프로젝트 세팅 > Targets > Info > URL Types > add items ```

```URL schemes 란에 입력 ```

```appName://```
