# Flutter: Kitman's Gallery

## Deskripsi Singkat
Aplikasi ini dibuat menggunakan Flutter dengan tema **Football Shop**.  
Aplikasi menampilkan tiga tombol utama:
- **All Products** (warna biru)  
- **My Products** (warna hijau)  
- **Create Product** (warna merah)  

Setiap tombol akan menampilkan pesan `SnackBar` yang berbeda ketika ditekan.

---

## Jawaban Pertanyaan

### 1️⃣ Apa itu *widget tree* pada Flutter dan bagaimana hubungan parent-child (induk-anak) bekerja antar widget?

**Widget tree** adalah struktur hierarki yang menggambarkan bagaimana widget tersusun dalam aplikasi Flutter.  
Setiap elemen di layar adalah **widget**, dan widget-widget ini saling terhubung membentuk **pohon (tree)** — di mana ada **widget induk (parent)** yang membungkus **widget anak (child)**.  

Contoh:
```dart
Scaffold(
  appBar: AppBar(title: Text("Football Shop")),
  body: Center(
    child: Text("Welcome!"),
  ),
)
```
- `Scaffold` adalah **parent** dari `AppBar` dan `Center`.
- `Center` adalah **parent** dari `Text`.

Hubungan parent-child ini menentukan bagaimana tampilan dibangun dari atas ke bawah.

---

### 2️⃣ Sebutkan semua widget yang kamu gunakan dalam proyek ini dan jelaskan fungsinya.

| Widget | Fungsi |
|---------|---------|
| `MaterialApp` | Widget utama aplikasi berbasis Material Design, berfungsi sebagai root. |
| `Scaffold` | Menyediakan struktur dasar halaman seperti AppBar, Body, dan Snackbar. |
| `AppBar` | Menampilkan bar di bagian atas aplikasi dengan judul. |
| `Center` | Memposisikan widget anak di tengah layar. |
| `Column` | Menyusun widget anak secara vertikal. |
| `ElevatedButton.icon` | Tombol dengan ikon dan teks yang dapat ditekan. |
| `SnackBar` | Menampilkan pesan sementara di bagian bawah layar. |
| `Icon` | Menampilkan ikon di dalam tombol. |
| `Text` | Menampilkan teks statis. |

---

### 3️⃣ Apa fungsi dari widget `MaterialApp`? Mengapa widget ini sering digunakan sebagai widget root?

`MaterialApp` berfungsi untuk:
- Menyediakan *theme*, *routing*, dan *navigation* bagi seluruh aplikasi.  
- Mengatur *title*, *home widget*, dan konfigurasi dasar aplikasi.  
- Mengaktifkan gaya visual **Material Design** agar tampilan aplikasi konsisten dengan aplikasi Android modern.  

Oleh karena itu, `MaterialApp` sering digunakan sebagai **widget root**, karena semua widget lain di dalamnya dapat memakai komponen Material Design.

---

### 4️⃣ Jelaskan perbedaan antara `StatelessWidget` dan `StatefulWidget`. Kapan kamu memilih salah satunya?

| Jenis Widget | Ciri | Contoh Penggunaan |
|---------------|------|-------------------|
| **StatelessWidget** | Tidak memiliki *state* yang berubah; tampilannya tetap. | Teks statis, ikon, layout sederhana. |
| **StatefulWidget** | Memiliki *state* yang bisa berubah selama runtime, bisa diperbarui dengan `setState()`. | Tombol interaktif, form input, counter, dll. |

Gunakan:
- **`StatelessWidget`** jika tampilan tidak berubah.
- **`StatefulWidget`** jika tampilan berubah karena interaksi pengguna atau data baru.

---

### 5️⃣ Apa itu `BuildContext` dan mengapa penting di Flutter? Bagaimana penggunaannya di metode `build`?

`BuildContext` adalah objek yang menyimpan informasi tentang **posisi widget dalam widget tree**.  
Flutter menggunakannya untuk:
- Menemukan widget parent atau child tertentu.  
- Menampilkan `SnackBar` menggunakan `ScaffoldMessenger.of(context).showSnackBar()`.  
- Mengakses tema dengan `Theme.of(context)`.

Dalam metode `build`, `BuildContext` digunakan agar widget tahu di mana posisinya berada dan bagaimana tampilannya harus dibangun dalam hierarki widget.

---

### 6️⃣ Jelaskan konsep *hot reload* di Flutter dan bagaimana bedanya dengan *hot restart*.

| Konsep | Penjelasan | Dampak |
|--------|-------------|--------|
| **Hot Reload** | Memperbarui kode aplikasi tanpa menghapus *state* saat ini. Hanya mengganti bagian yang berubah di widget tree. | Cepat; cocok untuk melihat perubahan UI langsung tanpa kehilangan data atau posisi layar. |
| **Hot Restart** | Memulai ulang seluruh aplikasi dari awal, menghapus semua *state* yang tersimpan. | Lebih lambat; semua variabel dan state kembali ke kondisi awal. |

**Singkatnya:**
- Gunakan *hot reload* untuk perubahan kecil (UI, teks, layout).  
- Gunakan *hot restart* jika mengubah logika inisialisasi atau variabel global.

---

### Kesimpulan
Konsep dasar Flutter berpusat pada widget — mulai dari struktur (widget tree), perilaku (state), hingga interaksi (context).  
Pemahaman tentang perbedaan `StatelessWidget`, `StatefulWidget`, dan penggunaan `MaterialApp` akan sangat membantu dalam membangun aplikasi Flutter yang efisien dan mudah dikembangkan.
