ALTER TABLE NhaHang
ADD TrangThai VARCHAR(50) NOT NULL
    DEFAULT 'Đang mở cửa'
    CHECK (TrangThai IN ('Đang mở cửa', 'Đã đóng cửa', 'Đóng cửa vĩnh viễn'));
GO

ALTER TABLE NhaHang
ADD HinhAnh NVARCHAR(255);
GO

CREATE TABLE DanhGiaNhaHang (
    MaDGNH INT PRIMARY KEY,
    MoTaDanhGia VARCHAR(500),
    DiemDG DECIMAL(3, 1) NOT NULL CHECK (DiemDG >= 0 AND DiemDG <= 10),
    MaKH NVARCHAR(20) NOT NULL,  -- Đã chuyển sang NVARCHAR
    MaNH NVARCHAR(10) NOT NULL,  -- Đã chuyển sang NVARCHAR
    
    -- Thiết lập Khóa Ngoại (Foreign Key) cho MaKH
    FOREIGN KEY (MaKH) REFERENCES KhachHang(MaKH),
    
    -- Thiết lập Khóa Ngoại (Foreign Key) cho MaNH
    FOREIGN KEY (MaNH) REFERENCES NhaHang(MaNH)
);
GO

CREATE TABLE LichSuGioHang (
	MaGH	NVARCHAR(20) PRIMARY KEY,
	MaNH	NVARCHAR(10) NOT NULL,
	MaMon	NVARCHAR(20) NOT NULL,
	SoLuong	INT NOT NULL,
	DonGia	DECIMAL (12,2) NOT NULL,
	TongTien	DECIMAL(12,2)NOT NULL,
	ThoiGianChon	DATETIME NOT NULL,
	MaKH	NVARCHAR(20) NOT NULL,

	FOREIGN KEY (MaNH) REFERENCES NhaHang(MaNH),
	FOREIGN KEY (MaKH) REFERENCES KhachHang(MaKH),
	FOREIGN KEY (MaMon) REFERENCES MonAn(MaMon)
);
GO

ALTER TABLE LoaiMonAn
ADD HinhAnh NVARCHAR(50)
GO

ALTER TABLE MonAn
ADD HinhAnh NVARCHAR(50)
GO

