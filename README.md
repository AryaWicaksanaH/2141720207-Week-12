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

    class FuturePage extends StatefulWidget {
    const FuturePage({super.key});

    @override
    State<FuturePage> createState() => _FuturePageState();
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

**Langkah 5: Tambah kode di ElevatedButton**

Tambahkan kode pada onPressed di ElevatedButton seperti berikut.

    ElevatedButton(
                child: const Text('GO!'),
                onPressed: () {
                    setState(() {});
                    getData().then((value) {
                    result = value.body.toString().substring(0, 450);
                    setState(() {});
                    }).catchError((_) {
                    result = 'An error occurred';
                    setState(() {});

Lakukan run aplikasi Flutter Anda. Anda akan melihat tampilan akhir seperti gambar berikut. Jika masih terdapat error, silakan diperbaiki hingga bisa running.

![screenshot pc](docs/Praktikum%201/screenshot_pc.png)
![gif hp](docs/Praktikum%201/gif_hape.gif)

**Soal 3**

- Jelaskan maksud kode langkah 5 tersebut terkait substring dan catchError!

- Capture hasil praktikum Anda berupa GIF dan lampirkan di README. Lalu lakukan commit dengan pesan "W12: Soal 3".

answer :

substring() mengambil substring dari string. Substring adalah bagian string yang dimulai dari indeks tertentu dan berakhir pada indeks tertentu. Metode ini menerima dua parameter, indeks awal dan indeks akhir. Indeks awal adalah indeks karakter pertama yang ingin diambil, dan indeks akhir adalah indeks karakter terakhir yang ingin diambil. Metode catchError() menangani kesalahan dan menerima satu parameter, yaitu fungsi yang akan dijalankan jika terjadi kesalahan. Parameter tersebut adalah objek kesalahan. substring() digunakan oleh kode di atas untuk mengambil 450 karakter pertama dari respons API. Jika terjadi kesalahan saat mengambil respons API, kode tersebut akan menggunakan catchError() untuk menampilkan pesan kesalahan dengan judul "An error occurred"