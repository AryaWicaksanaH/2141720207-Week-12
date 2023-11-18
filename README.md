# Nama : Arya Wicaksana Hidayat
# Kelas : TI-3F
# Absen/NIM : 07/2141720207
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
                    });
                }),
            const Spacer(),
            Text(result),
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

# Praktikum 2: Menggunakan await/async untuk menghindari callbacks

**Langkah 1: Buka file main.dart**

Tambahkan tiga method berisi kode seperti berikut di dalam class _FuturePageState.

    Future<int> returnOneAsync() async {
    await Future.delayed(const Duration(seconds: 3));
    return 1;
    }

    Future<int> returnTwoAsync() async {
    await Future.delayed(const Duration(seconds: 3));
    return 2;
    }

    Future<int> returnThreeAsync() async {
    await Future.delayed(const Duration(seconds: 3));
    return 3;
    }

**Langkah 2: Tambah method count()**

Lalu tambahkan lagi method ini di bawah ketiga method sebelumnya.

    Future count() async {
        int total = 0;
        total = await returnOneAsync();
        total += await returnTwoAsync();
        total += await returnThreeAsync();
        setState(() {
        result = total.toString();
        });
    }
    }

**Langkah 3: Panggil count()**

Lakukan comment kode sebelumnya, ubah isi kode onPressed() menjadi seperti berikut.

    ElevatedButton(
              child: const Text('GO!'),
              onPressed: () {
                count();
              }),

**Langkah 4: Run**

Akhirnya, run atau tekan F5 jika aplikasi belum running. Maka Anda akan melihat seperti gambar berikut, hasil angka 6 akan tampil setelah delay 9 detik.

![screenshot pc](docs/Praktikum%202/screenshot_pc.png)
![gif hape](docs/Praktikum%202/gif_hape.gif)

**Soal 4**

- Jelaskan maksud kode langkah 1 dan 2 tersebut!

- Capture hasil praktikum Anda berupa GIF dan lampirkan di README. Lalu lakukan commit dengan pesan "W12: Soal 4".

answer :

Langkah 1 dari kode di atas adalah kode Dart yang memiliki tiga fungsi return Async: returnOneAsync(), returnTwoAsync(), dan returnThreeAsync(). Nilai int dikembalikan oleh ketiga fungsi ini, dan Future.delayed() menunda eksekusi selama tiga detik. Masing-masing fungsi dijelaskan di sini:

- returnOneAsync() Fungsi ini mengembalikan nilai 1 setelah 3 detik.
- returnTwoAsync() Fungsi ini mengembalikan nilai 2 setelah 3 detik.
- returnThreeAsync() Fungsi ini mengembalikan nilai 3 setelah 3 detik.

Dalam langkah kedua dari kode di atas, fungsi asynchronous count() digunakan untuk menghitung jumlah dari tiga fungsi asynchronous lainnya: returnOneAsync(), returnTwoAsync(), dan returnThreeAsync(). Dengan menggunakan fungsi count(), yang mengembalikan Future, eksekusinya tidak akan memblokir kode lainnya.

# Praktikum 3: Menggunakan Completer di Future

**Langkah 1: Buka main.dart**

Pastikan telah impor package async berikut.

    import 'package:async/async.dart';

**Langkah 2: Tambahkan variabel dan method**

Tambahkan variabel late dan method di class _FuturePageState seperti ini.

    late Completer completer;

    Future getNumber() {
    completer = Completer<int>();
    calculate();
    return completer.future;
    }

    Future calculate() async {
    await Future.delayed(const Duration(seconds : 5));
    completer.complete(42);
    }

**Langkah 3: Ganti isi kode onPressed()**

Tambahkan kode berikut pada fungsi onPressed(). Kode sebelumnya bisa Anda comment.

    getNumber().then((value) {
                    setState(() {
                        result = value.toString();
                    });
                });

**Langkah 4:**

Terakhir, run atau tekan F5 untuk melihat hasilnya jika memang belum running. Bisa juga lakukan hot restart jika aplikasi sudah running. Maka hasilnya akan seperti gambar berikut ini. Setelah 5 detik, maka angka 42 akan tampil.

![screenshot pc](docs/Praktikum%203/screenshot_pc.png)
![gif hape](docs/Praktikum%203/gif_hape.gif)

**Soal 5**

- Jelaskan maksud kode langkah 2 tersebut!

- Capture hasil praktikum Anda berupa GIF dan lampirkan di README. Lalu lakukan commit dengan pesan "W12: Soal 5".

answer :

- Variabel completer Variabel completer adalah variabel late dari tipe Completer. Variabel ini digunakan untuk menyimpan hasil dari perhitungan angka 42.
- Method getNumber() Method getNumber() mengembalikan nilai dari variabel completer. Method ini memiliki dua langkah: a. Inisialisasi variabel completer dengan nilai baru. b. Memanggil method calculate() untuk menghitung angka 42.
- Method calculate() Method calculate() menggunakan Future.delayed() untuk menunggu 5 detik sebelum menyelesaikan perhitungan angka 42. Setelah 5 detik, method ini akan memanggil method completer.complete() untuk menyelesaikan perhitungan dan mengembalikan nilai 42 ke variabel completer

**Langkah 5: Ganti method calculate()**

Gantilah isi code method calculate() seperti kode berikut, atau Anda dapat membuat calculate2()

    calculate() async {
        try {
        await new Future.delayed(const Duration(seconds: 5));
        completer.complete(42);
        } catch (_) {
        completer.completeError({});
        }
    }

**Langkah 6: Pindah ke onPressed()**

Ganti menjadi kode seperti berikut.

    getNumber().then((value) {
    setState(() {
        result = value.toString();
    });
    }).catchError((e) {
    result = 'An error occurred';
    });

**Soal 6**

- Jelaskan maksud perbedaan kode langkah 2 dengan langkah 5-6 tersebut!

- Capture hasil praktikum Anda berupa GIF dan lampirkan di README. Lalu lakukan commit dengan pesan "W12: Soal 6".

answer : 

langkah 5, kita mengganti isi dari method calculate(). Metode ini sebelumnya menggunakan await Future.delayed(const Duration(seconds: 5)); untuk menunggu 5 detik sebelum menyelesaikan perhitungan angka 42. Namun, metode ini tidak menangani kesalahan yang mungkin terjadi saat menunggu 5 detik. Sebaliknya, kode ini menggunakan try/catch untuk menangani kesalahan yang mungkin terjadi saat menunggu 5 detik. Jika tidak ada kesalahan, metode ini akan memanggil metode completer.complete() untuk menyelesaikan perhitungan dan mengembalikan nilai 42 ke variabel completer. Jika ada kesalahan, metode ini akan memanggil metode completer.completeError() untuk menyelesaikan perhitungan dan mengembalikan nilai {} ke variabel completer.

langkah 6, kita mengganti kode di method onPressed(). Metode ini sebelumnya menangani hasil dari method getNumber dengan then(). Namun, metode ini tidak menangani kesalahan yang mungkin terjadi saat memanggil method getNumber. Sebaliknya, kode ini menangani hasil dari method getNumber dengan menggunakan then() dan catchError(). Jika tidak terjadi kesalahan, maka metode ini akan memanggil method setState() untuk memperbarui state widget dan menampilkan pesan kesalahan.