INSERT INTO DanhGiaNhaHang (MaDGNH, MoTaDanhGia, DiemDG, MaKH, MaNH)
VALUES
(1, N'Đồ ăn ngon, phục vụ nhanh chóng. Chắc chắn sẽ quay lại.', 9.0, N'KH001', N'NH001'),
(2, N'Không gian đẹp nhưng món ăn hơi nhạt so với mong đợi.', 7.5, N'KH003', N'NH002'),
(3, N'Trải nghiệm tuyệt vời! Nhân viên thân thiện và đồ uống rất sáng tạo.', 10.0, N'KH002', N'NH003'),
(4, N'Giá hơi cao nhưng chất lượng xứng đáng. Món cá hồi rất tươi.', 8.5, N'KH004', N'NH001'),
(5, N'Thời gian chờ lâu, nhưng món chính rất ngon. Cần cải thiện tốc độ phục vụ.', 6.0, N'KH001', N'NH003'),
(6, N'Món phở tuyệt hảo, nước dùng đậm đà hương vị truyền thống.', 9.5, N'KH005', N'NH004'),
(7, N'Kem ngon, tráng miệng hoàn hảo. Địa điểm lý tưởng cho hẹn hò.', 8.8, N'KH006', N'NH005'),
(8, N'Thịt nướng vừa tới, gia vị thấm đều. Rất ưng ý.', 9.2, N'KH007', N'NH006'),
(9, N'Thức uống không đặc sắc, nhưng view rất đẹp và thoáng đãng.', 7.0, N'KH008', N'NH007'),
(10, N'Hải sản tươi sống, giá cả phải chăng. Sẽ giới thiệu cho bạn bè.', 9.8, N'KH009', N'NH008'),
(11, N'Pizza đế mỏng giòn, topping phong phú. Rất đáng tiền.', 8.7, N'KH010', N'NH009'),
(12, N'Buffet đa dạng, tuy nhiên khu vực ăn hơi chật chội.', 7.8, N'KH001', N'NH010'), -- Đã sửa KH011 -> KH001
(13, N'Món chay thanh đạm, chế biến tinh tế. Rất hài lòng.', 9.5, N'KH002', N'NH004'), -- Đã sửa KH012 -> KH002
(14, N'Bánh ngọt quá ngọt, không phù hợp khẩu vị của tôi.', 5.5, N'KH001', N'NH005'),
(15, N'Phục vụ chu đáo, luôn sẵn sàng hỗ trợ khách hàng.', 8.9, N'KH002', N'NH006'),
(16, N'Âm nhạc quá lớn gây khó chịu khi ăn.', 6.5, N'KH003', N'NH007'),
(17, N'Mực nướng bị dai, có lẽ do nướng quá lửa.', 6.8, N'KH004', N'NH008'),
(18, N'Pasta sốt kem ngon nhất tôi từng ăn ở thành phố này.', 10.0, N'KH005', N'NH009'),
(19, N'Rất nhiều lựa chọn món Nhật, sashimi tươi rói.', 9.4, N'KH003', N'NH010'), -- Đã sửa KH013 -> KH003
(20, N'Đầu bếp có tay nghề cao, món ăn được trình bày đẹp mắt.', 9.1, N'KH004', N'NH001'), -- Đã sửa KH014 -> KH004
(21, N'Bàn ghế không sạch sẽ lắm, cần cải thiện vệ sinh.', 5.0, N'KH005', N'NH002'), -- Đã sửa KH015 -> KH005
(22, N'Cà phê ngon, không gian làm việc lý tưởng.', 8.2, N'KH006', 'NH003'),
(23, N'Thịt bò bít tết mềm tan chảy, xứng đáng với mức giá cao.', 9.6, N'KH007', N'NH001'),
(24, N'Gà rán giòn rụm, bé nhà tôi rất thích.', 8.5, N'KH008', N'NH002'),
(25, N'Lần đầu thử món này và rất ấn tượng. Hương vị độc đáo.', 9.7, N'KH009', N'NH004'),
(26, N'Không khí ấm cúng, thích hợp cho bữa tối gia đình.', 8.3, N'KH010', N'NH006'),
(27, N'Hơi thất vọng về món súp, không đủ nóng.', 6.9, N'KH001', N'NH007'), -- Đã sửa KH011 -> KH001
(28, N'Rượu vang được lựa chọn kỹ lưỡng, rất hợp với món ăn.', 9.3, N'KH002', N'NH008'), -- Đã sửa KH012 -> KH002
(29, N'Thời gian giao hàng nhanh, thức ăn vẫn còn nóng.', 8.6, N'KH003', N'NH009'), -- Đã sửa KH013 -> KH003
(30, N'Chỗ đậu xe khó khăn, là điểm trừ lớn.', 6.2, N'KH004', N'NH010'), -- Đã sửa KH014 -> KH004
(31, N'Bánh mì kẹp tươi, nguyên liệu sạch sẽ.', 8.0, N'KH001', N'NH002'),
(32, N'Quầy bar phục vụ chậm trong giờ cao điểm.', 7.3, N'KH004', N'NH003'),
(33, N'Món lẩu thái cay nồng, rất hợp khẩu vị mùa đông.', 9.5, N'KH005', N'NH005'),
(34, N'Gia đình tôi có một bữa ăn tối vui vẻ ở đây.', 8.4, N'KH007', N'NH001'),
(35, N'Giá cả phải chăng cho một bữa ăn trưa chất lượng.', 7.9, N'KH005', N'NH006'), -- Đã sửa KH015 -> KH005s
(36, N'Món chay tuyệt vời, hương vị tự nhiên và thanh đạm.', 9.5, N'KH001', N'NH011'),
(37, N'Bánh mì kẹp tươi, phục vụ nhanh chóng. Hoàn hảo cho bữa trưa.', 8.8, N'KH002', N'NH012'),
(38, N'Lẩu nấm ngon, nước dùng ngọt tự nhiên. Rất hài lòng.', 9.0, N'KH003', N'NH013'),
(39, N'Cà phê đậm đà, không gian ấm cúng. Điểm đến yêu thích.', 8.5, N'KH004', N'NH014'),
(40, N'Pizza hải sản chất lượng cao, lớp phô mai béo ngậy.', 9.2, N'KH005', N'NH015'),
(41, N'Thịt nướng tảng mềm, sốt BBQ ngon xuất sắc.', 9.8, N'KH006', N'NH016'),
(42, N'Hải sản tươi sống, chế biến đơn giản nhưng tinh tế.', 9.3, N'KH007', N'NH017'),
(43, N'Món Thái chua cay chuẩn vị, rất kích thích.', 9.0, N'KH008', N'NH018'),
(44, N'Súp cua ngon, giá cả phải chăng.', 8.6, N'KH009', N'NH019'),
(45, N'Bánh cuốn nóng hổi, nhân đầy đặn.', 8.9, N'KH010', N'NH020'),
(46, N'Sushi tươi nhưng cơm hơi khô. Cần cải thiện.', 7.5, N'KH001', N'NH021'),
(47, N'Món Ý truyền thống, pasta hoàn hảo.', 9.4, N'KH002', N'NH022'),
(48, N'Đồ uống sáng tạo, pha chế đẹp mắt.', 8.7, N'KH003', N'NH023'),
(49, N'Không gian quá ồn ào. Đồ ăn tạm ổn.', 6.5, N'KH004', N'NH024'),
(50, N'Tráng miệng tuyệt vời! Đặc biệt là tiramisu.', 9.6, N'KH005', N'NH025'),
(51, N'Phục vụ chậm trong giờ cao điểm, nhưng nhân viên lịch sự.', 7.8, N'KH006', N'NH026'),
(52, N'Các món nướng Hàn Quốc rất ngon, giá hơi cao.', 9.1, N'KH007', N'NH027'),
(53, N'Món chay không được đa dạng lắm, hy vọng thêm lựa chọn.', 8.0, N'KH008', N'NH028'),
(54, N'Thịt bò Wagyu mềm tan chảy, một trải nghiệm ẩm thực.', 10.0, N'KH009', N'NH029'),
(55, N'Đồ ăn giao hàng còn nóng, đóng gói cẩn thận.', 8.8, N'KH010', N'NH030'),
(56, N'Nước ép trái cây tươi ngon, không pha đường.', 9.0, N'KH001', N'NH031'),
(57, N'Kem handmade với hương vị độc đáo.', 9.2, N'KH002', N'NH032'),
(58, N'Phở cuốn thanh mát, nước chấm vừa miệng.', 8.5, N'KH003', N'NH033'),
(59, N'Thức ăn hợp vệ sinh, cảm thấy an tâm.', 9.3, N'KH004', N'NH034'),
(60, N'Bánh ngọt và trà chiều tuyệt vời.', 9.7, N'KH005', N'NH035'),
(61, N'Bún chả ngon, thịt nướng thơm lừng, nước chấm đậm đà.', 9.2, N'KH006', N'NH036'),
(62, N'Đồ ăn tươi nhưng trang trí hơi đơn giản. Không gian rộng rãi.', 8.1, N'KH007', N'NH037'),
(63, N'Món Hàn Quốc chuẩn vị, đặc biệt là kimbap và tokbokki.', 9.5, N'KH008', N'NH038'),
(64, N'Kem lạnh ngon, nhưng giá khá cao so với mặt bằng chung.', 7.5, N'KH009', N'NH039'),
(65, N'Phục vụ quá nhiệt tình, cảm giác như được chăm sóc đặc biệt.', 9.8, N'KH010', N'NH040'),
(66, N'Món chay fusion rất ấn tượng, hương vị độc đáo và mới lạ.', 9.3, N'KH001', N'NH041'),
(67, N'Bữa sáng tuyệt vời! Bánh pancake xốp mềm và trái cây tươi.', 8.8, N'KH002', N'NH042'),
(68, N'Hải sản tươi ngon và giá hợp lý. Ăn no mà không lo về giá.', 9.0, N'KH003', N'NH043'),
(69, N'Cà phê rang xay thủ công, mùi thơm khó cưỡng.', 9.4, N'KH004', N'NH044'),
(70, N'Bánh kem sinh nhật đặt ở đây rất ngon và đẹp mắt.', 9.7, N'KH005', N'NH045'),
(71, N'Thịt nướng cay quá, không phù hợp với người ăn ít cay.', 7.0, N'KH006', N'NH046'),
(72, N'Rượu vang kết hợp món ăn rất tốt. Nhân viên am hiểu về rượu.', 9.1, N'KH007', N'NH047'),
(73, N'Đồ ăn giao nhanh, nhưng bao bì bị lỏng lẻo.', 7.9, N'KH008', N'NH048'),
(74, N'Lần thứ hai quay lại. Chất lượng vẫn được giữ vững.', 8.5, N'KH009', N'NH049'),
(75, N'Không gian lãng mạn, thích hợp cho các cặp đôi.', 9.6, N'KH010', N'NH050');
GO

