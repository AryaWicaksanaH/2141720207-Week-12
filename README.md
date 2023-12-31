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

# Praktikum 4: Memanggil Future secara paralel

**Langkah 1: Buka file main.dart**

Tambahkan method ini ke dalam class _FuturePageState

    void returnFG() {
        FutureGroup<int> futureGroup = FutureGroup<int>();
        futureGroup.add(returnOneAsync());
        futureGroup.add(returnTwoAsync());
        futureGroup.add(returnThreeAsync());
        futureGroup.close();
        futureGroup.future.then((List<int> value) {
        int total = 0;
        for (var element in value) {
            total += element;
        }
        setState(() {
            result = total.toString();
        });
        });
    }

**Langkah 2: Edit onPressed()**

Anda bisa hapus atau comment kode sebelumnya, kemudian panggil method dari langkah 1 tersebut.

    onPressed: () {
        returnFG();
    }

**Langkah 3: Run**

Anda akan melihat hasilnya dalam 3 detik berupa angka 6 lebih cepat dibandingkan praktikum sebelumnya menunggu sampai 9 detik.

![screenshot pc](docs/Praktikum%204/screenshot_pc.png)
![gif hape](docs/Praktikum%204/gif_hape.gif)

**Soal 7**

Capture hasil praktikum Anda berupa GIF dan lampirkan di README. Lalu lakukan commit dengan pesan "W12: Soal 7".

**Langkah 4: Ganti variabel futureGroup**

Anda dapat menggunakan FutureGroup dengan Future.wait seperti kode berikut.

    final futures = Future.wait<int>([
    returnOneAsync(),
    returnTwoAsync(),
    returnThreeAsync(),
    ]);

**Soal 8**

Jelaskan maksud perbedaan kode langkah 1 dan 4!

answer :

pada penggunaan variabel futureGroup. Pada langkah pertama, variabel futureGroup disimpan, yang merupakan objek yang dapat digunakan untuk mengelompokkan beberapa Future bersama-sama. Pada langkah keempat, variabel futureGroup digantikan oleh Future.wait(), yang merupakan fungsi yang dapat digunakan untuk menunggu beberapa Future selesai dijalankan.

# Praktikum 5: Menangani Respon Error pada Async Code

**Langkah 1: Buka file main.dart**

Tambahkan method ini ke dalam class _FuturePageState

    Future returnError() async {
        await Future.delayed(const Duration(seconds: 2));
        throw Exception('Something terrible happened!');
    }

**Langkah 2: ElevatedButton**

Ganti dengan kode berikut

    ElevatedButton(
                child: const Text('GO!'),
                onPressed: () {
                    returnError().then((value) {
                    setState(() {
                        result = 'Success';
                    });
                    }).catchError((onError) {
                    setState(() {
                        result = onError.toString();
                    });
                    }).whenComplete(() => print('complete'));
                }),

**Langkah 3: Run**

Lakukan run dan klik tombol GO! maka akan menghasilkan seperti gambar berikut.

![screenshot pc](docs/Praktikum%205/screenshot_pc.png)
![gif hape](docs/Praktikum%205/gif_hape.gif)

**Soal 9**

Capture hasil praktikum Anda berupa GIF dan lampirkan di README. Lalu lakukan commit dengan pesan "W12: Soal 9".

**Langkah 4: Tambah method handleError()**

Tambahkan kode ini di dalam class _FutureStatePage

    Future handleError() async {
        try {
        await returnError();
        } catch (error) {
        setState(() {
            result = error.toString();
        });
        } finally {
        print('Complete');
        }
    }

**Soal 10**

Panggil method handleError() tersebut di ElevatedButton, lalu run. Apa hasilnya? Jelaskan perbedaan kode langkah 1 dan 4!

answer :

- Langkah 1, method returnError() tidak menangani error yang terjadi. Jika error terjadi, maka method tersebut akan berhenti dan tidak mengembalikan nilai apa pun.

- Langkah 4, method handleError() menangani kesalahan dengan try-catch-finally. Method handleError() mencoba menjalankan method returnError() pada try block. Jika error terjadi, try block akan berhenti dan error akan ditangkap oleh catch block. Pada catch block, method handleError() menampilkan error ke layar menggunakan print(). Pada akhirnya, blok selalu dijalankan.

# Praktikum 6: Menggunakan Future dengan StatefulWidget

**Langkah 1: install plugin geolocator**

Tambahkan plugin geolocator dengan mengetik perintah berikut di terminal.

    flutter pub add geolocator

**Langkah 2: Tambah permission GPS**

