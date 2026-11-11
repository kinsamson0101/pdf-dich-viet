# pdf-dich-viet — Dịch cả file PDF sang tiếng Việt, giữ nguyên bố cục

Bản cài 1 click cho Windows của [PDFMathTranslate](https://github.com/PDFMathTranslate/PDFMathTranslate),
đã sửa để xếp chữ tiếng Việt đẹp hơn. Hình, bảng, công thức vẫn nằm đúng chỗ.
Ra 2 file: bản tiếng Việt và bản song ngữ. Không cần tài khoản, không cần key.

## Cài (1 lần, ~550 MB)

1. Tải repo này: nút **Code → Download ZIP**, giải nén ra 1 thư mục.
2. Bấm đúp `cai-dat.bat`. Script tải bản Windows chính thức v1.9.11 từ GitHub của tác giả, giải nén, rồi chép bản sửa tiếng Việt.

## Dịch

- **Kéo thả** 1 hoặc nhiều file PDF vào `dich-pdf.bat`.
- File dịch nằm cạnh file gốc: `ten-file-mono.pdf` (tiếng Việt), `ten-file-dual.pdf` (song ngữ).
- Tốc độ đo thử: 3 trang ≈ 35–45 giây, tuỳ mạng.

## Lưu ý

- Dịch bằng Bing Dịch miễn phí: chữ trong file được gửi tới Microsoft Bing để dịch. Tài liệu mật thì đừng dùng.
- Google Dịch miễn phí hay bị chặn (lỗi 429) ở mạng Việt Nam, nên bản này dùng Bing.
- Chữ nằm trong hình (ảnh chụp, sơ đồ) không được dịch.
- Hợp nhất với PDF có chữ (xuất từ Word, bài báo, sách điện tử). PDF scan cần OCR trước.
- Lỗi thiếu VC++: chạy file `vc_redist.x64.exe` có sẵn trong thư mục `pdf2zh\build`.

## Đã sửa gì so với bản gốc

`patch/converter.py` (thay đổi xem ở `patch/converter.diff`):

- Xuống dòng ở dấu cách, không cắt đôi chữ ("cuộc số / ng" → "cuộc / sống").
- Đoạn gốc chỉ 1 dòng mà bản dịch dài hơn: thu nhỏ chữ (tối thiểu 70%) thay vì tràn lề.
- Giãn dòng tiếng Việt 1,3 để dấu không chạm dòng trên.

## Nguồn và giấy phép

- Engine: [PDFMathTranslate](https://github.com/PDFMathTranslate/PDFMathTranslate) của nhóm PDFMathTranslate.
- Repo này dùng cùng giấy phép **AGPL-3.0** (file `LICENSE`), vì có chứa bản sửa của `converter.py`.