-- Sử dụng cú pháp UPDATE để cập nhật cột HinhAnha
UPDATE NhaHang SET HinhAnh = N'comtam_saigon.jpg' WHERE MaNH = N'NH001';
UPDATE NhaHang SET HinhAnh = N'pho_truyenthong.jpg' WHERE MaNH = N'NH002';
UPDATE NhaHang SET HinhAnh = N'bunbo_hue.jpg' WHERE MaNH = N'NH003';
UPDATE NhaHang SET HinhAnh = N'pizza_italy.jpg' WHERE MaNH = N'NH004';
UPDATE NhaHang SET HinhAnh = N'lau_thai.jpg' WHERE MaNH = N'NH005';
UPDATE NhaHang SET HinhAnh = N'sushi_hokkaido.jpg' WHERE MaNH = N'NH006';
UPDATE NhaHang SET HinhAnh = N'banhcanh_cua.jpg' WHERE MaNH = N'NH007';
UPDATE NhaHang SET HinhAnh = N'comnieu_saigon.jpg' WHERE MaNH = N'NH008';
UPDATE NhaHang SET HinhAnh = N'lau_nuong_daiphat.jpg' WHERE MaNH = N'NH009';
UPDATE NhaHang SET HinhAnh = N'ga_ran_toky.jpg' WHERE MaNH = N'NH010';

UPDATE NhaHang SET HinhAnh = N'highlands_coffee.jpg' WHERE MaNH = N'NH011';
UPDATE NhaHang SET HinhAnh = N'mi_cay_seoul.jpg' WHERE MaNH = N'NH012';
UPDATE NhaHang SET HinhAnh = N'lau_bo_batoa.jpg' WHERE MaNH = N'NH013';
UPDATE NhaHang SET HinhAnh = N'com_ga_xoi_mo.jpg' WHERE MaNH = N'NH014';
UPDATE NhaHang SET HinhAnh = N'oc_dem.jpg' WHERE MaNH = N'NH015';
UPDATE NhaHang SET HinhAnh = N'kichi_kichi.jpg' WHERE MaNH = N'NH016';
UPDATE NhaHang SET HinhAnh = N'banh_mi_huynh_hoa.jpg' WHERE MaNH = N'NH017';
UPDATE NhaHang SET HinhAnh = N'com_chay_tinhtam.jpg' WHERE MaNH = N'NH018';
UPDATE NhaHang SET HinhAnh = N'hu_tieu_thanhdat.jpg' WHERE MaNH = N'NH019';
UPDATE NhaHang SET HinhAnh = N'chay_annhien.jpg' WHERE MaNH = N'NH020';

UPDATE NhaHang SET HinhAnh = N'bundau_hangkhay.jpg' WHERE MaNH = N'NH021';
UPDATE NhaHang SET HinhAnh = N'pizza_company.jpg' WHERE MaNH = N'NH022';
UPDATE NhaHang SET HinhAnh = N'buncha_1986.jpg' WHERE MaNH = N'NH023';
UPDATE NhaHang SET HinhAnh = N'lau_nam_ashima.jpg' WHERE MaNH = N'NH024';
UPDATE NhaHang SET HinhAnh = N'ga_u_muoi.jpg' WHERE MaNH = N'NH025';
UPDATE NhaHang SET HinhAnh = N'comnieu_viendong.jpg' WHERE MaNH = N'NH026';
UPDATE NhaHang SET HinhAnh = N'lau_nuong_panda.jpg' WHERE MaNH = N'NH027';
UPDATE NhaHang SET HinhAnh = N'pho_thin.jpg' WHERE MaNH = N'NH028';
UPDATE NhaHang SET HinhAnh = N'banhxeo_mientay.jpg' WHERE MaNH = N'NH029';
UPDATE NhaHang SET HinhAnh = N'bun_rieu_ganh.jpg' WHERE MaNH = N'NH030';

UPDATE NhaHang SET HinhAnh = N'steak_cowboyjack.jpg' WHERE MaNH = N'NH031';
UPDATE NhaHang SET HinhAnh = N'com_ga_hainam.jpg' WHERE MaNH = N'NH032';
UPDATE NhaHang SET HinhAnh = N'sushi_shin.jpg' WHERE MaNH = N'NH033';
UPDATE NhaHang SET HinhAnh = N'bun_mam_coba.jpg' WHERE MaNH = N'NH034';
UPDATE NhaHang SET HinhAnh = N'lau_cua_dong.jpg' WHERE MaNH = N'NH035';
UPDATE NhaHang SET HinhAnh = N'com_nha_que.jpg' WHERE MaNH = N'NH036';
UPDATE NhaHang SET HinhAnh = N'banh_uot_banme.jpg' WHERE MaNH = N'NH037';
UPDATE NhaHang SET HinhAnh = N'bbq_hanquoc.jpg' WHERE MaNH = N'NH038';
UPDATE NhaHang SET HinhAnh = N'ga_nuong_lu.jpg' WHERE MaNH = N'NH039';
UPDATE NhaHang SET HinhAnh = N'oc_quanhannh.jpg' WHERE MaNH = N'NH040';