Jika Anda menargetkan untuk platform Android, maka tambahkan baris kode berikut di file android/app/src/main/androidmanifest.xml

    <uses-permission android:name="android.permission.ACCESS_FINE_LOCATION"/>
    <uses-permission android:name="android.permission.ACCESS_COARSE_LOCATION"/>

**Langkah 3: Buat file geolocation.dart**

Tambahkan file baru ini di folder lib project Anda.

**Langkah 4: Buat StatefulWidget**

Buat class LocationScreen di dalam file geolocation.dart

**Langkah 5: Isi kode geolocation.dart**

    import 'dart:ffi';

    import 'package:flutter/material.dart';
    import 'package:geolocator/geolocator.dart';

    class LocationScreen extends StatefulWidget {
    const LocationScreen({super.key});

    @override
    State<LocationScreen> createState() => _LocationScreenState();
    }

    class _LocationScreenState extends State<LocationScreen> {
    String myPosition = '';
    @override
    void initstate() {
        super.initState();
        getPosition().then((Position myPos) {
        myPosition =
            'Latitude: ${myPos.latitude.toString()} - Longitude: {myPos.longitude.toString()}';
        setState(() {
            myPosition = myPosition;
        });
        });
    }

    @override
    Widget build(BuildContext context) {
        return Scaffold(
        appBar: AppBar(title: const Text('Current Location')),
        body: Center(child: Text(myPosition)),
        );
    }

    Future<Position> getPosition() async {
        await Geolocator.requestPermission();
        await Geolocator.isLocationServiceEnabled();
        Position? position = await Geolocator.getCurrentPosition();
        return position;
    }
    }

**Soal 11**

Tambahkan nama panggilan Anda pada tiap properti title sebagai identitas pekerjaan Anda.

    appBar: AppBar(title: const Text('Current Location Arya')),

**Langkah 6: Edit main.dart**

Panggil screen baru tersebut di file main Anda seperti berikut.

    home: const LocationScreen(),

**Langkah 7: Run**

Run project Anda di device atau emulator (bukan browser), maka akan tampil seperti berikut ini.

**!!ATTENTION!!**

well, jika kalian mengalami error seperti dibawah ini saat run :

    nuget.exe not found, trying to download or use cached version.

aku sarankan kalian download [NuGet](https://www.nuget.org/downloads) nya, gak perlu klik EXE-nya. cukup buat folder untuknya dimanapun dan taruh exe di dalam folder nya. Setelah itu, copy path-nya seperti Week awal2 pasang Dart

![screenshot pc](docs/Praktikum%206/screenshot_pc.png)
![gif hape](docs/Praktikum%206/ss_hp.jpeg)
![gif hape](docs/Praktikum%206/ss_hp2.jpeg)

**Langkah 8: Tambahkan animasi loading**

Tambahkan widget loading seperti kode berikut. Lalu hot restart, perhatikan perubahannya.

    @override
    Widget build(BuildContext context) {
        final myWidget =
            myPosition == '' ? const CircularProgressIndicator() : Text(myPosition);

        return Scaffold(
        appBar: AppBar(title: const Text('Current Location')),
        body: Center(child: myWidget),
        );
    }

**Soal 12**

- Jika Anda tidak melihat animasi loading tampil, kemungkinan itu berjalan sangat cepat. Tambahkan delay pada method getPosition() dengan kode await Future.delayed(const Duration(seconds: 3));

answer : i saw the loading for 3 secs

- Apakah Anda mendapatkan koordinat GPS ketika run di browser? Mengapa demikian?

answer : Geolocator support untuk browser sehingga bisa mendapatkan koordinat lokasi sendiri

- Capture hasil praktikum Anda berupa GIF dan lampirkan di README. Lalu lakukan commit dengan pesan "W12: Soal 12".

# Praktikum 7: Manajemen Future dengan FutureBuilder

**Langkah 1: Modifikasi method getPosition()**

Buka file geolocation.dart kemudian ganti isi method dengan kode ini.

    Future<Position> getPosition() async {
        await Geolocator.isLocationServiceEnabled();
        Position position = await Geolocator.getCurrentPosition();
        return position;
    }

**Langkah 2: Tambah variabel**

Tambah variabel ini di class _LocationScreenState

    @override
    void initState() {
        super.initState();
        position = getPosition();
    }

**Langkah 4: Edit method build()**

**!!ATTENTION!!**

jika anda mengalami error 'position' undefined, tambahkan ini dibawah String myPosition 

    Future<Position>? position;

Ketik kode berikut dan sesuaikan. Kode lama bisa Anda comment atau hapus.

    @override
    Widget build(BuildContext context) {
        return Scaffold(
            appBar: AppBar(title: const Text('Current Location')),
            body: Center(
                child: FutureBuilder(
                    future: position,
                    builder:
                        (BuildContext context, AsyncSnapshot<Position> snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                        return const CircularProgressIndicator();
                    } else if (snapshot.connectionState == ConnectionState.done) {
                        return Text(snapshot.data.toString());
                    } else {
                        return const Text('');
                    }
                    })));
    }

