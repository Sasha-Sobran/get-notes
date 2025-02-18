import 'package:dio/dio.dart';
import 'package:frontendik/http/http_client.dart';
import 'package:frontendik/models/note/note.dart';

class NoteApi {
  static Future<void> createNote(
    String title,
    String description,
    String token,
  ) async {
    await HTTPClient.api.post(
      '/note/',
      data: {
        'title': title,
        'description': description,
      },
      options: Options(
        headers: {'authorization': 'Bearer $token'},
      ),
    );
  }

  static Future<List<Note>> fetchNotes(String token) async {
    final response = await HTTPClient.api.get(
      '/note/',
      options: Options(
        headers: {'authorization': 'Bearer $token'},
      ),
    );

    return response.data.map<Note>((note) => Note.fromJson(note)).toList();
  }

  static Future<void> deleteNote(int id, String token) {
    return HTTPClient.api.delete(
      '/note/$id',
      options: Options(
        headers: {'authorization': 'Bearer $token'},
      ),
    );
  }
}