UPDATE NhaHang SET HinhAnh = N'lau_ca_keo.jpg' WHERE MaNH = N'NH041';
UPDATE NhaHang SET HinhAnh = N'banh_mi_pewpew.jpg' WHERE MaNH = N'NH042';
UPDATE NhaHang SET HinhAnh = N'banh_canh_trang_bang.jpg' WHERE MaNH = N'NH043';
UPDATE NhaHang SET HinhAnh = N'nhat_sakura.jpg' WHERE MaNH = N'NH044';
UPDATE NhaHang SET HinhAnh = N'lau_de_tusuu.jpg' WHERE MaNH = N'NH045';
UPDATE NhaHang SET HinhAnh = N'com_nieu_huong_viet.jpg' WHERE MaNH = N'NH046';
UPDATE NhaHang SET HinhAnh = N'gogi_house.jpg' WHERE MaNH = N'NH047';
UPDATE NhaHang SET HinhAnh = N'highlands_vanhanh.jpg' WHERE MaNH = N'NH048';
UPDATE NhaHang SET HinhAnh = N'lau_bo_saigon.jpg' WHERE MaNH = N'NH049';
UPDATE NhaHang SET HinhAnh = N'pho_24.jpg' WHERE MaNH = N'NH050';
GO

DELETE FROM DanhGia;
DELETE FROM ChiTietDonHang;
DELETE FROM DonHang;
DELETE FROM MonAn;
GO

INSERT INTO MonAn (MaMon, MaNH, TenMon, MaLoai, Gia, MoTa)
VALUES
-- NH001: Com Tam Cali (Com)
(N'MA001', N'NH001', N'Cơm Tấm Sườn Bì Chả', N'Com', 65000, N'Cơm tấm đặc trưng, sườn nướng, bì sợi, chả trứng.'),
(N'MA002', N'NH001', N'Cơm Tấm Sườn Trứng', N'Com', 55000, N'Cơm tấm với sườn nướng và trứng ốp la.'),
(N'MA003', N'NH001', N'Canh Rong Biển', N'AnVat', 20000, N'Canh rong biển tươi nấu cùng thịt băm.'),

-- NH002: Pho Thin Sai Gon (Pho)
(N'MA004', N'NH002', N'Phở Tái Nạm', N'Pho', 75000, N'Phở bò với thịt tái và nạm bò chín.'),
(N'MA005', N'NH002', N'Phở Gầu', N'Pho', 80000, N'Phở bò với gầu bò giòn sần sật.'),
(N'MA006', N'NH002', N'Phở Thập Cẩm', N'Pho', 85000, N'Phở có đủ loại thịt: tái, nạm, gầu, gân.'),

-- NH003: Bun Cha Ha Noi 2 (Bun)
(N'MA007', N'NH003', N'Bún Chả Đầy Đủ', N'Bun', 70000, N'Bún chả nem và thịt nướng, suất lớn.'),
(N'MA008', N'NH003', N'Nem Cua Bể', N'AnVat', 50000, N'Nem cua bể chiên giòn, nhân đầy đặn.'),
(N'MA009', N'NH003', N'Bún Chả Lá Lốt', N'Bun', 65000, N'Thịt heo nướng gói lá lốt thơm lừng.'),

-- NH004: Pizza 4Ps (Pizza)
(N'MA010', N'NH004', N'Pizza 4 Cheese', N'Pizza', 250000, N'Pizza với 4 loại phô mai đặc trưng.'),
(N'MA011', N'NH004', N'Pizza Hải Sản', N'Pizza', 280000, N'Pizza với tôm, mực, nghêu tươi ngon.'),
(N'MA012', N'NH004', N'Salad Caesar', N'AnVat', 90000, N'Salad rau xanh, thịt gà, sốt Caesar.'),

-- NH005: Lau Thai TomYum (Lau)
(N'MA013', N'NH005', N'Lẩu Thái TomYum', N'Lau', 290000, N'Nước lẩu chua cay chuẩn Thái, hải sản tươi.'),
(N'MA014', N'NH005', N'Gỏi Xoài Hải Sản', N'Haisan', 120000, N'Gỏi xoài xanh trộn tôm mực, chua ngọt.'),
(N'MA015', N'NH005', N'Mì Xào Thái', N'Mi', 85000, N'Mì xào kiểu Thái với rau củ và thịt.'),

-- NH006: Sushi Hokkaido (Sushi)
(N'MA016', N'NH006', N'Sushi Set Đặc Biệt', N'Sushi', 350000, N'Combo sushi đa dạng loại: nigiri, maki, sashimi.'),
(N'MA017', N'NH006', N'Sashimi Cá Hồi', N'Sushi', 190000, N'Lát cá hồi tươi sống, mềm béo.'),
(N'MA018', N'NH006', N'Tempura Tôm', N'AnVat', 95000, N'Tôm chiên bột giòn tan kiểu Nhật.'),

-- NH007: Banh Canh Cua Ut Le (Mi/Bánh Canh)
(N'MA019', N'NH007', N'Bánh Canh Cua', N'Mi', 70000, N'Bánh canh cua đậm đà, thịt cua tươi.'),
(N'MA020', N'NH007', N'Chả Cua', N'Haisan', 35000, N'Chả cua hấp thơm ngon, dai giòn.'),
(N'MA021', N'NH007', N'Nước Cam Tươi', N'AnVat', 30000, N'Nước cam vắt tươi nguyên chất.'),

-- NH008: Com Nieu Sai Gon (Com)
(N'MA022', N'NH008', N'Cơm Niêu Cá Lóc Kho Tộ', N'Com', 130000, N'Cá lóc kho tộ với cơm niêu cháy giòn.'),
(N'MA023', N'NH008', N'Canh Chua Cá Lóc', N'Com', 90000, N'Canh chua nấu theo kiểu miền Nam.'),
(N'MA024', N'NH008', N'Rau Muống Xào Tỏi', N'Com', 45000, N'Rau muống xanh xào tỏi thơm lừng.'),