![screenshot pc](docs/Praktikum%206/ss_hp.jpeg)
![gif hape](docs/Praktikum%206/ss_hp2.jpeg)

**Soal 13**

- Apakah ada perbedaan UI dengan praktikum sebelumnya? Mengapa demikian?

answer : menampilkan koordinat Geolokasi dengan layout yang sama. Hal ini terjadi karena keduanya mengambil lokasi pengguna secara langsung saat aplikasi dimulai.

setState digunakan untuk memperbarui variabel state myPosition. Kedua, FutureBuilder digunakan untuk mengelola pembaruan UI secara otomatis. Namun pada akhirnya, hasil tampilan UI terlihat sama karena keduanya memiliki penundaan yang sama, yakni 3 detik.

- Capture hasil praktikum Anda berupa GIF dan lampirkan di README. Lalu lakukan commit dengan pesan "W12: Soal 13".

- Seperti yang Anda lihat, menggunakan FutureBuilder lebih efisien, clean, dan reactive dengan Future bersama UI.

**Langkah 5: Tambah handling error**

Tambahkan kode berikut untuk menangani ketika terjadi error. Kemudian hot restart.

    else if (snapshot.connectionState == ConnectionState.done) {
    if (snapshot.hasError) {
        return Text('Something terrible happened!');
    }
    return Text(snapshot.data.toString());
    }

![hape](docs/Praktikum%206/ss_hp2.jpeg)

**Soal 14**

- Apakah ada perbedaan UI dengan langkah sebelumnya? Mengapa demikian?

answer : tidak mengubah tampilan UI, karena langkah ini hanya menambahkan fungsi handleError() yang akan dijalankan jika terjadi kesalahan.

- Capture hasil praktikum Anda berupa GIF dan lampirkan di README. Lalu lakukan commit dengan pesan "W12: Soal 14".

it said null instead of *Something terrible happened!*

![phone](docs/Praktikum%206/ss_hp3.jpeg)

# Praktikum 8: Navigation route dengan Future Function

**Langkah 1: Buat file baru navigation_first.dart**

Buatlah file baru ini di project lib Anda.

**Langkah 2: Isi kode navigation_first.dart**

    import 'package:flutter/material.dart';

    class NavigationFirst extends StatefulWidget {
    const NavigationFirst({super.key});

    @override
    State<NavigationFirst> createState() => _NavigationFirstState();
    }

    class _NavigationFirstState extends State<NavigationFirst> {
    Color color = Colors.blue.shade700;
    @override
    Widget build(BuildContext context) {
        return Scaffold(
        backgroundColor: color,
        appBar: AppBar(title: const Text('Navigation First Screen Arya')),
        body: Center(
            child: ElevatedButton(
                child: const Text('Change color'),
                onPressed: () {
                _navigateAndGetColor(context);
                }),
        ),
        );
    }
    }

**Soal 15**

- Tambahkan nama panggilan Anda pada tiap properti title sebagai identitas pekerjaan Anda.

        appBar: AppBar(
            title: const Text('Navigation First Screen Arya'),
        ),

- Silakan ganti dengan warna tema favorit Anda.

**Langkah 3: Tambah method di class _NavigationFirstState**

Tambahkan method ini.

    Future _navigateAndGetColor(BuildContext context) async {
    color = await Navigator.push(context,
            MaterialPageRoute(builder: (context) => const NavigationSecond()),) ?? Colors.blue;
    setState(() {});
    });
    }

**Langkah 4: Buat file baru navigation_second.dart**

Buat file baru ini di project lib Anda. Silakan jika ingin mengelompokkan view menjadi satu folder dan sesuaikan impor yang dibutuhkan.

