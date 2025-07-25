import '../models/qna_dto.dart';
import 'api_client.dart';

class QnaService {
  final ApiClient _client;

  QnaService(this._client);

  Future<List<QnaDTO>> getQnas() async {
    final res = await _client.dio.get('/api/v1/qna');
    final data = res.data['result'] ?? res.data;
    return (data as List).map((e) => QnaDTO.fromJson(e)).toList();
  }

  Future<QnaDTO> getQna(int id) async {
    final res = await _client.dio.get('/api/v1/qna/$id');
    final data = res.data['result'] ?? res.data;
    return QnaDTO.fromJson(data);
  }

  Future<QnaDTO> createQna(QnaDTO dto) async {
    final res = await _client.dio.post('/api/v1/qna', data: dto.toJson());
    final data = res.data['result'] ?? res.data;
    return QnaDTO.fromJson(data);
  }

  Future<QnaDTO> updateQna(int id, QnaDTO dto) async {
    final res = await _client.dio.put('/api/v1/qna/$id', data: dto.toJson());
    final data = res.data['result'] ?? res.data;
    return QnaDTO.fromJson(data);
  }

  Future<void> deleteQna(int id) async {
    await _client.dio.delete('/api/v1/qna/$id');
  }

  Future<QnaDTO> addAnswer(int id, QnaDTO dto) async {
    final res = await _client.dio.put('/api/v1/qna/$id/answer', data: dto.toJson());
    final data = res.data['result'] ?? res.data;
    return QnaDTO.fromJson(data);
  }
}
