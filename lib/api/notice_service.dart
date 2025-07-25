import '../models/notice_dto.dart';
import 'api_client.dart';

class NoticeService {
  final ApiClient _client;

  NoticeService(this._client);

  Future<List<NoticeDTO>> getNotices() async {
    final res = await _client.dio.get('/api/v1/notice');
    final data = res.data['result'] ?? res.data;
    return (data as List).map((e) => NoticeDTO.fromJson(e)).toList();
  }

  Future<NoticeDTO> getNotice(int id) async {
    final res = await _client.dio.get('/api/v1/notice/$id');
    final data = res.data['result'] ?? res.data;
    return NoticeDTO.fromJson(data);
  }
}