**Langkah 5: Buat class NavigationSecond dengan StatefulWidget**

    import 'package:flutter/material.dart';

    class NavigationSecond extends StatefulWidget {
    const NavigationSecond({super.key});

    @override
    State<NavigationSecond> createState() => _NavigationSecondState();
    }

    class _NavigationSecondState extends State<NavigationSecond> {
    @override
    Widget build(BuildContext context) {
        Color color;
        return Scaffold(
        appBar: AppBar(
            title: const Text('Navigation Second Screen'),
        ),
        body: Center(
            child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
                ElevatedButton(
                    child: const Text('Red'),
                    onPressed: () {
                    color = Colors.red.shade700;
                    Navigator.pop(context, color);
                    }),
                ElevatedButton(
                    child: const Text('Red'),
                    onPressed: () {
                    color = Colors.green.shade700;
                    Navigator.pop(context, color);
                    }),
                ElevatedButton(
                    child: const Text('Red'),
                    onPressed: () {
                    color = Colors.blue.shade700;
                    Navigator.pop(context, color);
                    }),
            ],
            ),
        ),
        );
    }
    }

**Langkah 6: Edit main.dart**

Lakukan edit properti home.

    home: const NavigationFirst(),

**Langkah 8: Run**

Lakukan run, jika terjadi error silakan diperbaiki.

![hape](docs/Praktikum%208/hape.gif)

**Soal 16**

- Cobalah klik setiap button, apa yang terjadi ? Mengapa demikian ?

answer : Karena setiap tombol memiliki fungsi Navigation.pop() dengan parameter context dan warna yang telah ditetapkan, warna tombol yang ditekan akan berubah sesuai dengan warna yang telah ditetapkan pada widget ElevatedButton() di class navigation_second.dart.

- Gantilah 3 warna pada langkah 5 dengan warna favorit Anda!
Capture hasil praktikum Anda berupa GIF dan lampirkan di README. Lalu lakukan commit dengan pesan "W12: Soal 16".

# Praktikum 9: Memanfaatkan async/await dengan Widget Dialog

**Langkah 1: Buat file baru navigation_dialog.dart**

Buat file dart baru di folder lib project Anda.

**Langkah 2: Isi kode navigation_dialog.dart**

    import 'package:flutter/material.dart';

    class NavigationDialogScreen extends StatefulWidget {
    const NavigationDialogScreen({super.key});

    @override
    State<NavigationDialogScreen> createState() => _NavigationDialogScreenState();
    }

    class _NavigationDialogScreenState extends State<NavigationDialogScreen> {
    @override
    Widget build(BuildContext context) {
        return Scaffold(
        backgroundColor: color,
        appBar: AppBar(
            title: const Text('Navigation Dialog Screen'),
        ),
        body: Center(
            child:
                ElevatedButton(child: const Text('Change color'), onPressed: () {}),
        ),
        );
    }
    }

**Langkah 3: Tambah method async**

    _showColorDialog(BuildContext context) async {
        await showDialog(
        barrierDismissible: false,
        context: context,
        builder: (_) {
            return AlertDialog(
            title: const Text('Very important question'),
            content: const Text('Please choose a color'),
            actions: <Widget>[
                TextButton(
                    child: const Text('Red'),
                    onPressed: () {
                    color = Colors.red.shade700;
                    Navigator.pop(context, color);
                    }),
                TextButton(
                    child: const Text('Green'),
                    onPressed: () {
                    color = Colors.green.shade700;
                    Navigator.pop(context, color);
                    }),
                TextButton(
                    child: const Text('Blue'),
                    onPressed: () {
                    color = Colors.blue.shade700;
                    Navigator.pop(context, color);
                    }),
            ],
            );
        },
        );
        setState(() {});
    }

**Langkah 4: Panggil method di ElevatedButton**

    onPressed: () {
        _showColorDialog(context);
    }),

**Langkah 5: Edit main.dart**

Ubah properti home

    home: const NavigationDialogScreen(),

**Langkah 6: Run**

Coba ganti warna background dengan widget dialog tersebut. Jika terjadi error, silakan diperbaiki. Jika berhasil, akan tampil seperti gambar berikut.

![hape](docs/Praktikum%209/hape.gif)

**Soal 17**

- Cobalah klik setiap button, apa yang terjadi ? Mengapa demikian ?

answer : Ketika menekan tombol "Change Color" dan memilih warna dalam dialog, warna latar belakang layar akan berubah. Ini terjadi karena nilai warna diubah dalam fungsi _showColorDialog dan kemudian diperbarui widget dengan menggunakan setState. Tindakan ini akan memicu pembangunan ulang widget dan menampilkan perubahan warna yang telah pilih pada layar.


- Gantilah 3 warna pada langkah 3 dengan warna favorit Anda!

- Capture hasil praktikum Anda berupa GIF dan lampirkan di README. Lalu lakukan commit dengan pesan "W12: Soal 17".