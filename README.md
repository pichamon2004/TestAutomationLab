# Lab4: Test Automation with Robot Framework

## เครื่องมือที่ใช้
- **Python** 3.9.6
- **Robot Framework** 7.4.1
- **SeleniumLibrary**
- **Chrome for Testing** 143.0.7499.169
- **ChromeDriver** 143.0.7499.169

## โครงสร้างโฟลเดอร์
```
TestAutomationLab/
├── Lab4/
│   ├── Registration.html    # หน้าฟอร์มลงทะเบียน
│   └── Success.html          # หน้าแสดงผลสำเร็จ
├── lab4_test.robot           # Test Script
├── log.html                  # รายงานผลการทดสอบแบบละเอียด
├── report.html               # รายงานสรุปผลการทดสอบ
└── output.xml                # ข้อมูล Output แบบ XML
```

## Test Cases
โปรเจกต์นี้ทดสอบทั้งหมด 8 กรณี แบ่งเป็น 2 Scenarios:

### Scenario 1: ลงทะเบียนสำเร็จ (UAT-Lab04-001)
1. **TC01: Register Success** - ลงทะเบียนพร้อมข้อมูลครบถ้วนรวมถึง Organization
2. **TC02: Register Success No Organization** - ลงทะเบียนสำเร็จโดยไม่กรอก Organization

### Scenario 2: ลงทะเบียนไม่สำเร็จ (UAT-Lab04-002)
3. **TC01: Empty First Name** - ไม่กรอกชื่อ
4. **TC02: Empty Last Name** - ไม่กรอกนามสกุล
5. **TC03: Empty First Name and Last Name** - ไม่กรอกทั้งชื่อและนามสกุล
6. **TC04: Empty Email** - ไม่กรอกอีเมล
7. **TC05: Empty Phone Number** - ไม่กรอกเบอร์โทรศัพท์
8. **TC06: Invalid Phone Number** - กรอกเบอร์โทรศัพท์ไม่ถูกต้อง

## การติดตั้ง

### 1. ติดตั้ง Python และ pip
```bash
python3 --version
pip3 --version
```

### 2. ติดตั้ง Robot Framework
```bash
pip3 install robotframework
```

### 3. ติดตั้ง SeleniumLibrary
```bash
pip3 install robotframework-seleniumlibrary
```

### 4. ดาวน์โหลด Chrome for Testing และ ChromeDriver
ดาวน์โหลดจาก: https://googlechromelabs.github.io/chrome-for-testing/

เช่น
- **macOS (Apple Silicon)**: mac-arm64

## วิธีการรัน Test

### 1. เปิด Web Server
เปิด Terminal หน้าต่างแรก และรันคำสั่ง:
```bash
cd TestAutomationLab/StarterFiles
python3 -m http.server 7272
```

ทิ้งไว้ให้ server รันอยู่

### 2. รัน Test Script
เปิด Terminal หน้าต่างใหม่ และรันคำสั่ง:
```bash
cd TestAutomationLab
python3 -m robot lab4_test.robot
```

### 3. ดูผลการทดสอบ
หลังจากรันเสร็จ เปิดดูรายงานได้ที่:
```bash
open report.html    # รายงานสรุป
open log.html       # รายงานละเอียด
```

## ผลการทดสอบ
**ผ่าน 7/8 test cases**

| Scenario | Test Cases | Pass | Fail |
|----------|------------|------|------|
| UAT-Lab04-001 | 2 | 2 | 0 |
| UAT-Lab04-002 | 6 | 5 | 1 |
| **รวม** | **8** | **7** | **1** |
