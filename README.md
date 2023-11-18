# Praktikum 1: Mengunduh Data dari Web Service (API)

**Langkah 1: Buat Project Baru**

Buatlah sebuah project flutter baru dengan nama books di folder src week-12 repository GitHub Anda.

Kemudian Tambahkan dependensi http dengan mengetik perintah berikut di terminal.

    flutter pub add http

**Langkah 2: Cek file pubspec.yaml**

Jika berhasil install plugin, pastikan plugin http telah ada di file pubspec ini seperti berikut.

    dependencies:
        flutter:
            sdk: flutter
        http: ^1.1.0

**Langkah 3: Buka file main.dart**

**!!GIVE ME A HUNDRED THOUSAND FIRST!!**

Ketiklah kode seperti berikut ini.

    import 'dart:async';
    import 'package:flutter/material.dart';
    import 'package:http/http.dart';
    import 'package:http/http.dart' as http;

    void main() {
    runApp(const MyApp());
    }

    class MyApp extends StatelessWidget {
    const MyApp({super.key});

    @override
    Widget build(BuildContext context) {
        return MaterialApp(
        title: 'Future Demo',
        theme: ThemeData(
            primarySwatch: Colors.blue,
            visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: const FuturePage(),
        );
    }
    }

    class _FuturePageState extends State<FuturePage> {
    String result = '';
    @override
    Widget build(BuildContext context) {
        return Scaffold(
        appBar: AppBar(
            title: const Text('Arya Wicaksana Hidayat'),
        ),
        body: Center(
            child: Column(children: [
            const Spacer(),
            ElevatedButton(onPressed: () {}, child: const Text('GO!')),
            const Spacer(),
            const CircularProgressIndicator(),
            const Spacer(),
            ]),
        ),
        );
    }

  Future<Response> getData() async {
    const authority = 'www.googleapis.com';
    const path = '/books/v1/volumes/junbDwAAQBAJ';
    Uri url = Uri.https(authority, path);
    return http.get(url);
  }
}


**Langkah 4: Tambah method getData()**

Tambahkan method ini ke dalam class _FuturePageState yang berguna untuk mengambil data dari API Google Books.

    Future<Response> getData() async {
        const authority = 'www.googleapis.com';
        const path = '/books/v1/volumes/junbDwAAQBAJ';
        Uri url = Uri.https(authority, path);
        return http.get(url);
    }

**Soal 1**

Tambahkan nama panggilan Anda pada title app sebagai identitas hasil pekerjaan Anda.

    return Scaffold(
        appBar: AppBar(
            title: const Text('Arya Wicaksana Hidayat'),
        ),

**Soal 2**

Carilah judul buku favorit Anda di Google Books, lalu ganti ID buku pada variabel path di kode tersebut. Caranya ambil di URL browser Anda seperti gambar berikut ini.

![screenshot](docs/Praktikum%201/SS_ContohSoal2.png)

Kemudian cobalah akses di browser URI tersebut dengan lengkap seperti ini. Jika menampilkan data JSON, maka Anda telah berhasil. Lakukan capture milik Anda dan tulis di README pada laporan praktikum. Lalu lakukan commit dengan pesan "W12: Soal 2".

![screenshot](docs/Praktikum%201/SS_ContohSoal22.png)

answer :

![screenshot](docs/Praktikum%201/SS_Soal2.png)

![screenshot](docs/Praktikum%201/SS_Soal22.png)