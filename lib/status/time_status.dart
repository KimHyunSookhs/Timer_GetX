enum TimeStatus {
  oneMinute(1),
  fiveMinutes(5),
  tenMinutes(10),
  sixtyMinutes(60);

  // 2. Enum 멤버에 값을 저장할 final 속성 추가
  final int value;

  // 3. 생성자를 통해 값 초기화
  const TimeStatus(this.value);

  // 4. (선택) 분을 초로 변환하는 getter 추가
  int get seconds => value * 60;
}
