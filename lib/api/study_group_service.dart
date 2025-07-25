import '../models/study_group_dto.dart';
import 'api_client.dart';

class StudyGroupService {
  final ApiClient _client;

  StudyGroupService(this._client);

  Future<List<StudyGroupDTO>> getStudyGroups() async {
    final res = await _client.dio.get('/api/v1/study-group');
    final data = res.data['result'] ?? res.data;
    return (data as List).map((e) => StudyGroupDTO.fromJson(e)).toList();
  }

  Future<StudyGroupDTO> getStudyGroup(int id) async {
    final res = await _client.dio.get('/api/v1/study-group/$id');
    final data = res.data['result'] ?? res.data;
    return StudyGroupDTO.fromJson(data);
  }

  Future<StudyGroupDTO> createStudyGroup(StudyGroupDTO dto) async {
    final res = await _client.dio.post('/api/v1/study-group', data: dto.toJson());
    final data = res.data['result'] ?? res.data;
    return StudyGroupDTO.fromJson(data);
  }

  Future<StudyGroupDTO> updateStudyGroup(int id, StudyGroupDTO dto) async {
    final res = await _client.dio.put('/api/v1/study-group/$id', data: dto.toJson());
    final data = res.data['result'] ?? res.data;
    return StudyGroupDTO.fromJson(data);
  }

  Future<void> deleteStudyGroup(int id) async {
    await _client.dio.delete('/api/v1/study-group/$id');
  }
}