-- NH009: Lau Nuong Dai Phat (Lau)
(N'MA025', N'NH009', N'Lẩu Bò Nhúng Ớt', N'Lau', 280000, N'Lẩu bò cay xé lưỡi, nước dùng đậm đà.'),
(N'MA026', N'NH009', N'Ba Chỉ Bò Nướng', N'AnVat', 150000, N'Ba chỉ bò nướng mềm, ăn kèm sốt đặc biệt.'),
(N'MA027', N'NH009', N'Coca Cola Lon', N'AnVat', 20000, N'Nước ngọt có ga giải khát.'),

-- NH010: Ga Ran Toky (AnVat)
(N'MA028', N'NH010', N'Gà Rán Miếng', N'AnVat', 35000, N'Miếng gà rán giòn tan.'),
(N'MA029', N'NH010', N'Khoai Tây Chiên', N'AnVat', 40000, N'Khoai tây chiên giòn, rắc phô mai.'),
(N'MA030', N'NH010', N'Combo Gà & Khoai', N'AnVat', 70000, N'2 miếng gà rán, 1 phần khoai tây chiên.'),

-- NH011: Highlands Coffee Pasteur (Pho, Trasua, AnVat)
(N'MA031', N'NH011', N'Phin Sữa Đá', N'Pho', 39000, N'Cà phê phin truyền thống với sữa đặc.'),
(N'MA032', N'NH011', N'Trà Sen Vàng', N'Trasua', 45000, N'Trà sen kết hợp hạt sen và củ năng.'),
(N'MA033', N'NH011', N'Bánh Mì Kẹp Thịt', N'AnVat', 49000, N'Bánh mì kẹp thịt xông khói và rau tươi.'),

-- NH012: Mi Cay Seoul (Mi)
(N'MA034', N'NH012', N'Mì Cay Hải Sản Cấp 7', N'Mi', 89000, N'Mì cay với đủ loại hải sản, cấp độ cay cao nhất.'),
(N'MA035', N'NH012', N'Mì Cay Bò', N'Mi', 75000, N'Mì cay với thịt bò lát mỏng.'),
(N'MA036', N'NH012', N'Kim Chi', N'AnVat', 30000, N'Kim chi cải thảo truyền thống.'),

-- NH013: Lau Bo Ba Toa (Lau)
(N'MA037', N'NH013', N'Lẩu Bò Ba Toa', N'Lau', 350000, N'Lẩu bò đặc trưng với bắp, gân, đuôi bò.'),
(N'MA038', N'NH013', N'Bò Bóp Thấu', N'AnVat', 140000, N'Bò tái trộn gia vị, ăn kèm bánh đa.'),
(N'MA039', N'NH013', N'Mì Trứng', N'Mi', 20000, N'Phần mì trứng ăn kèm lẩu.'),

-- NH014: Com Ga Xoi Mo A Chay (Com)
(N'MA040', N'NH014', N'Cơm Gà Xối Mỡ Đùi', N'Com', 55000, N'Cơm gà chiên giòn, phần đùi gà to.'),
(N'MA041', N'NH014', N'Cơm Gà Xối Mỡ Xé', N'Com', 50000, N'Cơm gà chiên giòn, gà xé phay trộn gỏi.'),
(N'MA042', N'NH014', N'Trà Đá', N'AnVat', 5000, N'Nước trà đá giải khát.'),

-- NH015: Oc Dem 102 (Haisan)
(N'MA043', N'NH015', N'Ốc Hương Xào Bơ Tỏi', N'Haisan', 150000, N'Ốc hương tươi, xào bơ tỏi thơm lừng.'),
(N'MA044', N'NH015', N'Sò Điệp Nướng Mỡ Hành', N'Haisan', 120000, N'Sò điệp lớn nướng than, mỡ hành béo ngậy.'),
(N'MA045', N'NH015', N'Rau Muống Luộc', N'Com', 30000, N'Rau muống luộc chấm chao.'),

-- NH016: Kichi Kichi Vincom (Lau)
(N'MA046', N'NH016', N'Buffet Lẩu', N'Lau', 299000, N'Thưởng thức buffet lẩu không giới hạn.'),
(N'MA047', N'NH016', N'Nước Lẩu Thái', N'Lau', 0, N'Nước lẩu Thái chua cay (đã bao gồm trong buffet).'),
(N'MA048', N'NH016', N'Đĩa Thịt Bò Mỹ', N'Lau', 0, N'Thịt bò Mỹ tươi ngon (đã bao gồm trong buffet).'),

-- NH017: Banh Mi Huynh Hoa (AnVat)
(N'MA049', N'NH017', N'Bánh Mì Thập Cẩm Đặc Biệt', N'AnVat', 65000, N'Bánh mì đầy đủ patê, chả lụa, thịt nguội.'),
(N'MA050', N'NH017', N'Bánh Mì Chả Lụa', N'AnVat', 45000, N'Bánh mì với chả lụa và rau dưa.'),
(N'MA051', N'NH017', N'Bánh Mì Patê', N'AnVat', 40000, N'Bánh mì chỉ có patê và rau.'),

-- NH018: Com Chay Tinh Tam (Chay)
(N'MA052', N'NH018', N'Cơm Chay Lá Sen', N'Chay', 70000, N'Cơm gói lá sen, ăn kèm các món chay.'),
(N'MA053', N'NH018', N'Phở Chay', N'Chay', 60000, N'Phở nước dùng nấm và rau củ.'),
(N'MA054', N'NH018', N'Gỏi Cuốn Chay', N'Chay', 45000, N'Gỏi cuốn rau củ, đậu hũ, chấm sốt đậu phộng.'),

-- NH019: Hu Tieu Nam Vang Thanh Dat (Mi)
(N'MA055', N'NH019', N'Hủ Tiếu Nam Vang Khô', N'Mi', 60000, N'Hủ tiếu Nam Vang trộn, nước súp riêng.'),
(N'MA056', N'NH019', N'Hủ Tiếu Nam Vang Nước', N'Mi', 60000, N'Hủ tiếu Nam Vang nước dùng đậm đà.'),
(N'MA057', N'NH019', N'Nước Sâm Lạnh', N'AnVat', 25000, N'Nước sâm mát lạnh giải nhiệt.'),

