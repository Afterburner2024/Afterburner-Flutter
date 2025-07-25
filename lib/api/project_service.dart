import '../models/project_dto.dart';
import 'api_client.dart';

class ProjectService {
  final ApiClient _client;

  ProjectService(this._client);

  Future<List<ProjectDTO>> getProjects() async {
    final res = await _client.dio.get('/api/v1/project');
    final data = res.data['result'] ?? res.data;
    return (data as List).map((e) => ProjectDTO.fromJson(e)).toList();
  }

  Future<ProjectDTO> getProject(int id) async {
    final res = await _client.dio.get('/api/v1/project/$id');
    final data = res.data['result'] ?? res.data;
    return ProjectDTO.fromJson(data);
  }

  Future<ProjectDTO> createProject(ProjectDTO dto) async {
    final res = await _client.dio.post('/api/v1/project', data: dto.toJson());
    final data = res.data['result'] ?? res.data;
    return ProjectDTO.fromJson(data);
  }

  Future<ProjectDTO> updateProject(int id, ProjectDTO dto) async {
    final res = await _client.dio.put('/api/v1/project/$id', data: dto.toJson());
    final data = res.data['result'] ?? res.data;
    return ProjectDTO.fromJson(data);
  }

  Future<void> deleteProject(int id) async {
    await _client.dio.delete('/api/v1/project/$id');
  }
}
