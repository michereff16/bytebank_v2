import 'dart:convert';

import 'package:bytebank_v2/http/webclient.dart';
import 'package:bytebank_v2/models/transaction.dart';
import 'package:http/http.dart';

class TransactionWebClient {
  Future<List<Transaction>> findAll() async {
    final Response response = await client.get(
      Uri.parse(baseUrl),
    );
    final List<dynamic> decodedJson = jsonDecode(response.body);

    return decodedJson
        .map((dynamic json) => Transaction.fromJson(json))
        .toList();
  }

  Future<Transaction?> save(Transaction transaction, String password) async {
    final String transactionJson = jsonEncode(transaction.toJson());
    final Response response = await client.post(Uri.parse(baseUrl),
        headers: {
          'Content-type': 'application/json',
          'password': password,
        },
        body: transactionJson);

    throw Exception();

    if (response.statusCode == 200) {
      return Transaction.fromJson(jsonDecode(response.body));
    }

    _throwHttpError(response.statusCode);
  }

  void _throwHttpError(int statusCode) =>
      throw Exception(_statusCodeResponses[statusCode]);

  static final Map<int, String?> _statusCodeResponses = {
    400: 'There was an error submitting transaction',
    401: 'Authentication Failed'
  };
}

class HttpException implements Exception {
  final String message;

  HttpException(this.message);
}