-- NH020: Nha Hang Chay An Nhien (Chay)
(N'MA058', N'NH020', N'Cơm Chiên Nấm Tràm', N'Chay', 75000, N'Cơm chiên với nấm tràm đặc sản.'),
(N'MA059', N'NH020', N'Lẩu Nấm Chay', N'Chay', 250000, N'Lẩu nấm đủ loại, nước dùng thanh.'),
(N'MA060', N'NH020', N'Nước Ép Ổi', N'AnVat', 35000, N'Nước ép ổi tươi nguyên chất.'),

-- NH021: Bun Dau Mam Tom Hang Khay (Bun)
(N'MA061', N'NH021', N'Bún Đậu Mẹt Đầy Đủ', N'Bun', 99000, N'Đậu, bún, chả cốm, nem chua, thịt luộc.'),
(N'MA062', N'NH021', N'Chả Cốm', N'AnVat', 40000, N'Chả cốm chiên giòn, thơm mùi cốm.'),
(N'MA063', N'NH021', N'Bún Lá', N'Bun', 10000, N'Phần bún thêm.'),

-- NH022: Pizza Company Nguyen Trai (Pizza)
(N'MA064', N'NH022', N'Pizza Aloha', N'Pizza', 189000, N'Pizza với thịt nguội và dứa.'),
(N'MA065', N'NH022', N'Pizza Hawaiian', N'Pizza', 199000, N'Pizza nhân hải sản kiểu Hawaii.'),
(N'MA066', N'NH022', N'Gà Nướng Tỏi', N'AnVat', 89000, N'Đùi gà nướng sốt tỏi mật ong.'),

-- NH023: Bun Cha Ha Noi 1986 (Bun)
(N'MA067', N'NH023', N'Bún Chả Nem Rán', N'Bun', 65000, N'Bún chả với nem rán giòn tan.'),
(N'MA068', N'NH023', N'Bún Chả Suất Lẻ', N'Bun', 55000, N'Phần bún chả nhỏ hơn.'),
(N'MA069', N'NH023', N'Nước Mắm Chua Ngọt', N'AnVat', 5000, N'Chén nước mắm pha đặc biệt.'),

-- NH024: Lau Nam Ashima (Lau)
(N'MA070', N'NH024', N'Lẩu Nấm Thiên Nhiên', N'Lau', 399000, N'Lẩu nấm quý hiếm, nước dùng bổ dưỡng.'),
(N'MA071', N'NH024', N'Đĩa Nấm Tổng Hợp', N'Lau', 150000, N'Đĩa nấm tươi theo mùa.'),
(N'MA072', N'NH024', N'Trà Thảo Mộc', N'AnVat', 45000, N'Trà thảo mộc thanh lọc cơ thể.'),

-- NH025: Ga U Muoi Hoa Tieu (AnVat)
(N'MA073', N'NH025', N'Gà Ủ Muối Nửa Con', N'AnVat', 150000, N'Nửa con gà ủ muối hoa tiêu.'),
(N'MA074', N'NH025', N'Gà Ủ Muối Nguyên Con', N'AnVat', 280000, N'Gà ủ muối nguyên con, thích hợp cho nhóm.'),
(N'MA075', N'NH025', N'Xôi Chiên Phồng', N'AnVat', 45000, N'Xôi chiên giòn, ăn kèm gà.'),

-- NH026: Com Nieu Vien Dong (Com)
(N'MA076', N'NH026', N'Cơm Niêu Thập Cẩm', N'Com', 140000, N'Cơm niêu với nhiều loại topping và món ăn kèm.'),
(N'MA077', N'NH026', N'Canh Sườn', N'Com', 80000, N'Canh sườn hầm rau củ.'),
(N'MA078', N'NH026', N'Cải Thìa Xào Nấm', N'Com', 60000, N'Cải thìa tươi xào nấm hương.'),

-- NH027: Lau Nuong Panda (Lau)
(N'MA079', N'NH027', N'Lẩu Mala', N'Lau', 290000, N'Lẩu cay Tứ Xuyên, nước dùng tê cay.'),
(N'MA080', N'NH027', N'Sườn Bò Mỹ Nướng', N'AnVat', 180000, N'Sườn bò Mỹ nướng mềm, béo.'),
(N'MA081', N'NH027', N'Bạch Tuộc Nướng', N'Haisan', 150000, N'Bạch tuộc tươi nướng than hồng.'),

-- NH028: Pho Thin Ha Noi (Pho)
(N'MA082', N'NH028', N'Phở Tái Lăn', N'Pho', 75000, N'Phở tái lăn đặc trưng, thịt bò xào tái.'),
(N'MA083', N'NH028', N'Phở Chín', N'Pho', 70000, N'Phở với thịt bò chín.'),
(N'MA084', N'NH028', N'Quẩy', N'AnVat', 10000, N'Quẩy giòn ăn kèm phở.'),

-- NH029: Banh Xeo Mien Tay (AnVat)
(N'MA085', N'NH029', N'Bánh Xèo Tôm Thịt', N'AnVat', 50000, N'Bánh xèo miền Tây nhân tôm thịt, to và giòn.'),
(N'MA086', N'NH029', N'Bánh Khọt', N'AnVat', 60000, N'Bánh khọt Vũng Tàu, ăn kèm rau sống.'),
(N'MA087', N'NH029', N'Gỏi Cuốn Tôm Thịt', N'AnVat', 40000, N'Gỏi cuốn với bún, tôm, thịt, chấm tương đen.'),

-- NH030: Bun Rieu Ganh (Bun)
(N'MA088', N'NH030', N'Bún Riêu Cua Đồng', N'Bun', 65000, N'Bún riêu cua với gạch cua béo ngậy.'),
(N'MA089', N'NH030', N'Bún Riêu Ốc', N'Bun', 70000, N'Bún riêu nấu cùng ốc bươu.'),
(N'MA090', N'NH030', N'Ốc Luộc', N'Haisan', 50000, N'Ốc luộc chấm mắm gừng.'),

