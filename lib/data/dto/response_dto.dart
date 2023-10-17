class ResponseDTO {
  int code;
  String msg;
  String? jwt;
  dynamic data;

  ResponseDTO(this.code, this.msg, this.data);

  ResponseDTO.fromJson(Map<String, dynamic> json)
      : code = json["code"],
        msg = json["msg"],
        data = json["data"];
}
