-- Buat database
CREATE DATABASE IF NOT EXISTS pms;
USE pms;

-- =========================
-- Table: users
-- =========================
CREATE TABLE users (
  id INT AUTO_INCREMENT PRIMARY KEY,
  username VARCHAR(50) NOT NULL,
  password VARCHAR(255) NOT NULL,
  nama_lengkap VARCHAR(100),
  role ENUM('admin', 'anggota') DEFAULT 'anggota'
);

INSERT INTO users (username, password, nama_lengkap, role) VALUES
('admin', 'admin123', 'Admin Project', 'admin'),
('raihan', '123456', 'Raihan Ramadhan', 'anggota'),
('ihsan', '123456', 'Ihsan Maulana', 'anggota');

-- =========================
-- Table: teams
-- =========================
CREATE TABLE teams (
  id INT AUTO_INCREMENT PRIMARY KEY,
  nama_tim VARCHAR(100) NOT NULL
);

INSERT INTO teams (nama_tim) VALUES
('Tim A'),
('Tim Backend'),
('Tim Frontend');

-- =========================
-- Table: projects
-- =========================
CREATE TABLE projects (
  id INT AUTO_INCREMENT PRIMARY KEY,
  nama_proyek VARCHAR(100) NOT NULL,
  deskripsi TEXT,
  tanggal_mulai DATE,
  tanggal_selesai DATE,
  id_tim INT,
  FOREIGN KEY (id_tim) REFERENCES teams(id) ON DELETE SET NULL
);

INSERT INTO projects (nama_proyek, deskripsi, tanggal_mulai, tanggal_selesai, id_tim) VALUES
('Project Management System', 'Aplikasi manajemen proyek', '2025-04-01', '2025-06-01', 1);

-- =========================
-- Table: tasks
-- =========================
CREATE TABLE tasks (
  id INT AUTO_INCREMENT PRIMARY KEY,
  judul VARCHAR(100),
  deskripsi TEXT,
  status ENUM('belum mulai', 'sedang dikerjakan', 'selesai') DEFAULT 'belum mulai',
  deadline DATE,
  id_proyek INT,
  id_pengguna INT,
  FOREIGN KEY (id_proyek) REFERENCES projects(id) ON DELETE CASCADE,
  FOREIGN KEY (id_pengguna) REFERENCES users(id) ON DELETE SET NULL
);

INSERT INTO tasks (judul, deskripsi, status, deadline, id_proyek, id_pengguna) VALUES
('Desain UI', 'Buat desain antarmuka aplikasi', 'sedang dikerjakan', '2025-04-20', 1, 2),
('API Login', 'Buat endpoint login', 'selesai', '2025-04-18', 1, 3);

-- =========================
-- Table: logs
-- =========================
CREATE TABLE logs (
  id INT AUTO_INCREMENT PRIMARY KEY,
  aktivitas TEXT,
  waktu TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  id_pengguna INT,
  FOREIGN KEY (id_pengguna) REFERENCES users(id) ON DELETE SET NULL
);

INSERT INTO logs (aktivitas, id_pengguna) VALUES
('Login ke sistem', 2),
('Push tugas baru', 3);

-- =========================
-- Table: reports
-- =========================
CREATE TABLE reports (
  id INT AUTO_INCREMENT PRIMARY KEY,
  judul VARCHAR(100),
  isi TEXT,
  tanggal DATE,
  id_proyek INT,
  FOREIGN KEY (id_proyek) REFERENCES projects(id) ON DELETE CASCADE
);

INSERT INTO reports (judul, isi, tanggal, id_proyek) VALUES
('Laporan Minggu 1', 'Desain dan setup database', '2025-04-15', 1);