-- NH031: Steak House Cowboy Jack (Steak)
(N'MA091', N'NH031', N'Steak Bò Mỹ', N'Steak', 299000, N'Thịt bò Mỹ nướng, ăn kèm khoai tây và rau củ.'),
(N'MA092', N'NH031', N'Súp Bí Đỏ', N'AnVat', 65000, N'Súp bí đỏ kem tươi béo ngậy.'),
(N'MA093', N'NH031', N'Salad Caesar', N'AnVat', 90000, N'Salad rau xanh, gà nướng, sốt Caesar.'),

-- NH032: Com Ga Hai Nam (Com)
(N'MA094', N'NH032', N'Cơm Gà Luộc', N'Com', 60000, N'Cơm gà luộc truyền thống, ăn kèm gỏi.'),
(N'MA095', N'NH032', N'Cơm Gà Quay', N'Com', 65000, N'Cơm gà quay giòn da.'),
(N'MA096', N'NH032', N'Gỏi Gà', N'AnVat', 80000, N'Gỏi gà trộn hành tây, rau răm.'),

-- NH033: Sushi Shin (Sushi)
(N'MA097', N'NH033', N'Nigiri Set', N'Sushi', 220000, N'Combo Nigiri các loại cá và tôm.'),
(N'MA098', N'NH033', N'Temaki Cá Hồi', N'Sushi', 85000, N'Sushi cuốn tay cá hồi và bơ.'),
(N'MA099', N'NH033', N'Súp Miso', N'AnVat', 40000, N'Súp Miso truyền thống.'),

-- NH034: Bun Mam Co Ba (Bun)
(N'MA100', N'NH034', N'Bún Mắm Đặc Biệt', N'Bun', 80000, N'Bún mắm với tôm, mực, heo quay.'),
(N'MA101', N'NH034', N'Chả Cá', N'AnVat', 30000, N'Chả cá chiên ăn kèm.'),
(N'MA102', N'NH034', N'Rau Sống Thêm', N'Bun', 15000, N'Phần rau sống thêm.'),

-- NH035: Lau Cua Dong (Lau)
(N'MA103', N'NH035', N'Lẩu Cua Đồng', N'Lau', 280000, N'Lẩu riêu cua đồng, gạch cua béo ngậy.'),
(N'MA104', N'NH035', N'Chả Cá Thác Lác', N'Lau', 110000, N'Chả cá thác lác viên dai.'),
(N'MA105', N'NH035', N'Bún Tươi Ăn Lẩu', N'Bun', 15000, N'Phần bún ăn lẩu.'),

-- NH036: Com Nha Que (Com)
(N'MA106', N'NH036', N'Cơm Trắng', N'Com', 15000, N'Cơm trắng dẻo thơm.'),
(N'MA107', N'NH036', N'Cá Rô Đồng Kho Tộ', N'Com', 110000, N'Cá rô đồng kho tộ đậm đà.'),
(N'MA108', N'NH036', N'Canh Mồng Tơi', N'Com', 40000, N'Canh mồng tơi nấu tôm.'),

-- NH037: Banh Uot Ban Me (AnVat)
(N'MA109', N'NH037', N'Bánh Ướt Thịt Nướng', N'AnVat', 55000, N'Bánh ướt cuốn thịt nướng Ban Mê.'),
(N'MA110', N'NH037', N'Chả Lụa', N'AnVat', 30000, N'Phần chả lụa ăn kèm.'),
(N'MA111', N'NH037', N'Nem Chua', N'AnVat', 25000, N'Nem chua Thanh Hóa.'),

-- NH038: BBQ Han Quoc 88 (AnVat)
(N'MA112', N'NH038', N'Thịt Heo Nướng Sốt Cay', N'AnVat', 160000, N'Ba chỉ heo nướng sốt cay Hàn Quốc.'),
(N'MA113', N'NH038', N'Canh Kim Chi', N'AnVat', 70000, N'Canh Kim chi thịt heo nóng hổi.'),
(N'MA114', N'NH038', N'Bia Hàn', N'AnVat', 45000, N'Chai bia Hàn Quốc.'),

-- NH039: Ga Nuong Lu (AnVat)
(N'MA115', N'NH039', N'Gà Nướng Lu Mật Ong', N'AnVat', 290000, N'Gà ta nướng lu nguyên con, da giòn.'),
(N'MA116', N'NH039', N'Chân Gà Sả Ớt', N'AnVat', 85000, N'Chân gà rút xương ngâm sả ớt.'),
(N'MA117', N'NH039', N'Xôi Gà', N'Com', 55000, N'Xôi chiên ăn kèm thịt gà.'),

-- NH040: Oc Quan Hanh (Haisan)
(N'MA118', N'NH040', N'Ốc Mỡ Xào Me', N'Haisan', 100000, N'Ốc mỡ tươi xào sốt me chua ngọt.'),
(N'MA119', N'NH040', N'Càng Ghẹ Rang Muối', N'Haisan', 180000, N'Càng ghẹ rang muối ớt đậm đà.'),
(N'MA120', N'NH040', N'Răng Mực Nướng', N'Haisan', 90000, N'Răng mực nướng sa tế.'),

-- NH041: Lau Ca Keo (Lau)
(N'MA121', N'NH041', N'Lẩu Cá Kèo Lá Giang', N'Lau', 260000, N'Lẩu cá kèo miền Tây, nước dùng chua lá giang.'),
(N'MA122', N'NH041', N'Cá Kèo Kho Tộ', N'Com', 110000, N'Cá kèo kho tộ ăn kèm cơm.'),
(N'MA123', N'NH041', N'Rau Lẩu Thêm', N'Lau', 25000, N'Phần rau ăn lẩu.'),

-- NH042: Banh Mi PewPew (AnVat)
(N'MA124', N'NH042', N'Bánh Mì Gà Xé', N'AnVat', 35000, N'Bánh mì nóng giòn kẹp gà xé phay.'),
(N'MA125', N'NH042', N'Bánh Mì Trứng Ốp La', N'AnVat', 30000, N'Bánh mì kẹp trứng ốp la.'),
(N'MA126', N'NH042', N'Nước Suối', N'AnVat', 10000, N'Chai nước suối Dasani.'),

-- NH043: Banh Canh Trang Bang (Mi/Bánh Canh)
(N'MA127', N'NH043', N'Bánh Canh Trảng Bàng', N'Mi', 65000, N'Bánh canh Trảng Bàng thịt heo luộc.'),
(N'MA128', N'NH043', N'Thịt Heo Luộc Cuốn', N'AnVat', 90000, N'Thịt heo luộc, bánh tráng, rau rừng.'),
(N'MA129', N'NH043', N'Rau Rừng Đặc Trưng', N'AnVat', 25000, N'Đĩa rau rừng ăn kèm.'),

-- NH044: Nhat Sakura (Sushi)
(N'MA130', N'NH044', N'Combo Sushi & Sashimi', N'Sushi', 380000, N'Set kết hợp nhiều loại sushi và sashimi.'),
(N'MA131', N'NH044', N'Mì Udon', N'Mi', 120000, N'Mì Udon nước dùng dashi.'),
(N'MA132', N'NH044', N'Trà Xanh Đá', N'AnVat', 35000, N'Trà xanh đá kiểu Nhật.'),

-- NH045: Lau De Tu Suu (Lau)
(N'MA133', N'NH045', N'Lẩu Dê Tiềm Thuốc Bắc', N'Lau', 350000, N'Lẩu dê hầm thuốc bắc, bổ dưỡng.'),
(N'MA134', N'NH045', N'Dê Xào Lăn', N'AnVat', 150000, N'Thịt dê xào lăn thơm mùi sả.'),
(N'MA135', N'NH045', N'Tiết Canh Dê', N'AnVat', 70000, N'Tiết canh dê tươi (tùy thời điểm).'),

-- NH046: Com Nieu Huong Viet (Com)
(N'MA136', N'NH046', N'Cơm Niêu Cá Bống Kho Tiêu', N'Com', 120000, N'Cá bống kho tiêu cay nhẹ.'),
(N'MA137', N'NH046', N'Canh Riêu Cua', N'Com', 80000, N'Canh riêu cua đồng.'),
(N'MA138', N'NH046', N'Rau Luộc Thập Cẩm', N'Com', 50000, N'Rau củ luộc chấm mắm kho.'),

-- NH047: Gogi House Landmark81 (AnVat)
(N'MA139', N'NH047', N'Ba Chỉ Heo Nướng Sốt', N'AnVat', 140000, N'Ba chỉ heo tẩm ướp nướng.'),
(N'MA140', N'NH047', N'Thịt Bò Thăn Nướng', N'AnVat', 190000, N'Thịt bò thăn nướng.'),
(N'MA141', N'NH047', N'Kim Chi Cải Thảo', N'AnVat', 40000, N'Kim chi cải thảo truyền thống.'),

-- NH048: Highlands Vạn Hạnh Mall (AnVat, Pho)
(N'MA142', N'NH048', N'Freeze Trà Xanh', N'AnVat', 59000, N'Đồ uống đá xay vị trà xanh.'),
(N'MA143', N'NH048', N'Cà Phê Đen Đá', N'Pho', 29000, N'Cà phê đen đá đậm vị.'),
(N'MA144', N'NH048', N'Bánh Phô Mai Trà Xanh', N'AnVat', 45000, N'Bánh phô mai mềm mịn.'),

-- NH049: Lau Bo Sai Gon (Lau)
(N'MA145', N'NH049', N'Lẩu Thập Cẩm', N'Lau', 300000, N'Lẩu bò đầy đủ các loại thịt và rau.'),
(N'MA146', N'NH049', N'Nước Lẩu Sa Tế', N'Lau', 0, N'Nước lẩu sa tế cay nhẹ (phí đã tính trong lẩu).'),
(N'MA147', N'NH049', N'Bắp Bò Tươi', N'Lau', 130000, N'Phần bắp bò tươi nhúng lẩu.'),

-- NH050: Pho 24 Nguyen Hue (Pho)
(N'MA148', N'NH050', N'Phở Bò Viên', N'Pho', 65000, N'Phở với bò viên.'),
(N'MA149', N'NH050', N'Phở Gà', N'Pho', 60000, N'Phở gà xé, nước dùng thanh.'),
(N'MA150', N'NH050', N'Nước Chanh Tươi', N'AnVat', 20000, N'Nước chanh tươi giải khát.');
GO

UPDATE MonAn
SET HinhAnh = 
    CASE MaLoai
        WHEN N'AnVat' THEN N'an_vat.png'
        WHEN N'Bun' THEN N'bun.png'
        WHEN N'Chay' THEN N'chay.png'
        WHEN N'Com' THEN N'com.png'
        WHEN N'Haisan' THEN N'haisan.png'
        WHEN N'Lau' THEN N'lau.png'
        WHEN N'Mi' THEN N'mi.png'
        WHEN N'Pho' THEN N'pho.png'
        WHEN N'Pizza' THEN N'pizza.png'
        WHEN N'Steak' THEN N'steak.png'
        WHEN N'Sushi' THEN N'sushi.png'
        WHEN N'Trasua' THEN N'trasua.png'
        ELSE NULL -- Đặt giá trị là NULL hoặc giá trị mặc định cho các MaLoai không khớp
    END
WHERE MaLoai IN (N'AnVat', N'Bun', N'Chay', N'Com', N'Haisan', N'Lau', N'Mi', N'Pho', N'Pizza', N'Steak', N'Sushi', N'Trasua');
GO

ALTER TABLE DonHang
ADD CONSTRAINT CHK_DonHang_TrangThai
CHECK (TrangThai IN (N'Chờ xác nhận', N'Đang lấy món', N'Đang giao', N'Hoàn thành', N'Đã hủy'));
GO