USE [clothing_shop]
GO
SET IDENTITY_INSERT [dbo].[users] ON 
GO
INSERT [dbo].[users] ([id], [username], [email], [password_hash], [full_name], [gender], [mobile], [avatar], [role], [status], [created_at], [updated_at]) VALUES (1, N'admin123', N'tphong610198@gmail.com', N'$2a$12$CuXL88lRV.caI3o.5ZB/wOM3mUPxEeVp7PnUYC9Tu6iefOfhTlfxO', N'Admin', N'male', N'0123456789', N'uploads/avatars/bb5cb37c-fb96-4a04-a5d6-7bd5732bf5b0.jpg', N'admin', N'active', CAST(N'2025-02-09T16:58:16.1666667' AS DateTime2), CAST(N'2025-02-09T17:12:48.3000000' AS DateTime2))
GO
INSERT [dbo].[users] ([id], [username], [email], [password_hash], [full_name], [gender], [mobile], [avatar], [role], [status], [created_at], [updated_at]) VALUES (2, N'phongthhe186443', N'phongthhe186443@fpt.edu.vn', N'$2a$10$mqTbeXOjwWftYcp3HvgbF.vynnSvUqQfBUY6wj7m7m/tiEnv/YYA6', N'Tran Hoai Phong (K18 HL)', N'other', NULL, N'https://lh3.googleusercontent.com/a/ACg8ocLrSqjCMqEhVL5SMILJ6OOpPyI5S64iKP29HhPEV9aIOgF0i-g=s96-c', N'customer', N'active', CAST(N'2025-02-09T17:02:23.6133333' AS DateTime2), CAST(N'2025-02-09T17:02:23.6133333' AS DateTime2))
GO
INSERT [dbo].[users] ([id], [username], [email], [password_hash], [full_name], [gender], [mobile], [avatar], [role], [status], [created_at], [updated_at]) VALUES (3, N'marketing123', N'huy412004@gmail.com', N'$2a$10$sYcqeKA5lzaWHHEHojLoxe378EtZni5873xBA8YfljCthxCADhmoy', N'Marketing', N'male', N'0987654321', N'https://img.freepik.com/premium-photo/customer-service-representative-digital-avatar-generative-ai_934475-9273.jpg?w=360', N'marketing', N'active', CAST(N'2025-02-10T03:04:56.3300000' AS DateTime2), CAST(N'2025-02-10T03:04:56.3300000' AS DateTime2))
GO
INSERT [dbo].[users] ([id], [username], [email], [password_hash], [full_name], [gender], [mobile], [avatar], [role], [status], [created_at], [updated_at]) VALUES (4, N'user123', N'user123@gmail.com', N'$2a$10$XFl8Zk5zSXQo/PjN4df.k.twXuumSIvYM7jLRqVcvx2heTFVyW0Ca', N'Khách 1', N'male', N'0912345678', N'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQEONEP1EegBp0dESaBFaDbw8G9fJY_k7oY5A&s', N'customer', N'active', CAST(N'2025-02-10T03:04:56.3300000' AS DateTime2), CAST(N'2025-02-10T03:04:56.3300000' AS DateTime2))
GO
INSERT [dbo].[users] ([id], [username], [email], [password_hash], [full_name], [gender], [mobile], [avatar], [role], [status], [created_at], [updated_at]) VALUES (5, N'sale123', N'sale123@gmail.com', N'$2a$10$ojVPuuE5ZVLPE/wWOSRFIeNKLkBZh/CZeHE57ij4F.cfKYsdmIxAO', N'Sale', N'male', N'0978123456', N'https://img.freepik.com/premium-photo/customer-service-representative-digital-avatar-generative-ai_934475-9075.jpg', N'sale', N'active', CAST(N'2025-02-10T03:04:56.3300000' AS DateTime2), CAST(N'2025-02-10T03:04:56.3300000' AS DateTime2))
GO
INSERT [dbo].[users] ([id], [username], [email], [password_hash], [full_name], [gender], [mobile], [avatar], [role], [status], [created_at], [updated_at]) VALUES (6, N'user321', N'user321@gmail.com', N'$2a$10$7d0sV4kA8mSbQoJhGmROJumQnBeqtpzzMxz7yslGGf5Z1lhx85M7O', N'Khách 2', N'male', N'0934567890', N'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRl5nDZUl0qC61tJ7SVbzLmlO_jKALvNrV0iw&s', N'customer', N'active', CAST(N'2025-02-10T03:04:56.3300000' AS DateTime2), CAST(N'2025-02-10T03:04:56.3300000' AS DateTime2))
GO
INSERT [dbo].[users] ([id], [username], [email], [password_hash], [full_name], [gender], [mobile], [avatar], [role], [status], [created_at], [updated_at]) VALUES (7, N'user1234', N'XiaoDing@gmail.com', N'$2a$10$Yw.YHLgW3IAdZAvicADymOZ4CqopkkbD90.DW7m.0Nz3PxuF/pvsK', N'Khách 3', N'male', N'0956781234', N'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTd8RTFkScmVoIQoLsbDscznUGlMz4BMT7oGWYqr8-TJ2FuN55cES6KfCmAxSe1aBM6qYs&usqp=CAU', N'customer', N'active', CAST(N'2025-02-10T03:04:56.3300000' AS DateTime2), CAST(N'2025-03-29T17:43:12.3400000' AS DateTime2))
GO
INSERT [dbo].[users] ([id], [username], [email], [password_hash], [full_name], [gender], [mobile], [avatar], [role], [status], [created_at], [updated_at]) VALUES (8, N'user12345', N'Medusa@gmail.com', N'$2a$10$7Wjzn5r0OX2pcdowGvA39OBnpNP9.b4MvoaXH4terFmIpSN/htzqa', N'Khách 4', N'female', N'0923456789', N'https://png.pngtree.com/png-vector/20231019/ourlarge/pngtree-avatar-of-a-brunette-man-png-image_10214156.png', N'customer', N'active', CAST(N'2025-02-10T03:04:56.3300000' AS DateTime2), CAST(N'2025-02-10T03:04:56.3300000' AS DateTime2))
GO
INSERT [dbo].[users] ([id], [username], [email], [password_hash], [full_name], [gender], [mobile], [avatar], [role], [status], [created_at], [updated_at]) VALUES (9, N'user12346', N'CaiLin@gmail.com', N'$2a$10$de4mBMbt0qfpuKCs0jF1I.wHr5/dfWMYQikSJ8aJqbHyZ8qH2IxXu', N'Khách 5', N'female', N'0965432109', N'https://png.pngtree.com/png-clipart/20231020/original/pngtree-avatar-of-a-brunette-man-png-image_13379740.png', N'customer', N'pending', CAST(N'2025-02-10T03:04:56.3300000' AS DateTime2), CAST(N'2025-02-10T03:04:56.3300000' AS DateTime2))
GO
INSERT [dbo].[users] ([id], [username], [email], [password_hash], [full_name], [gender], [mobile], [avatar], [role], [status], [created_at], [updated_at]) VALUES (10, N'user123467', N'HaiBoDong@gmail.com', N'$2a$10$5l/p6PdL8crcmH0qAcniEuQGjrlNc1GYrSWKcYVeloYoxtqhczhOe', N'Khách 6', N'male', N'0998765432', N'https://static.vecteezy.com/ti/vetor-gratis/t2/14176992-jovem-homem-barbudo-gratis-vetor.jpg', N'customer', N'inactive', CAST(N'2025-02-10T03:04:56.3300000' AS DateTime2), CAST(N'2025-03-29T17:43:25.1266667' AS DateTime2))
GO
INSERT [dbo].[users] ([id], [username], [email], [password_hash], [full_name], [gender], [mobile], [avatar], [role], [status], [created_at], [updated_at]) VALUES (11, N'user3210', N'NalanYanran@gmail.com', N'$2a$10$.Aa9sv.fZvHA4HIS6vcfNuSGM.zlr3ldxMuo8FccCVDGIgjaYP8pq', N'Khách 7', N'female', N'0943216789', N'https://thumbs.dreamstime.com/b/retrato-de-um-homem-novo-com-barba-e-penteado-avatar-masculino-vetor-105082137.jpg', N'customer', N'inactive', CAST(N'2025-02-10T03:04:56.3300000' AS DateTime2), CAST(N'2025-02-10T03:04:56.3300000' AS DateTime2))
GO
INSERT [dbo].[users] ([id], [username], [email], [password_hash], [full_name], [gender], [mobile], [avatar], [role], [status], [created_at], [updated_at]) VALUES (12, N'user4321', N'GuYuan@gmail.com', N'$2a$10$JaWF8M.AaFAxaCcq7e2zK.TLravMOCQvxG3NXAAoKlDMVnL/PVzq6', N'Khách 8', N'male', N'0981234567', N'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSMELTwIC8sNsdL8iJDfpcvyZ0M08ktRXe9nd4dy2E2_KBfwlNiTCUyrTe5I-Dsz4s19b4&usqp=CAU', N'customer', N'active', CAST(N'2025-02-10T03:04:56.3300000' AS DateTime2), CAST(N'2025-02-10T03:04:56.3300000' AS DateTime2))
GO
INSERT [dbo].[users] ([id], [username], [email], [password_hash], [full_name], [gender], [mobile], [avatar], [role], [status], [created_at], [updated_at]) VALUES (13, N'user54321', N'GuXun@gmail.com', N'$2a$10$s.runNoG/32WCxknTJrbs.6oqxowlmPDAqgFdvEgs7xcOOYyrEbQW', N'Khách 9', N'male', N'0976543210', N'https://png.pngtree.com/png-clipart/20230930/original/pngtree-man-avatar-isolated-png-image_13022161.png', N'customer', N'active', CAST(N'2025-02-10T03:04:56.3300000' AS DateTime2), CAST(N'2025-02-10T03:04:56.3300000' AS DateTime2))
GO
INSERT [dbo].[users] ([id], [username], [email], [password_hash], [full_name], [gender], [mobile], [avatar], [role], [status], [created_at], [updated_at]) VALUES (14, N'user654321', N'YunShan@gmail.com', N'$2a$10$tdQRtCI1.aPdt.qbe2ee.eOrC2Tq2XQymcNE9z9.6GChMVWVRHGYy', N'Khách 10', N'male', N'0919876543', N'https://thuvienanime.net/wp-content/uploads/2023/07/van-son-van-lam-tong-thuvienanime-1.jpg', N'customer', N'inactive', CAST(N'2025-02-10T03:04:56.3300000' AS DateTime2), CAST(N'2025-02-10T03:04:56.3300000' AS DateTime2))
GO
INSERT [dbo].[users] ([id], [username], [email], [password_hash], [full_name], [gender], [mobile], [avatar], [role], [status], [created_at], [updated_at]) VALUES (15, N'user7654321', N'FaMa@gmail.com', N'$2a$10$T7bONEjEQCimeWWQGFDPzuhsN10hiSSbQFFugWa.MUOA93XyLYWTu', N'Khách 11', N'male', N'0921987654', N'https://i.pinimg.com/1200x/97/79/fc/9779fc310f1bf2f3ff9e17f14b5143e8.jpg', N'customer', N'pending', CAST(N'2025-02-10T03:04:56.3300000' AS DateTime2), CAST(N'2025-02-10T03:04:56.3300000' AS DateTime2))
GO
INSERT [dbo].[users] ([id], [username], [email], [password_hash], [full_name], [gender], [mobile], [avatar], [role], [status], [created_at], [updated_at]) VALUES (16, N'ur123', N'HuJia@gmail.com', N'$2a$10$3iPVuYw6ScoAZULHkjrkyOcMSbMzVWMiQH35Pnw.de1rnGNjxN2ku', N'Khách 12', N'female', N'0932198765', N'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ1-CatM7FqGbzGe3AT3aq-D1l30ymqbT4TCw&s', N'customer', N'active', CAST(N'2025-02-10T03:04:56.3300000' AS DateTime2), CAST(N'2025-02-10T03:04:56.3300000' AS DateTime2))
GO
INSERT [dbo].[users] ([id], [username], [email], [password_hash], [full_name], [gender], [mobile], [avatar], [role], [status], [created_at], [updated_at]) VALUES (17, N'ur1234', N'LingYing@gmail.com', N'$2a$10$/wuejts3V40G0e/NGB/pOuM5ciGBGTL.fPPNoMDOvb.NVdQmgIjU.', N'Khách 13', N'male', N'0954321987', N'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ2JlHW6h7apfGjoJtk5PyJ7lyEn9hhSPCWKD4zMyakPR285cDGKLszvZGiGDz3bWx3IRI&usqp=CAU', N'customer', N'active', CAST(N'2025-02-10T03:04:56.3300000' AS DateTime2), CAST(N'2025-02-10T03:04:56.3300000' AS DateTime2))
GO
INSERT [dbo].[users] ([id], [username], [email], [password_hash], [full_name], [gender], [mobile], [avatar], [role], [status], [created_at], [updated_at]) VALUES (18, N'ur1235', N'YanXiao@gmail.com', N'$2a$10$7QRPlkWt96Ah6r.5Frgiku3/QCZpAwMDPyLuvurl61Uqij.fqJbTC', N'Khách 14', N'male', N'0965432198', N'https://i.pinimg.com/736x/97/43/df/9743df24110f180466d0247ba76e5415.jpg', N'customer', N'active', CAST(N'2025-02-10T03:04:56.3300000' AS DateTime2), CAST(N'2025-02-10T03:04:56.3300000' AS DateTime2))
GO
INSERT [dbo].[users] ([id], [username], [email], [password_hash], [full_name], [gender], [mobile], [avatar], [role], [status], [created_at], [updated_at]) VALUES (19, N'ur1236', N'QingLin@gmail.com', N'$2a$10$5UThIZ.2xCuTFxaq3Xtd4OQUDPPQLhsWWlbrWXJydo574exxXviKO', N'Khách 15', N'female', N'0976543219', N'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRP6wBKSzroOocvJhUH4Beh3q5bK02NU-zIJQ&s', N'customer', N'inactive', CAST(N'2025-02-10T03:04:56.3300000' AS DateTime2), CAST(N'2025-02-10T03:04:56.3300000' AS DateTime2))
GO
INSERT [dbo].[users] ([id], [username], [email], [password_hash], [full_name], [gender], [mobile], [avatar], [role], [status], [created_at], [updated_at]) VALUES (20, N'ur1237', N'XiaoLei@gmail.com', N'$2a$10$WIhlpSF/rOFJ06PxhnhQ7OLriyxm2rkxRKyq2ThvpkRtKQTlzDPcS', N'Khách 16', N'male', N'0987654329', N'https://img.tripi.vn/cdn-cgi/image/width=700,height=700/https://gcs.tripi.vn/public-tripi/tripi-feed/img/483123vwz/anh-mo-ta.png', N'customer', N'active', CAST(N'2025-02-10T03:04:56.3300000' AS DateTime2), CAST(N'2025-02-10T03:04:56.3300000' AS DateTime2))
GO
INSERT [dbo].[users] ([id], [username], [email], [password_hash], [full_name], [gender], [mobile], [avatar], [role], [status], [created_at], [updated_at]) VALUES (21, N'ur321', N'FengLei@gmail.com', N'$2a$10$f68ZbQbQru4.i8erDSO4quX27/d/Czq0jRBJXCbOmsHH/zE80tD8.', N'Khách 17', N'male', N'0998765431', N'https://cafebiz.cafebizcdn.vn/162123310254002176/2022/12/29/avatar-2-versus-thanos-cgi-1-1671044444279520813159-1672281093701-16722810940541552675226.jpg', N'customer', N'pending', CAST(N'2025-02-10T03:04:56.3300000' AS DateTime2), CAST(N'2025-02-10T03:04:56.3300000' AS DateTime2))
GO
INSERT [dbo].[users] ([id], [username], [email], [password_hash], [full_name], [gender], [mobile], [avatar], [role], [status], [created_at], [updated_at]) VALUES (22, N'ur4321', N'ZiYan@gmail.com', N'$2a$10$ky5Lacc8ObH4QwmJ8LGeauTWFq5CT2/cxQhM98ug/lSH4xGYU.J7i', N'Khách 18', N'female', N'0909876543', N'https://media.ngoisao.vn/news/2012/12/31/nghiengdau_3112.jpg', N'customer', N'active', CAST(N'2025-02-10T03:04:56.3300000' AS DateTime2), CAST(N'2025-02-10T03:04:56.3300000' AS DateTime2))
GO
INSERT [dbo].[users] ([id], [username], [email], [password_hash], [full_name], [gender], [mobile], [avatar], [role], [status], [created_at], [updated_at]) VALUES (23, N'datvthe186351', N'datvthe186351@fpt.edu.vn', N'accGoogle$2a$10$h44bRXTsQJQCici5AoAukOA5Ce2fTeBpM6lg/cZ.Nwv.rlR7Jrsi.', N'Vu Tien Dat (K18 HL)', N'other', NULL, N'https://lh3.googleusercontent.com/a/ACg8ocLQS4GRdIkgNSZsWOVpDwwFWXGhLH-yQipv1mlpgBm2-tQ_Af4=s96-c', N'customer', N'active', CAST(N'2025-03-29T03:29:25.0933333' AS DateTime2), CAST(N'2025-03-29T03:29:25.0933333' AS DateTime2))
GO
SET IDENTITY_INSERT [dbo].[users] OFF
GO
SET IDENTITY_INSERT [dbo].[cart] ON 
GO
INSERT [dbo].[cart] ([id], [user_id], [created_at]) VALUES (1, 1, CAST(N'2025-02-21T18:35:43.8400000' AS DateTime2))
GO
INSERT [dbo].[cart] ([id], [user_id], [created_at]) VALUES (2, 2, CAST(N'2025-02-21T18:35:43.8400000' AS DateTime2))
GO
INSERT [dbo].[cart] ([id], [user_id], [created_at]) VALUES (3, 3, CAST(N'2025-02-21T18:35:43.8400000' AS DateTime2))
GO
INSERT [dbo].[cart] ([id], [user_id], [created_at]) VALUES (4, 23, CAST(N'2025-03-29T03:29:25.1166667' AS DateTime2))
GO
INSERT [dbo].[cart] ([id], [user_id], [created_at]) VALUES (5, 4, CAST(N'2025-03-29T03:31:52.8700000' AS DateTime2))
GO
INSERT [dbo].[cart] ([id], [user_id], [created_at]) VALUES (6, 5, CAST(N'2025-03-29T16:42:37.0000000' AS DateTime2))
GO
INSERT [dbo].[cart] ([id], [user_id], [created_at]) VALUES (7, 6, CAST(N'2025-03-29T16:54:37.9000000' AS DateTime2))
GO
INSERT [dbo].[cart] ([id], [user_id], [created_at]) VALUES (8, 7, CAST(N'2025-03-29T16:54:46.2900000' AS DateTime2))
GO
INSERT [dbo].[cart] ([id], [user_id], [created_at]) VALUES (9, 8, CAST(N'2025-03-29T17:02:48.7966667' AS DateTime2))
GO
INSERT [dbo].[cart] ([id], [user_id], [created_at]) VALUES (10, 9, CAST(N'2025-03-29T17:02:56.4966667' AS DateTime2))
GO
INSERT [dbo].[cart] ([id], [user_id], [created_at]) VALUES (11, 12, CAST(N'2025-03-29T17:07:14.2566667' AS DateTime2))
GO
INSERT [dbo].[cart] ([id], [user_id], [created_at]) VALUES (12, 11, CAST(N'2025-03-29T17:07:22.4433333' AS DateTime2))
GO
SET IDENTITY_INSERT [dbo].[cart] OFF
GO
SET IDENTITY_INSERT [dbo].[categories] ON 
GO
INSERT [dbo].[categories] ([id], [name], [description], [parent_id], [level], [status]) VALUES (1, N'Quần áo nam', N'Các loại quần áo cho nam', NULL, 1, N'active')
GO
INSERT [dbo].[categories] ([id], [name], [description], [parent_id], [level], [status]) VALUES (2, N'Quần áo nữ', N'Các loại quần áo cho nữ', NULL, 1, N'active')
GO
INSERT [dbo].[categories] ([id], [name], [description], [parent_id], [level], [status]) VALUES (3, N'Quần áo trẻ em', N'Quần áo cho trẻ em', NULL, 1, N'active')
GO
INSERT [dbo].[categories] ([id], [name], [description], [parent_id], [level], [status]) VALUES (4, N'Phụ kiện', N'Các phụ kiện thời trang', NULL, 1, N'active')
GO
INSERT [dbo].[categories] ([id], [name], [description], [parent_id], [level], [status]) VALUES (5, N'Giày dép', N'Các loại giày dép', NULL, 1, N'active')
GO
INSERT [dbo].[categories] ([id], [name], [description], [parent_id], [level], [status]) VALUES (6, N'Áo nam', N'Các loại áo cho nam', 1, 2, N'active')
GO
INSERT [dbo].[categories] ([id], [name], [description], [parent_id], [level], [status]) VALUES (7, N'Quần nam', N'Các loại quần cho nam', 1, 2, N'active')
GO
INSERT [dbo].[categories] ([id], [name], [description], [parent_id], [level], [status]) VALUES (8, N'Áo nữ', N'Các loại áo cho nữ', 2, 2, N'active')
GO
INSERT [dbo].[categories] ([id], [name], [description], [parent_id], [level], [status]) VALUES (9, N'Váy & Chân váy', N'Các loại váy và chân váy', 2, 2, N'active')
GO
INSERT [dbo].[categories] ([id], [name], [description], [parent_id], [level], [status]) VALUES (10, N'Quần jean nam', N'Quần jean các loại', 7, 3, N'active')
GO
INSERT [dbo].[categories] ([id], [name], [description], [parent_id], [level], [status]) VALUES (11, N'Quần kaki nam', N'Quần kaki lịch lãm', 7, 3, N'active')
GO
INSERT [dbo].[categories] ([id], [name], [description], [parent_id], [level], [status]) VALUES (12, N'Áo sơ mi nam', N'Áo sơ mi công sở', 6, 3, N'active')
GO
INSERT [dbo].[categories] ([id], [name], [description], [parent_id], [level], [status]) VALUES (13, N'Áo thun nam', N'Áo thun cotton', 6, 3, N'active')
GO
INSERT [dbo].[categories] ([id], [name], [description], [parent_id], [level], [status]) VALUES (14, N'Đầm dự tiệc', N'Đầm dài, đầm body', 9, 3, N'active')
GO
INSERT [dbo].[categories] ([id], [name], [description], [parent_id], [level], [status]) VALUES (15, N'Áo sơ mi nữ', N'Áo sơ mi công sở', 8, 3, N'active')
GO
INSERT [dbo].[categories] ([id], [name], [description], [parent_id], [level], [status]) VALUES (16, N'Áo thun nữ', N'Áo thun cotton', 8, 3, N'active')
GO
INSERT [dbo].[categories] ([id], [name], [description], [parent_id], [level], [status]) VALUES (17, N'Váy maxi', N'Váy maxi dài', 9, 3, N'active')
GO
INSERT [dbo].[categories] ([id], [name], [description], [parent_id], [level], [status]) VALUES (18, N'Giày thể thao', N'Các loại giày thể thao', 5, 2, N'active')
GO
INSERT [dbo].[categories] ([id], [name], [description], [parent_id], [level], [status]) VALUES (19, N'Giày da', N'Các loại giày da', 5, 2, N'active')
GO
INSERT [dbo].[categories] ([id], [name], [description], [parent_id], [level], [status]) VALUES (20, N'Sandal', N'Các loại sandal', 5, 2, N'active')
GO
INSERT [dbo].[categories] ([id], [name], [description], [parent_id], [level], [status]) VALUES (21, N'Túi xách nữ', N'Các loại túi xách cho nữ', 4, 2, N'active')
GO
INSERT [dbo].[categories] ([id], [name], [description], [parent_id], [level], [status]) VALUES (22, N'Túi xách nam', N'Các loại túi xách cho nam', 4, 2, N'active')
GO
INSERT [dbo].[categories] ([id], [name], [description], [parent_id], [level], [status]) VALUES (23, N'Thắt lưng nam', N'Thắt lưng cho nam', 4, 2, N'active')
GO
INSERT [dbo].[categories] ([id], [name], [description], [parent_id], [level], [status]) VALUES (24, N'Thắt lưng nữ', N'Thắt lưng cho nữ', 4, 2, N'active')
GO
INSERT [dbo].[categories] ([id], [name], [description], [parent_id], [level], [status]) VALUES (25, N'Áo khoác nam', N'Áo khoác dù, bomber', 6, 3, N'active')
GO
INSERT [dbo].[categories] ([id], [name], [description], [parent_id], [level], [status]) VALUES (26, N'Áo khoác nữ', N'Áo khoác dù, bomber', 8, 3, N'active')
GO
INSERT [dbo].[categories] ([id], [name], [description], [parent_id], [level], [status]) VALUES (27, N'Quần short nam', N'Quần short kaki, jean', 7, 3, N'active')
GO
INSERT [dbo].[categories] ([id], [name], [description], [parent_id], [level], [status]) VALUES (28, N'Quần short nữ', N'Quần short kaki, jean', 9, 3, N'active')
GO
INSERT [dbo].[categories] ([id], [name], [description], [parent_id], [level], [status]) VALUES (29, N'Giày Sneaker Nam', N'Giày Sneaker Nam', 18, 3, N'active')
GO
INSERT [dbo].[categories] ([id], [name], [description], [parent_id], [level], [status]) VALUES (30, N'Giày Sneaker Nữ', N'Giày Sneaker Nữ', 18, 3, N'active')
GO
INSERT [dbo].[categories] ([id], [name], [description], [parent_id], [level], [status]) VALUES (31, N'Giày Tây Nam', N'Giày Tây Nam', 19, 3, N'active')
GO
INSERT [dbo].[categories] ([id], [name], [description], [parent_id], [level], [status]) VALUES (32, N'Giày Cao Gót', N'Giày Cao Gót', 19, 3, N'active')
GO
INSERT [dbo].[categories] ([id], [name], [description], [parent_id], [level], [status]) VALUES (33, N'Sandal Nam', N'Sandal Nam', 20, 3, N'active')
GO
INSERT [dbo].[categories] ([id], [name], [description], [parent_id], [level], [status]) VALUES (34, N'Sandal Nữ', N'Sandal Nữ', 20, 3, N'active')
GO
INSERT [dbo].[categories] ([id], [name], [description], [parent_id], [level], [status]) VALUES (35, N'Túi đeo chéo nam', N'Túi đeo chéo nam', 22, 3, N'active')
GO
INSERT [dbo].[categories] ([id], [name], [description], [parent_id], [level], [status]) VALUES (36, N'Túi xách tay nữ', N'Túi xách tay nữ', 21, 3, N'active')
GO
INSERT [dbo].[categories] ([id], [name], [description], [parent_id], [level], [status]) VALUES (37, N'Đồ bộ nam', N'Các loại đồ bộ cho nam', 1, 2, N'active')
GO
INSERT [dbo].[categories] ([id], [name], [description], [parent_id], [level], [status]) VALUES (38, N'Đồ bộ nữ', N'Các loại đồ bộ cho nữ', 2, 2, N'active')
GO
INSERT [dbo].[categories] ([id], [name], [description], [parent_id], [level], [status]) VALUES (39, N'Áo trẻ em', N'Các loại áo cho trẻ em', 3, 2, N'active')
GO
INSERT [dbo].[categories] ([id], [name], [description], [parent_id], [level], [status]) VALUES (40, N'Quần trẻ em', N'Các loại quần cho trẻ em', 3, 2, N'active')
GO
INSERT [dbo].[categories] ([id], [name], [description], [parent_id], [level], [status]) VALUES (41, N'Váy trẻ em', N'Các loại váy cho trẻ em', 3, 2, N'active')
GO
INSERT [dbo].[categories] ([id], [name], [description], [parent_id], [level], [status]) VALUES (42, N'Kính mắt', N'Các loại kính thời trang', 4, 2, N'active')
GO
INSERT [dbo].[categories] ([id], [name], [description], [parent_id], [level], [status]) VALUES (43, N'Trang sức', N'Các loại trang sức', 4, 2, N'active')
GO
INSERT [dbo].[categories] ([id], [name], [description], [parent_id], [level], [status]) VALUES (44, N'Dép', N'Các loại dép', 5, 2, N'active')
GO
INSERT [dbo].[categories] ([id], [name], [description], [parent_id], [level], [status]) VALUES (45, N'Áo vest nam', N'Áo vest lịch lãm', 6, 3, N'active')
GO
INSERT [dbo].[categories] ([id], [name], [description], [parent_id], [level], [status]) VALUES (46, N'Quần tây nam', N'Quần tây công sở', 7, 3, N'active')
GO
INSERT [dbo].[categories] ([id], [name], [description], [parent_id], [level], [status]) VALUES (47, N'Đồ bộ thể thao nam', N'Đồ bộ thể thao nam', 37, 3, N'active')
GO
INSERT [dbo].[categories] ([id], [name], [description], [parent_id], [level], [status]) VALUES (48, N'Đồ bộ mặc nhà nam', N'Đồ bộ mặc nhà nam', 37, 3, N'active')
GO
INSERT [dbo].[categories] ([id], [name], [description], [parent_id], [level], [status]) VALUES (49, N'Áo kiểu nữ', N'Áo kiểu thời trang', 8, 3, N'active')
GO
INSERT [dbo].[categories] ([id], [name], [description], [parent_id], [level], [status]) VALUES (50, N'Chân váy', N'Chân váy các loại', 9, 3, N'active')
GO
INSERT [dbo].[categories] ([id], [name], [description], [parent_id], [level], [status]) VALUES (51, N'Đồ bộ thể thao nữ', N'Đồ bộ thể thao nữ', 38, 3, N'active')
GO
INSERT [dbo].[categories] ([id], [name], [description], [parent_id], [level], [status]) VALUES (52, N'Đồ bộ mặc nhà nữ', N'Đồ bộ mặc nhà nữ', 38, 3, N'active')
GO
INSERT [dbo].[categories] ([id], [name], [description], [parent_id], [level], [status]) VALUES (53, N'Áo thun trẻ em', N'Áo thun trẻ em', 39, 3, N'active')
GO
INSERT [dbo].[categories] ([id], [name], [description], [parent_id], [level], [status]) VALUES (54, N'Áo sơ mi trẻ em', N'Áo sơ mi trẻ em', 39, 3, N'active')
GO
INSERT [dbo].[categories] ([id], [name], [description], [parent_id], [level], [status]) VALUES (55, N'Quần jean trẻ em', N'Quần jean trẻ em', 40, 3, N'active')
GO
INSERT [dbo].[categories] ([id], [name], [description], [parent_id], [level], [status]) VALUES (56, N'Quần short trẻ em', N'Quần short trẻ em', 40, 3, N'active')
GO
INSERT [dbo].[categories] ([id], [name], [description], [parent_id], [level], [status]) VALUES (57, N'Váy xòe trẻ em', N'Váy xòe trẻ em', 41, 3, N'active')
GO
INSERT [dbo].[categories] ([id], [name], [description], [parent_id], [level], [status]) VALUES (58, N'Đầm công chúa trẻ em', N'Đầm công chúa trẻ em', 41, 3, N'active')
GO
INSERT [dbo].[categories] ([id], [name], [description], [parent_id], [level], [status]) VALUES (59, N'Túi đeo chéo nữ', N'Túi đeo chéo nữ', 21, 3, N'active')
GO
INSERT [dbo].[categories] ([id], [name], [description], [parent_id], [level], [status]) VALUES (60, N'Balo nam', N'Balo nam', 22, 3, N'active')
GO
INSERT [dbo].[categories] ([id], [name], [description], [parent_id], [level], [status]) VALUES (61, N'Thắt lưng da nam', N'Thắt lưng da nam', 23, 3, N'active')
GO
INSERT [dbo].[categories] ([id], [name], [description], [parent_id], [level], [status]) VALUES (62, N'Thắt lưng vải nam', N'Thắt lưng vải nam', 23, 3, N'active')
GO
INSERT [dbo].[categories] ([id], [name], [description], [parent_id], [level], [status]) VALUES (63, N'Thắt lưng da nữ', N'Thắt lưng da nữ', 24, 3, N'active')
GO
INSERT [dbo].[categories] ([id], [name], [description], [parent_id], [level], [status]) VALUES (64, N'Thắt lưng vải nữ', N'Thắt lưng vải nữ', 24, 3, N'active')
GO
INSERT [dbo].[categories] ([id], [name], [description], [parent_id], [level], [status]) VALUES (65, N'Kính râm', N'Kính râm', 42, 3, N'active')
GO
INSERT [dbo].[categories] ([id], [name], [description], [parent_id], [level], [status]) VALUES (66, N'Kính cận', N'Kính cận', 42, 3, N'active')
GO
INSERT [dbo].[categories] ([id], [name], [description], [parent_id], [level], [status]) VALUES (67, N'Dây chuyền', N'Dây chuyền', 43, 3, N'active')
GO
INSERT [dbo].[categories] ([id], [name], [description], [parent_id], [level], [status]) VALUES (68, N'Bông tai', N'Bông tai', 43, 3, N'active')
GO
INSERT [dbo].[categories] ([id], [name], [description], [parent_id], [level], [status]) VALUES (69, N'Nhẫn', N'Nhẫn', 43, 3, N'active')
GO
INSERT [dbo].[categories] ([id], [name], [description], [parent_id], [level], [status]) VALUES (70, N'Dép lào nam', N'Dép lào nam', 44, 3, N'active')
GO
INSERT [dbo].[categories] ([id], [name], [description], [parent_id], [level], [status]) VALUES (71, N'Dép quai ngang nữ', N'Dép quai ngang nữ', 44, 3, N'active')
GO
SET IDENTITY_INSERT [dbo].[categories] OFF
GO
SET IDENTITY_INSERT [dbo].[products] ON 
GO
INSERT [dbo].[products] ([id], [title], [category_id], [description], [original_price], [sale_price], [thumbnail], [status], [is_combo], [combo_group_id], [created_at], [updated_at]) VALUES (1, N'Áo sơ mi trắng', 12, N'<p><strong>Áo Sơ Mi Trắng – Thanh Lịch, Đơn Giản, Dễ Phối Đồ</strong></p>
<p>👔 <strong>Áo Sơ Mi Trắng</strong> là item thời trang không bao giờ lỗi mốt, phù hợp cho mọi hoàn cảnh từ đi học, đi làm đến dự tiệc. Một chiếc sơ mi trắng giúp bạn luôn trông lịch lãm, chỉn chu và đầy phong cách!</p>
<p>✨ <strong>Đặc điểm nổi bật:</strong><br>
✔ <strong>Chất liệu cao cấp</strong>: Cotton, linen hoặc vải lụa mềm mại, thoáng khí, thấm hút mồ hôi tốt, mang lại cảm giác thoải mái khi mặc.<br>
✔ <strong>Thiết kế tinh tế</strong>: Kiểu dáng basic nhưng sang trọng, dễ dàng kết hợp với nhiều phong cách khác nhau.<br>
✔ <strong>Dễ dàng phối đồ</strong>: Mặc cùng quần tây để tạo vẻ ngoài lịch lãm, phối với quần jean hay chân váy giúp trẻ trung, năng động.<br>
✔ <strong>Phù hợp cho mọi dịp</strong>: Đi làm, đi học, hẹn hò hay dự tiệc, áo sơ mi trắng luôn là lựa chọn hoàn hảo.<br>
✔ <strong>Kiểu dáng đa dạng</strong>: Form ôm slim fit giúp tôn dáng, form rộng oversize cho vẻ ngoài trẻ trung, thoải mái.<br>
✔ <strong>Dành cho cả nam và nữ</strong>: Unisex, phù hợp với mọi độ tuổi và phong cách.</p>
<p>🔥 <strong>Sắm ngay Áo Sơ Mi Trắng để luôn tự tin, lịch sự và cuốn hút trong mọi hoàn cảnh!</strong> ✨</p>', CAST(180000.00 AS Decimal(10, 2)), CAST(200000.00 AS Decimal(10, 2)), N'https://product.hstatic.net/1000333436/product/tx_03696_da789ffaa68d42d3b2ad129b099e15ae_master.jpg', N'active', 1, N'1', CAST(N'2024-02-10T05:35:14.1666667' AS DateTime2), CAST(N'2025-03-29T18:30:33.0233333' AS DateTime2))
GO
INSERT [dbo].[products] ([id], [title], [category_id], [description], [original_price], [sale_price], [thumbnail], [status], [is_combo], [combo_group_id], [created_at], [updated_at]) VALUES (2, N'Quần tây đen', 46, N'<p><strong>Quần Tây Đen – Thanh Lịch, Đa Dụng, Dễ Phối Đồ</strong></p>
<p>👖 <strong>Quần Tây Đen</strong> là item thời trang không thể thiếu, mang đến vẻ ngoài lịch lãm, sang trọng và phù hợp với nhiều hoàn cảnh, từ công sở đến sự kiện quan trọng.</p>
<p>✨ <strong>Đặc điểm nổi bật:</strong><br>
✔ <strong>Chất liệu cao cấp</strong>: Vải tuyết mưa, cotton hoặc kaki mềm mại, co giãn nhẹ, giúp thoải mái khi mặc cả ngày.<br>
✔ <strong>Thiết kế tối giản nhưng tinh tế</strong>: Form suông, ống đứng hoặc slim fit ôm vừa vặn, tôn dáng hiệu quả.<br>
✔ <strong>Dễ dàng phối đồ</strong>: Kết hợp với áo sơ mi, áo thun, blazer hay áo polo để tạo phong cách thanh lịch hoặc trẻ trung.<br>
✔ <strong>Phù hợp với nhiều dịp</strong>: Đi làm, dự tiệc, họp hành, đi học hay dạo phố đều rất phù hợp.<br>
✔ <strong>Tôn dáng, hack chiều cao</strong>: Giúp đôi chân trông dài hơn, tạo cảm giác gọn gàng và chỉn chu.<br>
✔ <strong>Màu đen basic, không lỗi mốt</strong>: Phù hợp với mọi phong cách, dễ dàng mix &amp; match với nhiều loại giày và phụ kiện.</p>
<p>🔥 <strong>Sắm ngay Quần Tây Đen để luôn tự tin, lịch sự và phong cách trong mọi hoàn cảnh!</strong> ✨</p>', CAST(280000.00 AS Decimal(10, 2)), CAST(300000.00 AS Decimal(10, 2)), N'https://product.hstatic.net/200000053174/product/20_bddc67b2b01a4fc6a89b6d5ca1e78b33_master.jpg', N'active', 0, N'0', CAST(N'2024-03-10T05:35:14.1666667' AS DateTime2), CAST(N'2025-03-29T18:37:34.0566667' AS DateTime2))
GO
INSERT [dbo].[products] ([id], [title], [category_id], [description], [original_price], [sale_price], [thumbnail], [status], [is_combo], [combo_group_id], [created_at], [updated_at]) VALUES (3, N'Đầm hoa mùa hè', 14, N'<p><strong>Đầm Hoa Mùa Hè – Tươi Tắn, Nữ Tính, Thoáng Mát</strong></p>
<p>👗 <strong>Đầm Hoa Mùa Hè</strong> là lựa chọn hoàn hảo cho những ngày nắng, giúp bạn luôn rạng rỡ, nhẹ nhàng và thoải mái. Với họa tiết hoa tươi tắn cùng chất liệu thoáng mát, chiếc đầm này sẽ khiến bạn nổi bật ở mọi nơi.</p>
<p>✨ <strong>Đặc điểm nổi bật:</strong><br>
✔ <strong>Chất liệu mềm mại, thoáng mát</strong>: Voan, lụa, chiffon hoặc cotton giúp thấm hút mồ hôi tốt, thoải mái suốt ngày dài.<br>
✔ <strong>Thiết kế nữ tính, bay bổng</strong>: Dáng suông, dáng chữ A hoặc dáng xòe giúp tôn dáng mà vẫn thoải mái.<br>
✔ <strong>Họa tiết hoa nhí hoặc hoa to rực rỡ</strong>: Mang đến vẻ đẹp nhẹ nhàng, thanh lịch và tràn đầy sức sống.<br>
✔ <strong>Dễ dàng phối phụ kiện</strong>: Kết hợp cùng sandal, giày búp bê, túi cói hay mũ rộng vành để tạo nên set đồ hoàn hảo.<br>
✔ <strong>Phù hợp với nhiều dịp</strong>: Dạo phố, đi biển, hẹn hò, du lịch hay tiệc nhẹ.<br>
✔ <strong>Màu sắc đa dạng</strong>: Hồng pastel, trắng, xanh biển, vàng nhạt… mang đến sự lựa chọn phong phú.</p>
<p>🌸 <strong>Sắm ngay Đầm Hoa Mùa Hè để luôn xinh đẹp, nữ tính và cuốn hút trong mọi khoảnh khắc!</strong> ☀️✨</p>', CAST(350000.00 AS Decimal(10, 2)), CAST(400000.00 AS Decimal(10, 2)), N'https://file.hstatic.net/200000503583/file/vay-hoa-mua-he__11__c2791afbbda941238c114b00b403ec57.jpg', N'active', 0, N'0', CAST(N'2024-04-10T05:35:14.1666667' AS DateTime2), CAST(N'2025-03-29T18:36:54.0533333' AS DateTime2))
GO
INSERT [dbo].[products] ([id], [title], [category_id], [description], [original_price], [sale_price], [thumbnail], [status], [is_combo], [combo_group_id], [created_at], [updated_at]) VALUES (4, N'Chân váy denim', 50, N'<p><strong>Chân Váy Denim – Cá Tính, Trẻ Trung, Dễ Phối Đồ</strong></p>
<p>👗 <strong>Chân Váy Denim</strong> là item thời trang không bao giờ lỗi mốt, giúp bạn thể hiện phong cách năng động, cá tính nhưng vẫn nữ tính và thời thượng.</p>
<p>✨ <strong>Đặc điểm nổi bật:</strong><br>
✔ <strong>Chất liệu denim cao cấp</strong>: Bền đẹp, đứng form, mang lại cảm giác thoải mái khi mặc.<br>
✔ <strong>Thiết kế đa dạng</strong>: Dáng chữ A trẻ trung, dáng bút chì thanh lịch, dáng dài vintage hoặc kiểu rách cá tính.<br>
✔ <strong>Dễ dàng phối đồ</strong>: Mix cùng áo thun, áo sơ mi, áo croptop hay cardigan đều rất trendy.<br>
✔ <strong>Tôn dáng, hack chiều cao</strong>: Giúp đôi chân trông thon dài hơn, phù hợp với mọi vóc dáng.<br>
✔ <strong>Phù hợp với nhiều dịp</strong>: Đi học, đi chơi, dạo phố hay hẹn hò đều đẹp.<br>
✔ <strong>Màu sắc cơ bản, dễ kết hợp</strong>: Xanh denim, đen, trắng, xám… phù hợp với nhiều phong cách.</p>
<p>🔥 <strong>Sở hữu ngay Chân Váy Denim để luôn trẻ trung, cá tính và cuốn hút!</strong> ✨</p>', CAST(220000.00 AS Decimal(10, 2)), CAST(250000.00 AS Decimal(10, 2)), N'https://down-vn.img.susercontent.com/file/vn-11134207-7r98o-luaj8uf2in1bf1', N'active', 0, N'0', CAST(N'2025-02-10T05:35:14.1666667' AS DateTime2), CAST(N'2025-03-29T18:36:31.4233333' AS DateTime2))
GO
INSERT [dbo].[products] ([id], [title], [category_id], [description], [original_price], [sale_price], [thumbnail], [status], [is_combo], [combo_group_id], [created_at], [updated_at]) VALUES (5, N'Áo thun siêu nhân', 53, N'<p><strong>Áo Thun Siêu Nhân - Phong Cách Mạnh Mẽ, Cá Tính</strong></p>
<p>Bạn là fan của những siêu anh hùng? Hãy thể hiện cá tính và sức mạnh của mình với <strong>Áo Thun Siêu Nhân</strong>, mẫu áo dành riêng cho những ai yêu thích phong cách năng động và mạnh mẽ.</p>
<p>✨ <strong>Đặc điểm nổi bật:</strong><br>
✔ <strong>Chất liệu cao cấp</strong>: Vải cotton co giãn, mềm mại, thấm hút mồ hôi tốt, mang lại cảm giác thoải mái suốt cả ngày.<br>
✔ <strong>Thiết kế ấn tượng</strong>: In hình logo Siêu Nhân nổi bật, sắc nét, không bong tróc sau nhiều lần giặt.<br>
✔ <strong>Dễ phối đồ</strong>: Thích hợp cho mọi phong cách từ năng động đến cá tính, phù hợp khi đi chơi, dạo phố, hoặc tham gia sự kiện.<br>
✔ <strong>Đa dạng size</strong>: Có nhiều kích cỡ từ S đến XXL, phù hợp với mọi dáng người.</p>
<p>🔥 <strong>Hãy sở hữu ngay Áo Thun Siêu Nhân để khẳng định phong cách riêng của bạn!</strong> 🚀</p>', CAST(120000.00 AS Decimal(10, 2)), CAST(150000.00 AS Decimal(10, 2)), N'https://target.scene7.com/is/image/Target/GUEST_1079d260-d8e2-4d6e-b757-7dd7254ddda5?wid=800&hei=800&qlt=80&fmt=webp', N'active', 1, N'2', CAST(N'2024-05-10T05:35:14.1666667' AS DateTime2), CAST(N'2025-03-29T18:21:20.9966667' AS DateTime2))
GO
INSERT [dbo].[products] ([id], [title], [category_id], [description], [original_price], [sale_price], [thumbnail], [status], [is_combo], [combo_group_id], [created_at], [updated_at]) VALUES (6, N'Quần short cotton', 56, N'<p><strong>Quần Short Cotton – Thoải Mái, Thời Trang, Dễ Phối Đồ</strong></p>
<p>🩳 <strong>Quần Short Cotton</strong> là lựa chọn lý tưởng cho những ngày hè nóng bức, mang đến sự thoải mái, thoáng mát mà vẫn giữ được phong cách trẻ trung, năng động.</p>
<p>✨ <strong>Đặc điểm nổi bật:</strong><br>
✔ <strong>Chất liệu cotton cao cấp</strong>: Mềm mại, thấm hút mồ hôi tốt, giúp bạn luôn khô thoáng cả ngày.<br>
✔ <strong>Thiết kế đơn giản nhưng tinh tế</strong>: Dáng suông hoặc ôm nhẹ, phù hợp với nhiều vóc dáng.<br>
✔ <strong>Cạp chun co giãn hoặc có dây rút</strong>: Dễ dàng điều chỉnh theo vòng eo, giúp mặc thoải mái hơn.<br>
✔ <strong>Dễ dàng phối đồ</strong>: Kết hợp hoàn hảo với áo thun, polo, sơ mi hay hoodie để tạo nhiều phong cách khác nhau.<br>
✔ <strong>Phù hợp với nhiều dịp</strong>: Mặc ở nhà, đi dạo phố, tập thể thao hay du lịch đều rất tiện lợi.<br>
✔ <strong>Màu sắc đa dạng</strong>: Đen, trắng, xám, xanh navy, be… giúp bạn dễ dàng lựa chọn theo sở thích.</p>
<p>🔥 <strong>Sắm ngay Quần Short Cotton để luôn thoải mái, phong cách và tự tin trong mọi hoạt động!</strong> ✨</p>', CAST(100000.00 AS Decimal(10, 2)), CAST(120000.00 AS Decimal(10, 2)), N'https://ardilla.com.vn/wp-content/uploads/2022/03/TB1601QST.jpg', N'active', 0, N'0', CAST(N'2025-02-10T05:35:14.1666667' AS DateTime2), CAST(N'2025-03-29T18:36:12.8733333' AS DateTime2))
GO
INSERT [dbo].[products] ([id], [title], [category_id], [description], [original_price], [sale_price], [thumbnail], [status], [is_combo], [combo_group_id], [created_at], [updated_at]) VALUES (7, N'Thắt lưng da', 61, N'<p><strong>Giày Thể Thao – Thoải Mái, Năng Động, Phù Hợp Mọi Hoạt Động</strong></p>
<p>👟 <strong>Giày Thể Thao</strong> là sự lựa chọn hoàn hảo cho những ai yêu thích vận động và phong cách trẻ trung. Với thiết kế hiện đại, chất liệu thoáng khí và đế êm ái, đôi giày này sẽ giúp bạn luôn thoải mái khi di chuyển.</p>
<p>✨ <strong>Đặc điểm nổi bật:</strong><br>
✔ <strong>Chất liệu cao cấp</strong>: Vải lưới (mesh), da tổng hợp hoặc knit thoáng khí, giúp chân luôn khô ráo và dễ chịu.<br>
✔ <strong>Đế cao su chống trơn trượt</strong>: Hỗ trợ giảm chấn, bám đường tốt, an toàn khi vận động.<br>
✔ <strong>Thiết kế thể thao hiện đại</strong>: Kiểu dáng ôm chân, thời trang, phù hợp với nhiều phong cách khác nhau.<br>
✔ <strong>Dễ dàng phối đồ</strong>: Kết hợp hoàn hảo với quần jogger, quần short, quần jeans hay đồ thể thao.<br>
✔ <strong>Phù hợp với nhiều hoạt động</strong>: Tập gym, chạy bộ, đá bóng, chơi cầu lông, đi dạo hay đi học, đi làm đều tiện lợi.<br>
✔ <strong>Màu sắc đa dạng</strong>: Đen, trắng, xanh, xám, đỏ… phù hợp với cá tính riêng của bạn.</p>
<p>🔥 <strong>Sở hữu ngay Giày Thể Thao để luôn tự tin, năng động và thoải mái trên từng bước chân!</strong> 💪🚀</p>', CAST(180000.00 AS Decimal(10, 2)), CAST(200000.00 AS Decimal(10, 2)), N'https://authenticvietnam.vn/wp-content/uploads/that-lung-da-gucci-nam-406831DJ20T_2145_001_100_0000_Light-Leather-belt-with-Double-G-buckle.jpg', N'active', 0, N'0', CAST(N'2024-07-10T05:35:14.1666667' AS DateTime2), CAST(N'2025-03-29T18:35:49.2233333' AS DateTime2))
GO
INSERT [dbo].[products] ([id], [title], [category_id], [description], [original_price], [sale_price], [thumbnail], [status], [is_combo], [combo_group_id], [created_at], [updated_at]) VALUES (8, N'Thắt lưng da', 61, N'Thắt lưng da cao cấp, bền đẹp theo thời gian', CAST(180000.00 AS Decimal(10, 2)), CAST(200000.00 AS Decimal(10, 2)), N'https://babuhandmade.com/wp-content/uploads/2022/01/that-lung-da-day-that-lung-nam-that-lung-nam-dep-that-lung-da-bo-that-lung-da-nam-that-lung-nam-da-bo-mua-that-lung-nam-day-that-lung-da-bo-xin-leather-belts-belts-belt-for-men-buckle-belt-1.jpg', N'EOStock', 0, NULL, CAST(N'2024-08-10T05:35:14.1666667' AS DateTime2), CAST(N'2025-02-10T05:35:14.1666667' AS DateTime2))
GO
INSERT [dbo].[products] ([id], [title], [category_id], [description], [original_price], [sale_price], [thumbnail], [status], [is_combo], [combo_group_id], [created_at], [updated_at]) VALUES (9, N'Giày thể thao', 29, N'<p><strong>Giày Thể Thao – Thoải Mái, Năng Động, Phù Hợp Mọi Hoạt Động</strong></p>
<p>👟 <strong>Giày Thể Thao</strong> là sự lựa chọn hoàn hảo cho những ai yêu thích vận động và phong cách trẻ trung. Với thiết kế hiện đại, chất liệu thoáng khí và đế êm ái, đôi giày này sẽ giúp bạn luôn thoải mái khi di chuyển.</p>
<p>✨ <strong>Đặc điểm nổi bật:</strong><br>
✔ <strong>Chất liệu cao cấp</strong>: Vải lưới (mesh), da tổng hợp hoặc knit thoáng khí, giúp chân luôn khô ráo và dễ chịu.<br>
✔ <strong>Đế cao su chống trơn trượt</strong>: Hỗ trợ giảm chấn, bám đường tốt, an toàn khi vận động.<br>
✔ <strong>Thiết kế thể thao hiện đại</strong>: Kiểu dáng ôm chân, thời trang, phù hợp với nhiều phong cách khác nhau.<br>
✔ <strong>Dễ dàng phối đồ</strong>: Kết hợp hoàn hảo với quần jogger, quần short, quần jeans hay đồ thể thao.<br>
✔ <strong>Phù hợp với nhiều hoạt động</strong>: Tập gym, chạy bộ, đá bóng, chơi cầu lông, đi dạo hay đi học, đi làm đều tiện lợi.<br>
✔ <strong>Màu sắc đa dạng</strong>: Đen, trắng, xanh, xám, đỏ… phù hợp với cá tính riêng của bạn.</p>
<p>🔥 <strong>Sở hữu ngay Giày Thể Thao để luôn tự tin, năng động và thoải mái trên từng bước chân!</strong> 💪🚀</p>', CAST(450000.00 AS Decimal(10, 2)), CAST(500000.00 AS Decimal(10, 2)), N'https://img.mwc.com.vn/giay-thoi-trang?w=480&h=510&FileInput=/Resources/Product/2024/09/22/z5855779313414_2914371405362ca7f474791328971969.jpg', N'active', 0, N'0', CAST(N'2025-02-10T05:35:14.1666667' AS DateTime2), CAST(N'2025-03-29T18:35:32.9733333' AS DateTime2))
GO
INSERT [dbo].[products] ([id], [title], [category_id], [description], [original_price], [sale_price], [thumbnail], [status], [is_combo], [combo_group_id], [created_at], [updated_at]) VALUES (10, N'Giày sneaker', 30, N'<p><strong>Giày Sneaker – Năng Động, Phong Cách, Dễ Phối Đồ</strong></p>
<p>👟 <strong>Giày Sneaker</strong> là lựa chọn hoàn hảo cho những ai yêu thích sự thoải mái nhưng vẫn muốn giữ phong cách thời trang. Với thiết kế trẻ trung, hiện đại, sneaker phù hợp cho mọi độ tuổi và mọi hoàn cảnh.</p>
<p>✨ <strong>Đặc điểm nổi bật:</strong><br>
✔ <strong>Chất liệu cao cấp</strong>: Da tổng hợp, vải canvas hoặc mesh thoáng khí, mang lại sự thoải mái khi di chuyển cả ngày.<br>
✔ <strong>Đế cao su bền bỉ, chống trơn trượt</strong>: Giúp bước đi chắc chắn, an toàn trên mọi địa hình.<br>
✔ <strong>Thiết kế thời trang, dễ phối đồ</strong>: Dễ dàng kết hợp với quần jean, quần jogger, chân váy hay quần short để tạo nên nhiều phong cách khác nhau.<br>
✔ <strong>Phong cách đa dạng</strong>: Từ basic đơn giản đến sneaker chunky cá tính hay sneaker cổ cao ấn tượng.<br>
✔ <strong>Phù hợp cho nhiều dịp</strong>: Đi học, đi chơi, tập thể thao, dạo phố hay du lịch đều rất tiện dụng.<br>
✔ <strong>Màu sắc trendy</strong>: Đen, trắng, xám, be, xanh… giúp bạn dễ dàng lựa chọn theo phong cách cá nhân.</p>
<p>🔥 <strong>Sắm ngay Giày Sneaker để luôn tự tin, thoải mái và phong cách trên mọi bước chân!</strong> 🚀✨</p>', CAST(350000.00 AS Decimal(10, 2)), CAST(400000.00 AS Decimal(10, 2)), N'https://bizweb.dktcdn.net/thumb/large/100/041/044/products/48f5343d-9f9a-4ed2-aa02-de2ad1f4fabc-jpeg.jpg?v=1694597357733', N'active', 0, N'0', CAST(N'2025-02-10T05:35:14.1666667' AS DateTime2), CAST(N'2025-03-29T18:35:15.5866667' AS DateTime2))
GO
INSERT [dbo].[products] ([id], [title], [category_id], [description], [original_price], [sale_price], [thumbnail], [status], [is_combo], [combo_group_id], [created_at], [updated_at]) VALUES (11, N'Quần short siêu nhân', 56, N'<p><strong>Quần Short Siêu Nhân – Năng Động, Thoải Mái, Cá Tính</strong></p>
<p>🔥 Bạn yêu thích phong cách mạnh mẽ và phóng khoáng? <strong>Quần Short Siêu Nhân</strong> chính là lựa chọn hoàn hảo giúp bạn thể hiện cá tính riêng!</p>
<p>✨ <strong>Đặc điểm nổi bật:</strong><br>
✔ <strong>Chất liệu cao cấp</strong>: Vải thun cotton co giãn, thoáng khí, thấm hút mồ hôi tốt, giúp bạn luôn thoải mái suốt cả ngày.<br>
✔ <strong>Thiết kế thời thượng</strong>: In logo Siêu Nhân sắc nét, bền màu, tạo điểm nhấn ấn tượng.<br>
✔ <strong>Kiểu dáng tiện lợi</strong>: Form quần vừa vặn, có dây rút điều chỉnh, phù hợp cho mọi hoạt động từ tập gym, dạo phố đến đi chơi.<br>
✔ <strong>Phối đồ dễ dàng</strong>: Kết hợp hoàn hảo với áo thun, hoodie hoặc áo khoác để tạo phong cách mạnh mẽ, nam tính.<br>
✔ <strong>Đa dạng size</strong>: Từ M đến XXL, phù hợp với nhiều dáng người.</p>
<p>🚀 <strong>Sẵn sàng bứt phá phong cách với Quần Short Siêu Nhân – Đặt hàng ngay hôm nay!</strong> 💥</p>', CAST(480000.00 AS Decimal(10, 2)), CAST(550000.00 AS Decimal(10, 2)), N'https://img.alicdn.com/imgextra/i3/350427093/O1CN01JDrMyz22GdnbaZ9Y6_!!350427093.jpg_600x600.jpg_.webp', N'active', 0, N'2', CAST(N'2025-02-10T05:35:14.1666667' AS DateTime2), CAST(N'2025-03-29T18:23:52.0366667' AS DateTime2))
GO
INSERT [dbo].[products] ([id], [title], [category_id], [description], [original_price], [sale_price], [thumbnail], [status], [is_combo], [combo_group_id], [created_at], [updated_at]) VALUES (12, N'Áo sơ mi xanh', 12, N'<p><strong>Áo Sơ Mi Xanh – Lịch Lãm, Thanh Lịch, Dễ Phối Đồ</strong></p>
<p>👔 <strong>Áo Sơ Mi Xanh</strong> mang đến vẻ ngoài lịch lãm, trẻ trung và đầy phong cách. Với tông màu dịu mắt, dễ phối đồ, đây là item không thể thiếu trong tủ đồ của bạn!</p>
<p>✨ <strong>Đặc điểm nổi bật:</strong><br>
✔ <strong>Chất liệu cao cấp</strong>: Vải cotton, linen hoặc lụa thoáng khí, mềm mại, thấm hút mồ hôi tốt, tạo cảm giác thoải mái suốt cả ngày.<br>
✔ <strong>Thiết kế tinh tế</strong>: Kiểu dáng đơn giản nhưng sang trọng, phù hợp với nhiều phong cách khác nhau.<br>
✔ <strong>Dễ dàng phối đồ</strong>: Kết hợp với quần tây để lịch lãm, quần jeans để năng động hoặc quần kaki để trẻ trung.<br>
✔ <strong>Màu sắc đa dạng</strong>: Từ xanh pastel nhẹ nhàng, xanh navy nam tính đến xanh rêu cá tính, phù hợp với nhiều phong cách.<br>
✔ <strong>Kiểu dáng phù hợp mọi vóc dáng</strong>: Có cả form slim fit ôm gọn giúp tôn dáng và form oversize thoải mái, hiện đại.<br>
✔ <strong>Phù hợp cho nhiều dịp</strong>: Đi làm, đi học, đi chơi hay dự tiệc, áo sơ mi xanh luôn giúp bạn trông lịch sự và thu hút.</p>
<p>🔥 <strong>Sắm ngay Áo Sơ Mi Xanh để luôn nổi bật và phong cách trong mọi hoàn cảnh!</strong> 💙✨</p>', CAST(180000.00 AS Decimal(10, 2)), CAST(200000.00 AS Decimal(10, 2)), N'https://pos.nvncdn.com/a36e05-151378/ps/20230712_TkKQqMtkUO.jpeg', N'active', 0, N'1', CAST(N'2025-02-10T08:08:36.0633333' AS DateTime2), CAST(N'2025-03-29T18:31:28.0800000' AS DateTime2))
GO
INSERT [dbo].[products] ([id], [title], [category_id], [description], [original_price], [sale_price], [thumbnail], [status], [is_combo], [combo_group_id], [created_at], [updated_at]) VALUES (13, N'Áo khoác bomber nam', 25, N'<p><strong>Áo Khoác Bomber Nam – Phong Cách, Cá Tính, Đậm Chất Streetwear</strong></p>
<p>🧥 <strong>Áo Khoác Bomber Nam</strong> là item thời trang không bao giờ lỗi mốt, giúp bạn trông nam tính, trẻ trung và cực kỳ năng động. Với thiết kế hiện đại, bomber dễ dàng phối với nhiều phong cách khác nhau, phù hợp cho mọi dịp.</p>
<p>✨ <strong>Đặc điểm nổi bật:</strong><br>
✔ <strong>Chất liệu cao cấp</strong>: Vải dù, nỉ, da lộn hoặc kaki dày dặn, giữ ấm tốt nhưng vẫn thoáng khí, thoải mái khi mặc.<br>
✔ <strong>Thiết kế cá tính, mạnh mẽ</strong>: Form rộng hoặc ôm vừa vặn, bo gấu và bo tay tạo nét khỏe khoắn, thời trang.<br>
✔ <strong>Dễ dàng phối đồ</strong>: Kết hợp với áo thun, hoodie, quần jean hoặc jogger cùng sneaker để tạo phong cách cool ngầu, năng động.<br>
✔ <strong>Màu sắc nam tính, dễ chọn</strong>: Đen, xanh rêu, xám, be, nâu… phù hợp với nhiều gu thời trang khác nhau.<br>
✔ <strong>Phù hợp cho nhiều dịp</strong>: Đi học, đi làm, đi chơi, dạo phố hay du lịch đều rất phong cách.<br>
✔ <strong>Unisex – Phù hợp cho cả nam &amp; nữ</strong>: Thiết kế đa năng giúp ai cũng có thể diện đẹp với bomber.</p>
<p>🔥 <strong>Sở hữu ngay Áo Khoác Bomber Nam để luôn phong cách, nam tính và cuốn hút!</strong> 🕶✨</p>', CAST(399000.00 AS Decimal(10, 2)), CAST(450000.00 AS Decimal(10, 2)), N'https://ginstore.com.vn/files/sanpham/1885/1/png/ao-khoac-bomber-local-brand-rg-butterfly-varsity-jacket-nam-nu-tay-da-vasity-bong-chay-form-rong-unisex.png', N'active', 0, N'0', CAST(N'2025-02-24T10:15:00.0000000' AS DateTime2), CAST(N'2025-03-29T18:34:47.1600000' AS DateTime2))
GO
INSERT [dbo].[products] ([id], [title], [category_id], [description], [original_price], [sale_price], [thumbnail], [status], [is_combo], [combo_group_id], [created_at], [updated_at]) VALUES (14, N'Quần jogger thể thao', 27, N'<p><strong>Quần Jogger Thể Thao – Năng Động, Thoải Mái, Phong Cách</strong></p>
<p>👖 <strong>Quần Jogger Thể Thao</strong> là item không thể thiếu cho những ai yêu thích phong cách năng động, thoải mái mà vẫn cực kỳ thời trang. Với thiết kế hiện đại, phù hợp cho cả nam và nữ, quần jogger giúp bạn tự tin trong mọi hoạt động hàng ngày.</p>
<p>✨ <strong>Đặc điểm nổi bật:</strong><br>
✔ <strong>Chất liệu cao cấp</strong>: Vải nỉ, thun da cá hoặc polyester thoáng khí, co giãn tốt, tạo cảm giác thoải mái khi vận động.<br>
✔ <strong>Thiết kế trẻ trung, hiện đại</strong>: Cạp chun co giãn, dây rút tùy chỉnh giúp ôm vừa vặn, bo gấu tạo form gọn gàng và cá tính.<br>
✔ <strong>Dễ dàng phối đồ</strong>: Kết hợp cùng áo thun, hoodie, áo khoác bomber hoặc sneaker để tạo phong cách thể thao, streetwear đầy cá tính.<br>
✔ <strong>Phù hợp với nhiều hoạt động</strong>: Tập gym, chạy bộ, đi chơi, dạo phố hay mặc nhà đều rất tiện lợi.<br>
✔ <strong>Màu sắc cơ bản, dễ phối</strong>: Đen, xám, trắng, xanh rêu, be… mang đến vẻ ngoài thời thượng.<br>
✔ <strong>Phù hợp cho cả nam &amp; nữ</strong>: Thiết kế unisex giúp ai cũng có thể diện phong cách jogger cực chất.</p>
<p>🔥 <strong>Sắm ngay Quần Jogger Thể Thao để luôn tự tin, thoải mái và phong cách trong mọi hoạt động!</strong> 🏃‍♂️✨</p>', CAST(199000.00 AS Decimal(10, 2)), CAST(250000.00 AS Decimal(10, 2)), N'https://thegioidotap.vn/wp-content/uploads/2020/12/quan-dai-the-thao-nam-jogger-sg10-3.jpg', N'active', 0, N'0', CAST(N'2025-02-24T10:20:00.0000000' AS DateTime2), CAST(N'2025-03-29T18:34:27.4900000' AS DateTime2))
GO
INSERT [dbo].[products] ([id], [title], [category_id], [description], [original_price], [sale_price], [thumbnail], [status], [is_combo], [combo_group_id], [created_at], [updated_at]) VALUES (15, N'Đầm maxi hoa nhí', 17, N'<p><strong>Đầm Maxi Hoa Nhí – Nữ Tính, Thanh Lịch, Bay Bổng</strong></p>
<p>👗 <strong>Đầm Maxi Hoa Nhí</strong> là lựa chọn hoàn hảo cho những cô nàng yêu thích sự nhẹ nhàng, nữ tính và quyến rũ. Với thiết kế dài thướt tha cùng họa tiết hoa nhí tinh tế, chiếc đầm này sẽ giúp bạn luôn tỏa sáng trong mọi khoảnh khắc.</p>
<p>✨ <strong>Đặc điểm nổi bật:</strong><br>
✔ <strong>Chất liệu cao cấp</strong>: Vải voan, chiffon hoặc lụa mềm mại, nhẹ nhàng, tạo cảm giác bay bổng và thoải mái khi mặc.<br>
✔ <strong>Thiết kế thanh lịch</strong>: Dáng suông hoặc chiết eo nhẹ giúp tôn dáng mà vẫn thoải mái, phù hợp với mọi vóc dáng.<br>
✔ <strong>Họa tiết hoa nhí tinh tế</strong>: Mang đến vẻ đẹp nhẹ nhàng, nữ tính và cực kỳ trendy.<br>
✔ <strong>Dễ dàng phối đồ</strong>: Kết hợp cùng sandal, mũ cói, túi đan để tạo phong cách bohemian hoặc phối với giày cao gót để thêm phần thanh lịch.<br>
✔ <strong>Phù hợp với nhiều dịp</strong>: Đi chơi, du lịch, dạo phố, dự tiệc ngoài trời hay chụp ảnh sống ảo.<br>
✔ <strong>Màu sắc đa dạng</strong>: Be, trắng, xanh pastel, hồng, nâu đất… mang đến sự lựa chọn phong phú theo sở thích.</p>
<p>🌸 <strong>Sở hữu ngay Đầm Maxi Hoa Nhí để luôn duyên dáng, nhẹ nhàng và cuốn hút!</strong> ✨💃</p>', CAST(375000.00 AS Decimal(10, 2)), CAST(420000.00 AS Decimal(10, 2)), N'https://vayfashion.com/wp-content/uploads/2022/05/2c7cf97edbac2d98f120bf85c824f1aa.jpg', N'active', 0, N'0', CAST(N'2025-02-24T10:25:00.0000000' AS DateTime2), CAST(N'2025-03-29T18:34:07.1066667' AS DateTime2))
GO
INSERT [dbo].[products] ([id], [title], [category_id], [description], [original_price], [sale_price], [thumbnail], [status], [is_combo], [combo_group_id], [created_at], [updated_at]) VALUES (16, N'Áo thun unisex', 16, N'<p><strong>Áo Thun Unisex – Thoải Mái, Phong Cách, Dễ Phối Đồ</strong></p>
<p>👕 <strong>Áo Thun Unisex</strong> là item thời trang không thể thiếu trong tủ đồ, phù hợp cho cả nam và nữ, giúp bạn luôn thoải mái, năng động và sành điệu.</p>
<p>✨ <strong>Đặc điểm nổi bật:</strong><br>
✔ <strong>Chất liệu cao cấp</strong>: Vải cotton 100%, thấm hút mồ hôi tốt, mềm mại và co giãn nhẹ, mang lại cảm giác dễ chịu khi mặc.<br>
✔ <strong>Thiết kế rộng rãi, thoải mái</strong>: Form oversize hoặc regular fit phù hợp với mọi dáng người, che khuyết điểm tốt.<br>
✔ <strong>Dễ dàng phối đồ</strong>: Kết hợp hoàn hảo với quần jeans, quần short, chân váy hay khoác ngoài cùng áo sơ mi, cardigan… để tạo nhiều phong cách khác nhau.<br>
✔ <strong>Kiểu dáng trẻ trung, năng động</strong>: Có nhiều mẫu trơn, in hình, in chữ, graphic độc đáo giúp bạn thể hiện cá tính riêng.<br>
✔ <strong>Màu sắc đa dạng</strong>: Đen, trắng, be, xanh, xám, hồng pastel… dễ dàng lựa chọn theo phong cách yêu thích.<br>
✔ <strong>Phù hợp cho mọi dịp</strong>: Đi học, đi chơi, dạo phố hay hoạt động thể thao đều rất tiện lợi.</p>
<p>🔥 <strong>Sắm ngay Áo Thun Unisex để luôn tự tin, thoải mái và thời thượng!</strong> 💥✨</p>', CAST(150000.00 AS Decimal(10, 2)), CAST(180000.00 AS Decimal(10, 2)), N'https://sure.vn/wp-content/uploads/2024/08/7-1-scaled.jpg', N'active', 0, N'0', CAST(N'2025-02-24T10:30:00.0000000' AS DateTime2), CAST(N'2025-03-29T18:33:47.7000000' AS DateTime2))
GO
INSERT [dbo].[products] ([id], [title], [category_id], [description], [original_price], [sale_price], [thumbnail], [status], [is_combo], [combo_group_id], [created_at], [updated_at]) VALUES (17, N'Váy công chúa cho bé gái', 58, N'<p><strong>Váy Công Chúa Cho Bé Gái – Xinh Xắn, Lộng Lẫy, Dễ Thương</strong></p>
<p>👗 Biến bé yêu thành một nàng công chúa đáng yêu với <strong>Váy Công Chúa Bé Gái</strong>! Thiết kế bồng bềnh, tinh tế giúp bé tỏa sáng trong mọi khoảnh khắc.</p>
<p>✨ <strong>Đặc điểm nổi bật:</strong><br>
✔ <strong>Chất liệu cao cấp</strong>: Vải voan mềm mại, ren nhẹ nhàng, cotton thấm hút tốt giúp bé thoải mái cả ngày.<br>
✔ <strong>Thiết kế lộng lẫy</strong>: Kiểu dáng bồng bềnh với nhiều lớp váy xếp tầng, tay phồng hoặc cánh tiên, tạo nét đáng yêu và sang trọng.<br>
✔ <strong>Màu sắc ngọt ngào</strong>: Hồng, trắng, xanh pastel, tím, đỏ… phù hợp với phong cách công chúa nhẹ nhàng.<br>
✔ <strong>Phù hợp cho nhiều dịp</strong>: Tiệc sinh nhật, chụp ảnh, dạo chơi hay các sự kiện đặc biệt.<br>
✔ <strong>Dễ dàng phối phụ kiện</strong>: Hoàn hảo khi kết hợp cùng băng đô, vương miện, giày búp bê để bé thêm phần đáng yêu.<br>
✔ <strong>Đủ size cho bé từ 1 đến 10 tuổi</strong>: Phù hợp với mọi vóc dáng, giúp bé luôn thoải mái và xinh đẹp.</p>
<p>🎀 <strong>Sắm ngay Váy Công Chúa Cho Bé Gái để bé yêu tỏa sáng như nàng tiên nhỏ trong mọi khoảnh khắc!</strong> 👑✨</p>', CAST(289000.00 AS Decimal(10, 2)), CAST(320000.00 AS Decimal(10, 2)), N'https://tutupetti.com/wp-content/uploads/2023/07/dam_dep_cho_be_du_tiec_04.jpg', N'active', 0, N'0', CAST(N'2025-02-24T10:35:00.0000000' AS DateTime2), CAST(N'2025-03-29T18:33:27.5400000' AS DateTime2))
GO
INSERT [dbo].[products] ([id], [title], [category_id], [description], [original_price], [sale_price], [thumbnail], [status], [is_combo], [combo_group_id], [created_at], [updated_at]) VALUES (18, N'Balo nam thời trang', 60, N'<p><strong>Balo Nam Thời Trang – Hiện Đại, Đa Năng, Phong Cách</strong></p>
<p>🎒 <strong>Balo Nam Thời Trang</strong> không chỉ là phụ kiện tiện lợi mà còn là điểm nhấn giúp phái mạnh thêm phần cá tính, năng động và lịch lãm.</p>
<p>✨ <strong>Đặc điểm nổi bật:</strong><br>
✔ <strong>Thiết kế thời thượng</strong>: Kiểu dáng nam tính, mạnh mẽ với đường nét tinh tế, phù hợp với nhiều phong cách khác nhau.<br>
✔ <strong>Chất liệu cao cấp</strong>: Vải Oxford, da PU hoặc vải chống thấm nước giúp bảo vệ đồ dùng khỏi mưa nhẹ, dễ dàng vệ sinh.<br>
✔ <strong>Ngăn chứa rộng rãi</strong>: Có nhiều ngăn tiện lợi để đựng laptop, sách vở, quần áo, phụ kiện cá nhân… phù hợp khi đi làm, đi học, du lịch.<br>
✔ <strong>Dây đeo êm ái</strong>: Quai đeo có đệm mút giúp giảm áp lực lên vai, thoải mái khi mang cả ngày dài.<br>
✔ <strong>Khóa kéo chắc chắn</strong>: Chất lượng cao, bền bỉ, giúp bảo vệ đồ dùng an toàn.<br>
✔ <strong>Phong cách đa dạng</strong>: Từ balo công sở thanh lịch, balo thể thao năng động đến balo du lịch tiện dụng.<br>
✔ <strong>Màu sắc nam tính</strong>: Đen, xám, xanh navy, nâu… dễ dàng phối đồ theo sở thích.</p>
<p>🔥 <strong>Sắm ngay Balo Nam Thời Trang – Sự lựa chọn hoàn hảo để luôn tự tin và phong cách mọi lúc mọi nơi!</strong> 🎒✨</p>', CAST(299000.00 AS Decimal(10, 2)), CAST(350000.00 AS Decimal(10, 2)), N'https://gubag.vn/wp-content/uploads/2021/07/balo-nam-thoi-trang-gb-bl14-xd.webp', N'active', 0, N'0', CAST(N'2025-02-24T10:40:00.0000000' AS DateTime2), CAST(N'2025-03-29T18:33:08.0166667' AS DateTime2))
GO
INSERT [dbo].[products] ([id], [title], [category_id], [description], [original_price], [sale_price], [thumbnail], [status], [is_combo], [combo_group_id], [created_at], [updated_at]) VALUES (19, N'Dây chuyền bạc nữ', 67, N'<p><strong>Dây Chuyền Bạc Nữ – Thanh Lịch, Tinh Tế, Tỏa Sáng</strong></p>
<p>💎 <strong>Dây Chuyền Bạc Nữ</strong> là món trang sức không thể thiếu giúp tôn lên vẻ đẹp thanh lịch, nữ tính và sang trọng của phái đẹp.</p>
<p>✨ <strong>Đặc điểm nổi bật:</strong><br>
✔ <strong>Chất liệu bạc cao cấp</strong>: Bạc S925 sáng bóng, không gỉ sét, an toàn cho da, phù hợp cả với làn da nhạy cảm.<br>
✔ <strong>Thiết kế tinh tế</strong>: Kiểu dáng thanh mảnh, nhẹ nhàng nhưng không kém phần nổi bật, phù hợp với mọi phong cách.<br>
✔ <strong>Mặt dây chuyền đa dạng</strong>: Nhiều mẫu từ đơn giản đến sang trọng như trái tim, giọt nước, hoa, chữ cái, đính đá Zircon lấp lánh.<br>
✔ <strong>Dễ dàng phối đồ</strong>: Phù hợp khi đi làm, đi chơi, dự tiệc hay làm quà tặng ý nghĩa cho người thân và bạn bè.<br>
✔ <strong>Độ bền cao</strong>: Bề mặt bạc được xử lý chống xỉn màu, dễ dàng làm sáng lại sau thời gian sử dụng.<br>
✔ <strong>Phù hợp với mọi phong cách</strong>: Từ nhẹ nhàng, nữ tính đến cá tính, sang trọng.</p>
<p>🎁 <strong>Sở hữu ngay Dây Chuyền Bạc Nữ – Món trang sức hoàn hảo giúp bạn luôn tỏa sáng và cuốn hút!</strong> ✨</p>', CAST(225000.00 AS Decimal(10, 2)), CAST(250000.00 AS Decimal(10, 2)), N'https://pos.nvncdn.com/211f76-106986/ps/20240805_RdCu2zj3rc.jpeg', N'active', 0, N'0', CAST(N'2025-02-24T10:45:00.0000000' AS DateTime2), CAST(N'2025-03-29T18:32:42.2200000' AS DateTime2))
GO
INSERT [dbo].[products] ([id], [title], [category_id], [description], [original_price], [sale_price], [thumbnail], [status], [is_combo], [combo_group_id], [created_at], [updated_at]) VALUES (20, N'Giày cao gót nữ', 32, N'<p><strong>Giày Cao Gót Nữ – Thanh Lịch, Tôn Dáng, Sang Trọng</strong></p>
<p>👠 <strong>Giày Cao Gót Nữ</strong> là phụ kiện không thể thiếu giúp phái đẹp thêm phần duyên dáng, tự tin và cuốn hút trong mọi hoàn cảnh.</p>
<p>✨ <strong>Đặc điểm nổi bật:</strong><br>
✔ <strong>Thiết kế tinh tế</strong>: Kiểu dáng thanh lịch, tôn dáng với nhiều mẫu như gót nhọn, gót vuông, hở mũi hoặc mũi nhọn, phù hợp với mọi phong cách.<br>
✔ <strong>Chất liệu cao cấp</strong>: Da tổng hợp mềm mại, da lộn sang trọng hoặc vải satin nhẹ nhàng, mang lại cảm giác thoải mái khi di chuyển.<br>
✔ <strong>Chiều cao đa dạng</strong>: Từ 3cm nhẹ nhàng đến 10cm quyến rũ, phù hợp với nhiều nhu cầu sử dụng.<br>
✔ <strong>Đế êm ái, chống trơn trượt</strong>: Lót đệm mềm giúp bước đi chắc chắn, hạn chế đau chân khi di chuyển nhiều.<br>
✔ <strong>Dễ dàng phối đồ</strong>: Kết hợp hoàn hảo với đầm dạ hội, chân váy, quần jean hay quần tây, tạo điểm nhấn cho mọi outfit.<br>
✔ <strong>Phù hợp cho mọi dịp</strong>: Dự tiệc, đi làm, hẹn hò hay dạo phố, giày cao gót luôn giúp bạn tỏa sáng.<br>
✔ <strong>Màu sắc sang trọng</strong>: Đen, nude, đỏ, be, ánh kim… dễ dàng lựa chọn theo sở thích.</p>
<p>🔥 <strong>Sắm ngay Giày Cao Gót Nữ để luôn tự tin, quyến rũ và đầy phong cách trong từng bước chân!</strong> 💃✨</p>', CAST(330000.00 AS Decimal(10, 2)), CAST(380000.00 AS Decimal(10, 2)), N'https://img.mwc.com.vn/giay-thoi-trang?w=480&h=510&FileInput=/Resources/Product/2024/09/20/z5850479583248_27cb755c82bd913bc95a09019f771777.jpg', N'active', 0, N'0', CAST(N'2025-02-24T10:50:00.0000000' AS DateTime2), CAST(N'2025-03-29T18:32:15.3233333' AS DateTime2))
GO
INSERT [dbo].[products] ([id], [title], [category_id], [description], [original_price], [sale_price], [thumbnail], [status], [is_combo], [combo_group_id], [created_at], [updated_at]) VALUES (21, N'Kính mát thời trang', 65, N'<p><strong>Kính Mát Thời Trang – Sành Điệu, Bảo Vệ Mắt, Tôn Phong Cách</strong></p>
<p>🕶 Bạn muốn sở hữu một chiếc kính vừa thời trang vừa bảo vệ mắt hiệu quả? <strong>Kính Mát Thời Trang</strong> chính là phụ kiện không thể thiếu giúp bạn luôn phong cách và tự tin!</p>
<p>✨ <strong>Đặc điểm nổi bật:</strong><br>
✔ <strong>Thiết kế thời thượng</strong>: Nhiều kiểu dáng hiện đại như kính phi công, kính gọng vuông, kính mắt mèo, kính tròn vintage… phù hợp với mọi phong cách.<br>
✔ <strong>Chống tia UV &amp; bảo vệ mắt</strong>: Tròng kính chất lượng cao giúp bảo vệ mắt khỏi tia UV, chống chói hiệu quả khi ra ngoài trời.<br>
✔ <strong>Chất liệu bền bỉ</strong>: Gọng kính làm từ hợp kim nhẹ hoặc nhựa dẻo cao cấp, chắc chắn, không gây khó chịu khi đeo lâu.<br>
✔ <strong>Dễ phối đồ</strong>: Phù hợp khi đi biển, đi chơi, du lịch hoặc sử dụng hàng ngày để tăng thêm phần cá tính.<br>
✔ <strong>Đa dạng màu sắc &amp; kiểu dáng</strong>: Nhiều lựa chọn từ đen, nâu, xanh, xám, gọng trong suốt… dễ dàng mix &amp; match theo sở thích.<br>
✔ <strong>Phù hợp cho cả nam &amp; nữ</strong>: Thiết kế unisex giúp ai cũng có thể sở hữu một phụ kiện hoàn hảo.</p>
<p>🔥 <strong>Sở hữu ngay Kính Mát Thời Trang để luôn tự tin, phong cách và bảo vệ đôi mắt khỏi ánh nắng!</strong> 🌞✨</p>', CAST(175000.00 AS Decimal(10, 2)), CAST(200000.00 AS Decimal(10, 2)), N'https://hoyahc.vn/wp-content/uploads/2022/01/kinh-redex-kinh-mat.jpg', N'active', 0, N'0', CAST(N'2025-02-24T10:55:00.0000000' AS DateTime2), CAST(N'2025-03-29T18:29:57.7733333' AS DateTime2))
GO
INSERT [dbo].[products] ([id], [title], [category_id], [description], [original_price], [sale_price], [thumbnail], [status], [is_combo], [combo_group_id], [created_at], [updated_at]) VALUES (22, N'Áo sơ mi nam kẻ sọc', 12, N'<p><strong>Áo Sơ Mi Nam Kẻ Sọc – Thanh Lịch, Nam Tính, Dễ Phối Đồ</strong></p>
<p>👔 Bạn đang tìm một chiếc áo sơ mi vừa lịch lãm, vừa phong cách nhưng vẫn thoải mái? <strong>Áo Sơ Mi Nam Kẻ Sọc</strong> chính là lựa chọn hoàn hảo giúp bạn tự tin trong mọi hoàn cảnh!</p>
<p>✨ <strong>Đặc điểm nổi bật:</strong><br>
✔ <strong>Chất liệu cao cấp</strong>: Vải cotton hoặc linen mềm mại, thoáng khí, thấm hút mồ hôi tốt, mang lại cảm giác thoải mái cả ngày.<br>
✔ <strong>Thiết kế hiện đại</strong>: Họa tiết kẻ sọc tinh tế giúp tạo hiệu ứng kéo dài vóc dáng, phù hợp với mọi dáng người.<br>
✔ <strong>Dễ dàng phối đồ</strong>: Kết hợp hoàn hảo với quần jean, quần tây hoặc quần kaki, phù hợp cho cả đi làm, đi chơi hay dự tiệc.<br>
✔ <strong>Kiểu dáng đa dạng</strong>: Có cả form slim fit ôm gọn và form regular rộng rãi để bạn dễ dàng lựa chọn theo phong cách riêng.<br>
✔ <strong>Màu sắc phong phú</strong>: Các tone màu phổ biến như trắng xanh, đen trắng, xám sọc, nâu sọc… mang đến vẻ ngoài thanh lịch và nam tính.<br>
✔ <strong>Đủ size từ M đến XXL</strong>: Phù hợp với mọi vóc dáng, giúp bạn luôn tự tin.</p>
<p>🔥 <strong>Sở hữu ngay Áo Sơ Mi Nam Kẻ Sọc để luôn lịch lãm, phong cách và thu hút mọi ánh nhìn!</strong> 🎩✨</p>', CAST(245000.00 AS Decimal(10, 2)), CAST(280000.00 AS Decimal(10, 2)), N'https://aoxuanhe.com/upload/product/axh-111/ao-so-mi-nam-ke-soc-xanh-duong-1.jpg', N'active', 0, N'0', CAST(N'2025-02-24T11:00:00.0000000' AS DateTime2), CAST(N'2025-03-29T18:29:35.7866667' AS DateTime2))
GO
INSERT [dbo].[products] ([id], [title], [category_id], [description], [original_price], [sale_price], [thumbnail], [status], [is_combo], [combo_group_id], [created_at], [updated_at]) VALUES (23, N'Quần jean skinny nữ', 28, N'<p><strong>Quần Jean Skinny Nữ – Tôn Dáng, Sành Điệu, Dễ Phối Đồ</strong></p>
<p>👖 Bạn muốn sở hữu một chiếc quần vừa thoải mái vừa giúp tôn lên vóc dáng? <strong>Quần Jean Skinny Nữ</strong> chính là lựa chọn hoàn hảo để bạn luôn tự tin và cuốn hút!</p>
<p>✨ <strong>Đặc điểm nổi bật:</strong><br>
✔ <strong>Chất liệu denim cao cấp</strong>: Co giãn nhẹ, ôm sát nhưng vẫn thoải mái, giúp dễ dàng di chuyển cả ngày.<br>
✔ <strong>Thiết kế tôn dáng</strong>: Dáng skinny ôm sát từ hông đến cổ chân, giúp đôi chân trông thon gọn và dài hơn.<br>
✔ <strong>Dễ dàng phối đồ</strong>: Kết hợp hoàn hảo với áo thun, sơ mi, crop top hay áo len để tạo nên phong cách đa dạng từ năng động đến thanh lịch.<br>
✔ <strong>Kiểu dáng thời thượng</strong>: Có nhiều mẫu như lưng cao, lưng trung, rách gối, trơn… phù hợp với nhiều phong cách khác nhau.<br>
✔ <strong>Màu sắc đa dạng</strong>: Xanh denim, đen, trắng, xám… dễ dàng kết hợp với mọi trang phục.<br>
✔ <strong>Đủ size</strong>: Ôm sát nhưng vẫn thoải mái, phù hợp với nhiều dáng người.</p>
<p>🔥 <strong>Sở hữu ngay Quần Jean Skinny Nữ để luôn tự tin khoe dáng và sành điệu mọi lúc mọi nơi!</strong> 💃✨</p>', CAST(279000.00 AS Decimal(10, 2)), CAST(320000.00 AS Decimal(10, 2)), N'https://bizweb.dktcdn.net/100/386/478/products/b51045-xanhdam4-1695718398227.jpg?v=1695718423327', N'active', 0, N'0', CAST(N'2025-02-25T10:00:00.0000000' AS DateTime2), CAST(N'2025-03-29T18:29:15.0066667' AS DateTime2))
GO
INSERT [dbo].[products] ([id], [title], [category_id], [description], [original_price], [sale_price], [thumbnail], [status], [is_combo], [combo_group_id], [created_at], [updated_at]) VALUES (24, N'Áo len oversize unisex', 13, N'<p><strong>Áo Len Oversize Unisex – Phong Cách, Ấm Áp, Dễ Phối Đồ</strong></p>
<p>🧥 Bạn yêu thích phong cách rộng rãi, thoải mái nhưng vẫn thời trang? <strong>Áo Len Oversize Unisex</strong> chính là item không thể thiếu trong tủ đồ của bạn!</p>
<p>✨ <strong>Đặc điểm nổi bật:</strong><br>
✔ <strong>Chất liệu cao cấp</strong>: Len dệt mềm mại, dày dặn nhưng thoáng khí, giúp giữ ấm mà không gây bí bách.<br>
✔ <strong>Thiết kế oversize thời thượng</strong>: Form rộng, phù hợp cho cả nam và nữ, tạo phong cách trẻ trung, năng động.<br>
✔ <strong>Dễ dàng phối đồ</strong>: Kết hợp hoàn hảo với quần jeans, quần ống rộng, chân váy hay layer cùng áo sơ mi để tạo nhiều phong cách khác nhau.<br>
✔ <strong>Thoải mái vận động</strong>: Chất vải co giãn tốt, không gây khó chịu khi mặc cả ngày dài.<br>
✔ <strong>Màu sắc đa dạng</strong>: Đen, xám, be, nâu, xanh navy… dễ dàng phù hợp với mọi phong cách.<br>
✔ <strong>Đủ size</strong>: Phù hợp với mọi dáng người, giúp che khuyết điểm hiệu quả.</p>
<p>🔥 <strong>Sắm ngay Áo Len Oversize Unisex để luôn tự tin và phong cách trong mùa lạnh!</strong> ❄️🎁</p>', CAST(299000.00 AS Decimal(10, 2)), CAST(360000.00 AS Decimal(10, 2)), N'https://product.hstatic.net/200000923713/product/upload_1b135183cd3f4e1da78e48ce8e4404bd_master.jpg', N'active', 0, N'0', CAST(N'2025-02-25T10:05:00.0000000' AS DateTime2), CAST(N'2025-03-29T18:28:56.0200000' AS DateTime2))
GO
INSERT [dbo].[products] ([id], [title], [category_id], [description], [original_price], [sale_price], [thumbnail], [status], [is_combo], [combo_group_id], [created_at], [updated_at]) VALUES (25, N'Túi đeo chéo nữ mini', 59, N'<p><strong>Túi Đeo Chéo Nữ Mini – Nhỏ Gọn, Thời Trang, Tiện Lợi</strong></p>
<p>👜 Bạn đang tìm một chiếc túi nhỏ gọn nhưng vẫn sành điệu và dễ phối đồ? <strong>Túi Đeo Chéo Nữ Mini</strong> chính là lựa chọn hoàn hảo dành cho bạn!</p>
<p>✨ <strong>Đặc điểm nổi bật:</strong><br>
✔ <strong>Thiết kế thời thượng</strong>: Kiểu dáng mini nhỏ gọn nhưng vẫn tinh tế, phù hợp với mọi phong cách từ nhẹ nhàng đến cá tính.<br>
✔ <strong>Chất liệu cao cấp</strong>: Da PU mềm mại, chống thấm nước nhẹ, dễ dàng lau chùi, giữ form tốt.<br>
✔ <strong>Tiện lợi &amp; đa năng</strong>: Ngăn túi rộng rãi, có thể đựng điện thoại, ví tiền, son môi và các vật dụng nhỏ cần thiết.<br>
✔ <strong>Dễ dàng phối đồ</strong>: Phù hợp khi đi chơi, dạo phố, du lịch hay đi làm, tạo điểm nhấn nổi bật cho outfit.<br>
✔ <strong>Dây đeo điều chỉnh</strong>: Có thể điều chỉnh độ dài linh hoạt theo sở thích, giúp đeo thoải mái.<br>
✔ <strong>Màu sắc đa dạng</strong>: Đen, trắng, nâu, be, hồng pastel… phù hợp với nhiều phong cách thời trang.</p>
<p>💖 <strong>Sắm ngay Túi Đeo Chéo Nữ Mini để luôn phong cách và tiện lợi trong mọi hoàn cảnh!</strong> 🎀</p>', CAST(210000.00 AS Decimal(10, 2)), CAST(250000.00 AS Decimal(10, 2)), N'https://image.kacana.vn/images/product/tui-cheo-dung-dien-thoai-va-tien-you-2811-1720436440.jpg', N'active', 0, N'0', CAST(N'2024-11-25T10:10:00.0000000' AS DateTime2), CAST(N'2025-03-29T18:28:36.1900000' AS DateTime2))
GO
INSERT [dbo].[products] ([id], [title], [category_id], [description], [original_price], [sale_price], [thumbnail], [status], [is_combo], [combo_group_id], [created_at], [updated_at]) VALUES (26, N'Bông tai bạc hình giọt nước', 68, N'<p><strong>Bông Tai Bạc Hình Giọt Nước – Thanh Lịch, Tinh Tế, Tỏa Sáng</strong></p>
<p>💎 Bạn đang tìm một đôi bông tai nhẹ nhàng nhưng vẫn sang trọng và nổi bật? <strong>Bông Tai Bạc Hình Giọt Nước</strong> là lựa chọn hoàn hảo giúp bạn tỏa sáng trong mọi khoảnh khắc!</p>
<p>✨ <strong>Đặc điểm nổi bật:</strong><br>
✔ <strong>Chất liệu bạc cao cấp</strong>: Sử dụng bạc S925 sáng bóng, không gỉ sét, an toàn cho da, phù hợp cả với làn da nhạy cảm.<br>
✔ <strong>Thiết kế sang trọng</strong>: Kiểu dáng giọt nước mềm mại, tinh tế, tạo cảm giác thanh thoát và nữ tính.<br>
✔ <strong>Đính đá lấp lánh</strong>: Được đính đá Zircon cao cấp, phản chiếu ánh sáng lấp lánh như kim cương, tôn lên vẻ đẹp quý phái.<br>
✔ <strong>Dễ dàng phối đồ</strong>: Phù hợp khi đi làm, dự tiệc, đi chơi hay làm quà tặng ý nghĩa cho người thân.<br>
✔ <strong>Nhẹ nhàng, thoải mái</strong>: Thiết kế gọn nhẹ, không gây khó chịu khi đeo cả ngày.</p>
<p>✨ <strong>Sở hữu ngay Bông Tai Bạc Hình Giọt Nước – Món trang sức hoàn hảo giúp bạn luôn rạng rỡ và cuốn hút!</strong> 💖</p>', CAST(129000.00 AS Decimal(10, 2)), CAST(150000.00 AS Decimal(10, 2)), N'https://lili.vn/wp-content/uploads/2021/12/Bong-tai-bac-nu-ma-bach-kim-dinh-da-CZ-hinh-giot-nuoc-LILI_416496_13.jpg', N'active', 0, N'0', CAST(N'2025-02-25T10:15:00.0000000' AS DateTime2), CAST(N'2025-03-29T18:28:17.7800000' AS DateTime2))
GO
INSERT [dbo].[products] ([id], [title], [category_id], [description], [original_price], [sale_price], [thumbnail], [status], [is_combo], [combo_group_id], [created_at], [updated_at]) VALUES (27, N'Áo khoác nữ cardigan', 26, N'<p><strong>Áo Khoác Nữ Cardigan – Nhẹ Nhàng, Thanh Lịch, Dễ Phối Đồ</strong></p>
<p>🧥 Bạn đang tìm một chiếc áo khoác vừa ấm áp, vừa thanh lịch và dễ dàng phối đồ? <strong>Áo Khoác Nữ Cardigan</strong> chính là lựa chọn hoàn hảo giúp bạn tự tin trong mọi hoàn cảnh!</p>
<p>✨ <strong>Đặc điểm nổi bật:</strong><br>
✔ <strong>Chất liệu cao cấp</strong>: Len hoặc vải dệt kim mềm mại, co giãn tốt, giữ ấm nhưng vẫn thoáng khí.<br>
✔ <strong>Thiết kế thanh lịch</strong>: Dáng suông hoặc ôm nhẹ, có cúc cài hoặc không, phù hợp với nhiều phong cách từ dịu dàng đến cá tính.<br>
✔ <strong>Dễ dàng phối đồ</strong>: Kết hợp hoàn hảo với váy, quần jean, áo thun hay sơ mi, thích hợp để đi làm, đi chơi hay dạo phố.<br>
✔ <strong>Thoải mái, tiện lợi</strong>: Dáng áo nhẹ nhàng, dễ mặc, không gây cảm giác bí bách.<br>
✔ <strong>Màu sắc đa dạng</strong>: Từ tông màu trung tính như đen, be, xám đến gam màu pastel ngọt ngào như hồng, xanh dương… phù hợp với mọi sở thích.<br>
✔ <strong>Đủ size:</strong>&nbsp;Phù hợp với mọi vóc dáng.</p>
<p>💖 <strong>Sắm ngay Áo Khoác Nữ Cardigan để luôn xinh đẹp và phong cách trong mọi hoàn cảnh!</strong> 🍂<strong style="font-family: var(--bs-font-sans-serif); font-size: 1rem;">Áo Khoác Nữ Cardigan – Nhẹ Nhàng, Thanh Lịch, Dễ Phối Đồ</strong></p>', CAST(265000.00 AS Decimal(10, 2)), CAST(300000.00 AS Decimal(10, 2)), N'https://bizweb.dktcdn.net/thumb/1024x1024/100/119/564/products/ao-khoac-nu-han-quoc-4476.jpg?v=1726800949063', N'active', 0, N'0', CAST(N'2024-12-25T10:20:00.0000000' AS DateTime2), CAST(N'2025-03-29T18:27:54.7966667' AS DateTime2))
GO
INSERT [dbo].[products] ([id], [title], [category_id], [description], [original_price], [sale_price], [thumbnail], [status], [is_combo], [combo_group_id], [created_at], [updated_at]) VALUES (28, N'Dép lào nam cao cấp', 70, N'<p><strong>Dép Lào Nam Cao Cấp – Bền Bỉ, Thoải Mái, Phong Cách</strong></p>
<p>👞 Bạn đang tìm kiếm một đôi dép vừa đơn giản nhưng vẫn đẳng cấp và bền bỉ? <strong>Dép Lào Nam Cao Cấp</strong> chính là sự lựa chọn hoàn hảo để bạn luôn cảm thấy thoải mái trong mọi hoạt động hàng ngày!</p>
<p>✨ <strong>Đặc điểm nổi bật:</strong><br>
✔ <strong>Chất liệu cao cấp</strong>: Đế dép làm từ cao su nguyên khối, chống trơn trượt, dẻo dai và bền bỉ theo thời gian.<br>
✔ <strong>Thiết kế thời thượng</strong>: Quai dép êm ái, ôm chân chắc chắn nhưng vẫn tạo sự thoải mái khi di chuyển.<br>
✔ <strong>Êm chân, chống sốc</strong>: Lót đế mềm, hỗ trợ giảm áp lực khi đi lại trong thời gian dài.<br>
✔ <strong>Chống nước, dễ vệ sinh</strong>: Thích hợp cho cả đi biển, đi mưa hay sử dụng hằng ngày.<br>
✔ <strong>Đa dạng màu sắc, kích cỡ</strong>: Nhiều gam màu trung tính như đen, xám, xanh navy… từ size 39-44, phù hợp với mọi phong cách.</p>
<p>🔥 <strong>Sở hữu ngay Dép Lào Nam Cao Cấp – Đơn giản nhưng đẳng cấp, bền đẹp theo thời gian!</strong> 🏆</p>', CAST(155000.00 AS Decimal(10, 2)), CAST(180000.00 AS Decimal(10, 2)), N'https://cf.shopee.vn/file/c6d1c6eb69fc0f5b382006d61baf5856', N'active', 0, N'0', CAST(N'2025-02-25T10:25:00.0000000' AS DateTime2), CAST(N'2025-03-29T18:27:03.4100000' AS DateTime2))
GO
INSERT [dbo].[products] ([id], [title], [category_id], [description], [original_price], [sale_price], [thumbnail], [status], [is_combo], [combo_group_id], [created_at], [updated_at]) VALUES (29, N'Áo thun trẻ em hoạt hình', 53, N'<p><strong>Áo Thun Trẻ Em Hoạt Hình – Dễ Thương, Thoải Mái, Bé Yêu Thích</strong></p>
<p>👶 Bạn muốn bé yêu luôn thoải mái vận động nhưng vẫn đáng yêu và phong cách? <strong>Áo Thun Trẻ Em Hoạt Hình</strong> sẽ là lựa chọn hoàn hảo cho bé trong mọi hoạt động hàng ngày!</p>
<p>✨ <strong>Đặc điểm nổi bật:</strong><br>
✔ <strong>Chất liệu cotton cao cấp</strong>: Mềm mại, thoáng khí, thấm hút mồ hôi tốt, an toàn cho làn da nhạy cảm của bé.<br>
✔ <strong>Họa tiết hoạt hình đáng yêu</strong>: In hình nhân vật ngộ nghĩnh như Doraemon, Siêu Nhân, Chuột Mickey, Công Chúa Elsa… giúp bé thích thú khi mặc.<br>
✔ <strong>Kiểu dáng thoải mái</strong>: Form áo rộng rãi, co giãn tốt, giúp bé dễ dàng vận động, chạy nhảy cả ngày.<br>
✔ <strong>Dễ dàng phối đồ</strong>: Kết hợp hoàn hảo với quần jean, quần short hay chân váy, phù hợp cho bé đi học, đi chơi hay ở nhà.<br>
✔ <strong>Đa dạng màu sắc, size phù hợp</strong>: Nhiều màu sắc tươi sáng, kích thước từ 1-10 tuổi cho bé trai và bé gái.</p>
<p>🎁 <strong>Món quà tuyệt vời cho bé yêu – Đặt ngay Áo Thun Trẻ Em Hoạt Hình để bé luôn đáng yêu và năng động!</strong> 🌈</p>', CAST(120000.00 AS Decimal(10, 2)), CAST(150000.00 AS Decimal(10, 2)), N'https://product.hstatic.net/1000387570/product/ao_sieu_nhan_dai_tay_be_trai_xanh_1_29b6db9d6dab4e649d6d1528a1cef68d_master.jpg', N'active', 0, N'0', CAST(N'2025-02-25T10:30:00.0000000' AS DateTime2), CAST(N'2025-03-29T18:26:38.6800000' AS DateTime2))
GO
INSERT [dbo].[products] ([id], [title], [category_id], [description], [original_price], [sale_price], [thumbnail], [status], [is_combo], [combo_group_id], [created_at], [updated_at]) VALUES (30, N'Nhẫn bạc đính đá zircon', 69, N'<p><strong>Nhẫn Bạc Đính Đá Zircon – Thanh Lịch, Tinh Tế, Tỏa Sáng</strong></p>
<p>💍 Bạn đang tìm kiếm một món trang sức sang trọng nhưng vẫn tinh tế để tôn lên vẻ đẹp của mình? <strong>Nhẫn Bạc Đính Đá Zircon</strong> chính là lựa chọn hoàn hảo giúp bạn tỏa sáng trong mọi khoảnh khắc!</p>
<p>✨ <strong>Đặc điểm nổi bật:</strong><br>
✔ <strong>Chất liệu bạc cao cấp</strong>: Sử dụng bạc S925 sáng bóng, không gỉ sét, bền đẹp theo thời gian.<br>
✔ <strong>Đính đá Zircon lấp lánh</strong>: Viên đá được chế tác tinh xảo, phản chiếu ánh sáng lấp lánh không thua kém kim cương.<br>
✔ <strong>Thiết kế sang trọng</strong>: Kiểu dáng thanh mảnh, tinh tế, phù hợp với nhiều phong cách từ dịu dàng đến hiện đại.<br>
✔ <strong>Dễ dàng phối đồ</strong>: Phù hợp khi đi làm, đi chơi, dự tiệc hoặc làm quà tặng ý nghĩa cho người thân.<br>
✔ <strong>Size đa dạng</strong>: Nhiều kích cỡ phù hợp với từng ngón tay, ôm vừa vặn và thoải mái khi đeo.</p>
<p>💎 <strong>Sở hữu ngay Nhẫn Bạc Đính Đá Zircon để luôn rạng rỡ và cuốn hút!</strong> ✨</p>', CAST(199000.00 AS Decimal(10, 2)), CAST(230000.00 AS Decimal(10, 2)), N'https://lili.vn/wp-content/uploads/2021/08/Nhan-bac-dinh-da-Zircon-Royal-LILI_499436_2.jpg', N'active', 0, N'0', CAST(N'2025-02-25T10:35:00.0000000' AS DateTime2), CAST(N'2025-03-29T18:26:17.9700000' AS DateTime2))
GO
INSERT [dbo].[products] ([id], [title], [category_id], [description], [original_price], [sale_price], [thumbnail], [status], [is_combo], [combo_group_id], [created_at], [updated_at]) VALUES (31, N'Chân váy xếp ly dáng ngắn', 50, N'<p><strong>Chân Váy Xếp Ly Dáng Ngắn – Nữ Tính, Trẻ Trung, Dễ Phối Đồ</strong></p>
<p>💃 Bạn muốn tạo nên phong cách thời trang trẻ trung, năng động nhưng vẫn nữ tính? <strong>Chân Váy Xếp Ly Dáng Ngắn</strong> chính là lựa chọn hoàn hảo giúp bạn luôn cuốn hút trong mọi hoàn cảnh!</p>
<p>✨ <strong>Đặc điểm nổi bật:</strong><br>
✔ <strong>Chất liệu cao cấp</strong>: Vải mềm mại, đứng form, ít nhăn, mang lại cảm giác thoải mái khi mặc.<br>
✔ <strong>Thiết kế thời thượng</strong>: Dáng váy ngắn trên gối, xếp ly tinh tế, giúp đôi chân trông thon dài và tôn dáng.<br>
✔ <strong>Phối đồ đa dạng</strong>: Kết hợp dễ dàng với áo thun, áo sơ mi, áo croptop hay blazer, phù hợp cho đi học, đi chơi, dạo phố.<br>
✔ <strong>Thoải mái vận động</strong>: Có quần lót trong giúp tự tin di chuyển mà không lo lộ dáng.<br>
✔ <strong>Màu sắc thanh lịch</strong>: Đen, trắng, be, xám… phù hợp với nhiều phong cách từ ngọt ngào đến cá tính.<br>
✔ <strong>Đủ size</strong>: Đáp ứng mọi dáng người, tôn lên vẻ đẹp tự nhiên.</p>
<p>🎀 <strong>Diện ngay Chân Váy Xếp Ly Dáng Ngắn để luôn nổi bật và phong cách!</strong> 💫</p>', CAST(245000.00 AS Decimal(10, 2)), CAST(280000.00 AS Decimal(10, 2)), N'https://down-vn.img.susercontent.com/file/55791d774c509649738b1bb8aba06a7d', N'active', 0, N'0', CAST(N'2025-02-25T10:40:00.0000000' AS DateTime2), CAST(N'2025-03-29T18:25:56.6233333' AS DateTime2))
GO
INSERT [dbo].[products] ([id], [title], [category_id], [description], [original_price], [sale_price], [thumbnail], [status], [is_combo], [combo_group_id], [created_at], [updated_at]) VALUES (32, N'Quần kaki nam', 11, N'<p><strong>Quần Kaki Nam – Lịch Lãm, Thoải Mái, Dễ Phối Đồ</strong></p>
<p>💼 Bạn đang tìm một chiếc quần vừa thanh lịch, vừa năng động, phù hợp cho nhiều dịp? <strong>Quần Kaki Nam</strong> chính là lựa chọn hoàn hảo giúp bạn tự tin thể hiện phong cách của mình!</p>
<p>✨ <strong>Đặc điểm nổi bật:</strong><br>
✔ <strong>Chất liệu cao cấp</strong>: Vải kaki dày dặn, co giãn nhẹ, thoáng khí, tạo cảm giác thoải mái khi mặc cả ngày.<br>
✔ <strong>Thiết kế hiện đại</strong>: Form quần vừa vặn, cạp quần chắc chắn, giúp tôn dáng và tạo sự gọn gàng.<br>
✔ <strong>Dễ phối đồ</strong>: Phù hợp với áo sơ mi, áo thun hay áo polo, giúp bạn linh hoạt trong mọi phong cách từ công sở đến dạo phố.<br>
✔ <strong>Bền đẹp theo thời gian</strong>: Giữ form tốt, ít nhăn, dễ dàng vệ sinh và bảo quản.<br>
✔ <strong>Đa dạng màu sắc</strong>: Đen, xám, be, xanh rêu… phù hợp với nhiều phong cách và sở thích.<br>
✔ <strong>Có nhiều size</strong>: phù hợp với mọi vóc dáng.</p>
<p>🔥 <strong>Sở hữu ngay Quần Kaki Nam để luôn tự tin và phong cách trong mọi hoàn cảnh!</strong> 🎯</p>', CAST(299000.00 AS Decimal(10, 2)), CAST(350000.00 AS Decimal(10, 2)), N'https://vulcano.sgp1.digitaloceanspaces.com/media/18894/quan-khaki-3001t-vulcano01.webp', N'active', 0, N'0', CAST(N'2025-02-25T10:45:00.0000000' AS DateTime2), CAST(N'2025-03-29T18:25:29.0233333' AS DateTime2))
GO
SET IDENTITY_INSERT [dbo].[products] OFF
GO
SET IDENTITY_INSERT [dbo].[product_sizes] ON 
GO
INSERT [dbo].[product_sizes] ([id], [product_id], [size]) VALUES (1, 1, N'S')
GO
INSERT [dbo].[product_sizes] ([id], [product_id], [size]) VALUES (2, 1, N'M')
GO
INSERT [dbo].[product_sizes] ([id], [product_id], [size]) VALUES (3, 1, N'L')
GO
INSERT [dbo].[product_sizes] ([id], [product_id], [size]) VALUES (4, 1, N'XL')
GO
INSERT [dbo].[product_sizes] ([id], [product_id], [size]) VALUES (5, 2, N'S')
GO
INSERT [dbo].[product_sizes] ([id], [product_id], [size]) VALUES (6, 2, N'M')
GO
INSERT [dbo].[product_sizes] ([id], [product_id], [size]) VALUES (7, 2, N'L')
GO
INSERT [dbo].[product_sizes] ([id], [product_id], [size]) VALUES (8, 2, N'XL')
GO
INSERT [dbo].[product_sizes] ([id], [product_id], [size]) VALUES (9, 3, N'S')
GO
INSERT [dbo].[product_sizes] ([id], [product_id], [size]) VALUES (10, 3, N'M')
GO
INSERT [dbo].[product_sizes] ([id], [product_id], [size]) VALUES (11, 3, N'L')
GO
INSERT [dbo].[product_sizes] ([id], [product_id], [size]) VALUES (12, 4, N'S')
GO
INSERT [dbo].[product_sizes] ([id], [product_id], [size]) VALUES (13, 4, N'M')
GO
INSERT [dbo].[product_sizes] ([id], [product_id], [size]) VALUES (14, 4, N'L')
GO
INSERT [dbo].[product_sizes] ([id], [product_id], [size]) VALUES (15, 5, N'2-4')
GO
INSERT [dbo].[product_sizes] ([id], [product_id], [size]) VALUES (16, 5, N'4-6')
GO
INSERT [dbo].[product_sizes] ([id], [product_id], [size]) VALUES (17, 5, N'6-8')
GO
INSERT [dbo].[product_sizes] ([id], [product_id], [size]) VALUES (18, 6, N'2-4')
GO
INSERT [dbo].[product_sizes] ([id], [product_id], [size]) VALUES (19, 6, N'4-6')
GO
INSERT [dbo].[product_sizes] ([id], [product_id], [size]) VALUES (20, 6, N'6-8')
GO
INSERT [dbo].[product_sizes] ([id], [product_id], [size]) VALUES (21, 11, N'2-4')
GO
INSERT [dbo].[product_sizes] ([id], [product_id], [size]) VALUES (22, 11, N'4-6')
GO
INSERT [dbo].[product_sizes] ([id], [product_id], [size]) VALUES (23, 11, N'6-8')
GO
INSERT [dbo].[product_sizes] ([id], [product_id], [size]) VALUES (24, 7, N'90cm')
GO
INSERT [dbo].[product_sizes] ([id], [product_id], [size]) VALUES (25, 7, N'100cm')
GO
INSERT [dbo].[product_sizes] ([id], [product_id], [size]) VALUES (26, 7, N'110cm')
GO
INSERT [dbo].[product_sizes] ([id], [product_id], [size]) VALUES (28, 9, N'38')
GO
INSERT [dbo].[product_sizes] ([id], [product_id], [size]) VALUES (29, 9, N'39')
GO
INSERT [dbo].[product_sizes] ([id], [product_id], [size]) VALUES (30, 9, N'40')
GO
INSERT [dbo].[product_sizes] ([id], [product_id], [size]) VALUES (31, 9, N'41')
GO
INSERT [dbo].[product_sizes] ([id], [product_id], [size]) VALUES (32, 9, N'42')
GO
INSERT [dbo].[product_sizes] ([id], [product_id], [size]) VALUES (33, 10, N'38')
GO
INSERT [dbo].[product_sizes] ([id], [product_id], [size]) VALUES (34, 10, N'39')
GO
INSERT [dbo].[product_sizes] ([id], [product_id], [size]) VALUES (35, 10, N'40')
GO
INSERT [dbo].[product_sizes] ([id], [product_id], [size]) VALUES (36, 10, N'41')
GO
INSERT [dbo].[product_sizes] ([id], [product_id], [size]) VALUES (37, 10, N'42')
GO
INSERT [dbo].[product_sizes] ([id], [product_id], [size]) VALUES (38, 12, N'S')
GO
INSERT [dbo].[product_sizes] ([id], [product_id], [size]) VALUES (39, 12, N'M')
GO
INSERT [dbo].[product_sizes] ([id], [product_id], [size]) VALUES (40, 12, N'L')
GO
INSERT [dbo].[product_sizes] ([id], [product_id], [size]) VALUES (41, 12, N'XL')
GO
INSERT [dbo].[product_sizes] ([id], [product_id], [size]) VALUES (42, 13, N'S')
GO
INSERT [dbo].[product_sizes] ([id], [product_id], [size]) VALUES (43, 13, N'M')
GO
INSERT [dbo].[product_sizes] ([id], [product_id], [size]) VALUES (44, 13, N'L')
GO
INSERT [dbo].[product_sizes] ([id], [product_id], [size]) VALUES (45, 13, N'XL')
GO
INSERT [dbo].[product_sizes] ([id], [product_id], [size]) VALUES (46, 14, N'S')
GO
INSERT [dbo].[product_sizes] ([id], [product_id], [size]) VALUES (47, 14, N'M')
GO
INSERT [dbo].[product_sizes] ([id], [product_id], [size]) VALUES (48, 14, N'L')
GO
INSERT [dbo].[product_sizes] ([id], [product_id], [size]) VALUES (49, 14, N'XL')
GO
INSERT [dbo].[product_sizes] ([id], [product_id], [size]) VALUES (50, 15, N'S')
GO
INSERT [dbo].[product_sizes] ([id], [product_id], [size]) VALUES (51, 15, N'M')
GO
INSERT [dbo].[product_sizes] ([id], [product_id], [size]) VALUES (52, 15, N'L')
GO
INSERT [dbo].[product_sizes] ([id], [product_id], [size]) VALUES (53, 16, N'S')
GO
INSERT [dbo].[product_sizes] ([id], [product_id], [size]) VALUES (54, 16, N'M')
GO
INSERT [dbo].[product_sizes] ([id], [product_id], [size]) VALUES (55, 16, N'L')
GO
INSERT [dbo].[product_sizes] ([id], [product_id], [size]) VALUES (56, 16, N'XL')
GO
INSERT [dbo].[product_sizes] ([id], [product_id], [size]) VALUES (57, 17, N'2-4')
GO
INSERT [dbo].[product_sizes] ([id], [product_id], [size]) VALUES (58, 17, N'4-6')
GO
INSERT [dbo].[product_sizes] ([id], [product_id], [size]) VALUES (59, 17, N'6-8')
GO
INSERT [dbo].[product_sizes] ([id], [product_id], [size]) VALUES (60, 18, N'Onesize')
GO
INSERT [dbo].[product_sizes] ([id], [product_id], [size]) VALUES (61, 19, N'40cm')
GO
INSERT [dbo].[product_sizes] ([id], [product_id], [size]) VALUES (62, 19, N'45cm')
GO
INSERT [dbo].[product_sizes] ([id], [product_id], [size]) VALUES (63, 19, N'50cm')
GO
INSERT [dbo].[product_sizes] ([id], [product_id], [size]) VALUES (64, 20, N'35')
GO
INSERT [dbo].[product_sizes] ([id], [product_id], [size]) VALUES (65, 20, N'36')
GO
INSERT [dbo].[product_sizes] ([id], [product_id], [size]) VALUES (66, 20, N'37')
GO
INSERT [dbo].[product_sizes] ([id], [product_id], [size]) VALUES (67, 20, N'38')
GO
INSERT [dbo].[product_sizes] ([id], [product_id], [size]) VALUES (68, 20, N'39')
GO
INSERT [dbo].[product_sizes] ([id], [product_id], [size]) VALUES (69, 21, N'Onesize')
GO
INSERT [dbo].[product_sizes] ([id], [product_id], [size]) VALUES (70, 22, N'S')
GO
INSERT [dbo].[product_sizes] ([id], [product_id], [size]) VALUES (71, 22, N'M')
GO
INSERT [dbo].[product_sizes] ([id], [product_id], [size]) VALUES (72, 22, N'L')
GO
INSERT [dbo].[product_sizes] ([id], [product_id], [size]) VALUES (73, 22, N'XL')
GO
INSERT [dbo].[product_sizes] ([id], [product_id], [size]) VALUES (74, 23, N'S')
GO
INSERT [dbo].[product_sizes] ([id], [product_id], [size]) VALUES (75, 23, N'M')
GO
INSERT [dbo].[product_sizes] ([id], [product_id], [size]) VALUES (76, 23, N'L')
GO
INSERT [dbo].[product_sizes] ([id], [product_id], [size]) VALUES (77, 23, N'XL')
GO
INSERT [dbo].[product_sizes] ([id], [product_id], [size]) VALUES (78, 24, N'S')
GO
INSERT [dbo].[product_sizes] ([id], [product_id], [size]) VALUES (79, 24, N'M')
GO
INSERT [dbo].[product_sizes] ([id], [product_id], [size]) VALUES (80, 24, N'L')
GO
INSERT [dbo].[product_sizes] ([id], [product_id], [size]) VALUES (81, 24, N'XL')
GO
INSERT [dbo].[product_sizes] ([id], [product_id], [size]) VALUES (82, 25, N'Onesize')
GO
INSERT [dbo].[product_sizes] ([id], [product_id], [size]) VALUES (83, 26, N'Onesize')
GO
INSERT [dbo].[product_sizes] ([id], [product_id], [size]) VALUES (84, 27, N'S')
GO
INSERT [dbo].[product_sizes] ([id], [product_id], [size]) VALUES (85, 27, N'M')
GO
INSERT [dbo].[product_sizes] ([id], [product_id], [size]) VALUES (86, 27, N'L')
GO
INSERT [dbo].[product_sizes] ([id], [product_id], [size]) VALUES (87, 28, N'39')
GO
INSERT [dbo].[product_sizes] ([id], [product_id], [size]) VALUES (88, 28, N'40')
GO
INSERT [dbo].[product_sizes] ([id], [product_id], [size]) VALUES (89, 28, N'41')
GO
INSERT [dbo].[product_sizes] ([id], [product_id], [size]) VALUES (90, 28, N'42')
GO
INSERT [dbo].[product_sizes] ([id], [product_id], [size]) VALUES (91, 28, N'43')
GO
INSERT [dbo].[product_sizes] ([id], [product_id], [size]) VALUES (92, 29, N'2-4')
GO
INSERT [dbo].[product_sizes] ([id], [product_id], [size]) VALUES (93, 29, N'4-6')
GO
INSERT [dbo].[product_sizes] ([id], [product_id], [size]) VALUES (94, 29, N'6-8')
GO
INSERT [dbo].[product_sizes] ([id], [product_id], [size]) VALUES (95, 29, N'8-10')
GO
INSERT [dbo].[product_sizes] ([id], [product_id], [size]) VALUES (96, 30, N'5')
GO
INSERT [dbo].[product_sizes] ([id], [product_id], [size]) VALUES (97, 30, N'6')
GO
INSERT [dbo].[product_sizes] ([id], [product_id], [size]) VALUES (98, 30, N'7')
GO
INSERT [dbo].[product_sizes] ([id], [product_id], [size]) VALUES (99, 30, N'8')
GO
INSERT [dbo].[product_sizes] ([id], [product_id], [size]) VALUES (100, 31, N'S')
GO
INSERT [dbo].[product_sizes] ([id], [product_id], [size]) VALUES (101, 31, N'M')
GO
INSERT [dbo].[product_sizes] ([id], [product_id], [size]) VALUES (102, 31, N'L')
GO
INSERT [dbo].[product_sizes] ([id], [product_id], [size]) VALUES (103, 32, N'28')
GO
INSERT [dbo].[product_sizes] ([id], [product_id], [size]) VALUES (104, 32, N'30')
GO
INSERT [dbo].[product_sizes] ([id], [product_id], [size]) VALUES (105, 32, N'32')
GO
INSERT [dbo].[product_sizes] ([id], [product_id], [size]) VALUES (106, 32, N'34')
GO
INSERT [dbo].[product_sizes] ([id], [product_id], [size]) VALUES (107, 32, N'36')
GO
SET IDENTITY_INSERT [dbo].[product_sizes] OFF
GO
SET IDENTITY_INSERT [dbo].[product_colors] ON 
GO
INSERT [dbo].[product_colors] ([id], [product_id], [color]) VALUES (1, 1, N'Trắng')
GO
INSERT [dbo].[product_colors] ([id], [product_id], [color]) VALUES (2, 1, N'Xanh nhạt')
GO
INSERT [dbo].[product_colors] ([id], [product_id], [color]) VALUES (3, 2, N'Đen')
GO
INSERT [dbo].[product_colors] ([id], [product_id], [color]) VALUES (4, 2, N'Xám')
GO
INSERT [dbo].[product_colors] ([id], [product_id], [color]) VALUES (5, 3, N'Hoa xanh')
GO
INSERT [dbo].[product_colors] ([id], [product_id], [color]) VALUES (6, 3, N'Hoa đỏ')
GO
INSERT [dbo].[product_colors] ([id], [product_id], [color]) VALUES (7, 4, N'Xanh đậm')
GO
INSERT [dbo].[product_colors] ([id], [product_id], [color]) VALUES (8, 4, N'Đen')
GO
INSERT [dbo].[product_colors] ([id], [product_id], [color]) VALUES (9, 5, N'Đỏ')
GO
INSERT [dbo].[product_colors] ([id], [product_id], [color]) VALUES (10, 5, N'Xanh')
GO
INSERT [dbo].[product_colors] ([id], [product_id], [color]) VALUES (11, 6, N'Xanh navy')
GO
INSERT [dbo].[product_colors] ([id], [product_id], [color]) VALUES (12, 6, N'Xám')
GO
INSERT [dbo].[product_colors] ([id], [product_id], [color]) VALUES (13, 7, N'Nâu')
GO
INSERT [dbo].[product_colors] ([id], [product_id], [color]) VALUES (14, 7, N'Đen')
GO
INSERT [dbo].[product_colors] ([id], [product_id], [color]) VALUES (17, 9, N'Trắng')
GO
INSERT [dbo].[product_colors] ([id], [product_id], [color]) VALUES (18, 9, N'Đen')
GO
INSERT [dbo].[product_colors] ([id], [product_id], [color]) VALUES (19, 10, N'Trắng')
GO
INSERT [dbo].[product_colors] ([id], [product_id], [color]) VALUES (20, 10, N'Đen')
GO
INSERT [dbo].[product_colors] ([id], [product_id], [color]) VALUES (21, 10, N'Xanh')
GO
INSERT [dbo].[product_colors] ([id], [product_id], [color]) VALUES (22, 11, N'Xanh')
GO
INSERT [dbo].[product_colors] ([id], [product_id], [color]) VALUES (23, 11, N'Đỏ')
GO
INSERT [dbo].[product_colors] ([id], [product_id], [color]) VALUES (24, 12, N'Xanh')
GO
INSERT [dbo].[product_colors] ([id], [product_id], [color]) VALUES (25, 12, N'Xanh đậm')
GO
INSERT [dbo].[product_colors] ([id], [product_id], [color]) VALUES (26, 13, N'Đen')
GO
INSERT [dbo].[product_colors] ([id], [product_id], [color]) VALUES (27, 13, N'Navy')
GO
INSERT [dbo].[product_colors] ([id], [product_id], [color]) VALUES (29, 14, N'Đen')
GO
INSERT [dbo].[product_colors] ([id], [product_id], [color]) VALUES (30, 14, N'Xám')
GO
INSERT [dbo].[product_colors] ([id], [product_id], [color]) VALUES (31, 14, N'Xanh đậm')
GO
INSERT [dbo].[product_colors] ([id], [product_id], [color]) VALUES (32, 15, N'Trắng họa tiết hoa xanh')
GO
INSERT [dbo].[product_colors] ([id], [product_id], [color]) VALUES (33, 15, N'Hồng họa tiết hoa trắng')
GO
INSERT [dbo].[product_colors] ([id], [product_id], [color]) VALUES (34, 16, N'Trắng')
GO
INSERT [dbo].[product_colors] ([id], [product_id], [color]) VALUES (35, 16, N'Đen')
GO
INSERT [dbo].[product_colors] ([id], [product_id], [color]) VALUES (36, 16, N'Xám')
GO
INSERT [dbo].[product_colors] ([id], [product_id], [color]) VALUES (37, 17, N'Hồng pastel')
GO
INSERT [dbo].[product_colors] ([id], [product_id], [color]) VALUES (38, 17, N'Tím lavender')
GO
INSERT [dbo].[product_colors] ([id], [product_id], [color]) VALUES (39, 18, N'Đen')
GO
INSERT [dbo].[product_colors] ([id], [product_id], [color]) VALUES (40, 18, N'Xám')
GO
INSERT [dbo].[product_colors] ([id], [product_id], [color]) VALUES (41, 18, N'Xanh navy')
GO
INSERT [dbo].[product_colors] ([id], [product_id], [color]) VALUES (42, 19, N'Bạc')
GO
INSERT [dbo].[product_colors] ([id], [product_id], [color]) VALUES (43, 19, N'Vàng hồng')
GO
INSERT [dbo].[product_colors] ([id], [product_id], [color]) VALUES (44, 20, N'Đen')
GO
INSERT [dbo].[product_colors] ([id], [product_id], [color]) VALUES (45, 20, N'Kem')
GO
INSERT [dbo].[product_colors] ([id], [product_id], [color]) VALUES (46, 20, N'Đỏ đô')
GO
INSERT [dbo].[product_colors] ([id], [product_id], [color]) VALUES (47, 21, N'Đen')
GO
INSERT [dbo].[product_colors] ([id], [product_id], [color]) VALUES (48, 21, N'Nâu')
GO
INSERT [dbo].[product_colors] ([id], [product_id], [color]) VALUES (49, 21, N'Vàng gold')
GO
INSERT [dbo].[product_colors] ([id], [product_id], [color]) VALUES (50, 22, N'Trắng sọc xanh')
GO
INSERT [dbo].[product_colors] ([id], [product_id], [color]) VALUES (51, 22, N'Trắng sọc đen')
GO
INSERT [dbo].[product_colors] ([id], [product_id], [color]) VALUES (52, 22, N'Xanh nhạt sọc trắng')
GO
INSERT [dbo].[product_colors] ([id], [product_id], [color]) VALUES (53, 23, N'Xanh đậm')
GO
INSERT [dbo].[product_colors] ([id], [product_id], [color]) VALUES (54, 23, N'Đen')
GO
INSERT [dbo].[product_colors] ([id], [product_id], [color]) VALUES (55, 23, N'Xanh nhạt')
GO
INSERT [dbo].[product_colors] ([id], [product_id], [color]) VALUES (56, 24, N'Kem')
GO
INSERT [dbo].[product_colors] ([id], [product_id], [color]) VALUES (57, 24, N'Xám')
GO
INSERT [dbo].[product_colors] ([id], [product_id], [color]) VALUES (58, 24, N'Nâu')
GO
INSERT [dbo].[product_colors] ([id], [product_id], [color]) VALUES (59, 25, N'Đen')
GO
INSERT [dbo].[product_colors] ([id], [product_id], [color]) VALUES (60, 25, N'Hồng')
GO
INSERT [dbo].[product_colors] ([id], [product_id], [color]) VALUES (61, 25, N'Kem')
GO
INSERT [dbo].[product_colors] ([id], [product_id], [color]) VALUES (62, 26, N'Bạc')
GO
INSERT [dbo].[product_colors] ([id], [product_id], [color]) VALUES (63, 26, N'Vàng hồng')
GO
INSERT [dbo].[product_colors] ([id], [product_id], [color]) VALUES (64, 27, N'Kem')
GO
INSERT [dbo].[product_colors] ([id], [product_id], [color]) VALUES (65, 27, N'Xanh mint')
GO
INSERT [dbo].[product_colors] ([id], [product_id], [color]) VALUES (66, 27, N'Hồng nhạt')
GO
INSERT [dbo].[product_colors] ([id], [product_id], [color]) VALUES (67, 28, N'Đen')
GO
INSERT [dbo].[product_colors] ([id], [product_id], [color]) VALUES (68, 28, N'Nâu')
GO
INSERT [dbo].[product_colors] ([id], [product_id], [color]) VALUES (69, 29, N'Trắng họa tiết')
GO
INSERT [dbo].[product_colors] ([id], [product_id], [color]) VALUES (70, 29, N'Xanh da trời họa tiết')
GO
INSERT [dbo].[product_colors] ([id], [product_id], [color]) VALUES (71, 29, N'Vàng họa tiết')
GO
INSERT [dbo].[product_colors] ([id], [product_id], [color]) VALUES (72, 30, N'Bạc')
GO
INSERT [dbo].[product_colors] ([id], [product_id], [color]) VALUES (73, 30, N'Vàng hồng')
GO
INSERT [dbo].[product_colors] ([id], [product_id], [color]) VALUES (74, 31, N'Đen')
GO
INSERT [dbo].[product_colors] ([id], [product_id], [color]) VALUES (75, 31, N'Xám')
GO
INSERT [dbo].[product_colors] ([id], [product_id], [color]) VALUES (76, 31, N'Kẻ caro')
GO
INSERT [dbo].[product_colors] ([id], [product_id], [color]) VALUES (77, 32, N'Be')
GO
INSERT [dbo].[product_colors] ([id], [product_id], [color]) VALUES (78, 32, N'Xanh navy')
GO
INSERT [dbo].[product_colors] ([id], [product_id], [color]) VALUES (79, 32, N'Đen')
GO
INSERT [dbo].[product_colors] ([id], [product_id], [color]) VALUES (80, 32, N'Hồng')
GO
INSERT [dbo].[product_colors] ([id], [product_id], [color]) VALUES (81, 32, N'Đỏ')
GO
SET IDENTITY_INSERT [dbo].[product_colors] OFF
GO
SET IDENTITY_INSERT [dbo].[product_variants] ON 
GO
INSERT [dbo].[product_variants] ([id], [product_id], [size_id], [color_id], [stock_quantity], [last_restock_date]) VALUES (1, 1, 1, 1, 50, CAST(N'2025-03-01T05:32:49.6166667' AS DateTime2))
GO
INSERT [dbo].[product_variants] ([id], [product_id], [size_id], [color_id], [stock_quantity], [last_restock_date]) VALUES (2, 1, 2, 1, 74, CAST(N'2025-03-01T05:32:46.1733333' AS DateTime2))
GO
INSERT [dbo].[product_variants] ([id], [product_id], [size_id], [color_id], [stock_quantity], [last_restock_date]) VALUES (3, 1, 3, 1, 60, CAST(N'2025-03-01T05:32:44.3233333' AS DateTime2))
GO
INSERT [dbo].[product_variants] ([id], [product_id], [size_id], [color_id], [stock_quantity], [last_restock_date]) VALUES (4, 1, 4, 1, 40, CAST(N'2025-03-01T05:32:47.8333333' AS DateTime2))
GO
INSERT [dbo].[product_variants] ([id], [product_id], [size_id], [color_id], [stock_quantity], [last_restock_date]) VALUES (5, 1, 1, 2, 45, CAST(N'2025-03-01T05:32:56.7500000' AS DateTime2))
GO
INSERT [dbo].[product_variants] ([id], [product_id], [size_id], [color_id], [stock_quantity], [last_restock_date]) VALUES (6, 1, 2, 2, 68, CAST(N'2025-03-01T05:32:53.2233333' AS DateTime2))
GO
INSERT [dbo].[product_variants] ([id], [product_id], [size_id], [color_id], [stock_quantity], [last_restock_date]) VALUES (7, 1, 3, 2, 55, CAST(N'2025-03-01T05:32:51.3033333' AS DateTime2))
GO
INSERT [dbo].[product_variants] ([id], [product_id], [size_id], [color_id], [stock_quantity], [last_restock_date]) VALUES (8, 1, 4, 2, 35, CAST(N'2025-03-01T05:32:54.7833333' AS DateTime2))
GO
INSERT [dbo].[product_variants] ([id], [product_id], [size_id], [color_id], [stock_quantity], [last_restock_date]) VALUES (9, 2, 5, 3, 40, CAST(N'2025-03-01T05:33:56.5733333' AS DateTime2))
GO
INSERT [dbo].[product_variants] ([id], [product_id], [size_id], [color_id], [stock_quantity], [last_restock_date]) VALUES (10, 2, 6, 3, 62, CAST(N'2025-03-01T05:33:54.9400000' AS DateTime2))
GO
INSERT [dbo].[product_variants] ([id], [product_id], [size_id], [color_id], [stock_quantity], [last_restock_date]) VALUES (11, 2, 7, 3, 50, CAST(N'2025-03-01T05:33:52.9966667' AS DateTime2))
GO
INSERT [dbo].[product_variants] ([id], [product_id], [size_id], [color_id], [stock_quantity], [last_restock_date]) VALUES (12, 2, 8, 3, 30, CAST(N'2025-03-01T05:33:58.3033333' AS DateTime2))
GO
INSERT [dbo].[product_variants] ([id], [product_id], [size_id], [color_id], [stock_quantity], [last_restock_date]) VALUES (13, 2, 5, 4, 35, CAST(N'2025-03-01T05:34:03.8566667' AS DateTime2))
GO
INSERT [dbo].[product_variants] ([id], [product_id], [size_id], [color_id], [stock_quantity], [last_restock_date]) VALUES (14, 2, 6, 4, 60, CAST(N'2025-03-01T05:34:02.0033333' AS DateTime2))
GO
INSERT [dbo].[product_variants] ([id], [product_id], [size_id], [color_id], [stock_quantity], [last_restock_date]) VALUES (15, 2, 7, 4, 45, CAST(N'2025-03-01T05:34:00.2000000' AS DateTime2))
GO
INSERT [dbo].[product_variants] ([id], [product_id], [size_id], [color_id], [stock_quantity], [last_restock_date]) VALUES (16, 2, 8, 4, 25, CAST(N'2025-03-01T05:34:15.2900000' AS DateTime2))
GO
INSERT [dbo].[product_variants] ([id], [product_id], [size_id], [color_id], [stock_quantity], [last_restock_date]) VALUES (17, 3, 9, 5, 30, CAST(N'2025-03-01T05:37:04.1966667' AS DateTime2))
GO
INSERT [dbo].[product_variants] ([id], [product_id], [size_id], [color_id], [stock_quantity], [last_restock_date]) VALUES (18, 3, 10, 5, 45, CAST(N'2025-03-01T05:37:02.6533333' AS DateTime2))
GO
INSERT [dbo].[product_variants] ([id], [product_id], [size_id], [color_id], [stock_quantity], [last_restock_date]) VALUES (19, 3, 11, 5, 20, CAST(N'2025-03-01T05:37:01.1000000' AS DateTime2))
GO
INSERT [dbo].[product_variants] ([id], [product_id], [size_id], [color_id], [stock_quantity], [last_restock_date]) VALUES (20, 3, 9, 6, 21, CAST(N'2025-03-01T05:36:59.4766667' AS DateTime2))
GO
INSERT [dbo].[product_variants] ([id], [product_id], [size_id], [color_id], [stock_quantity], [last_restock_date]) VALUES (21, 3, 10, 6, 39, CAST(N'2025-03-01T05:36:56.9100000' AS DateTime2))
GO
INSERT [dbo].[product_variants] ([id], [product_id], [size_id], [color_id], [stock_quantity], [last_restock_date]) VALUES (22, 3, 11, 6, 15, CAST(N'2025-03-01T05:36:55.2233333' AS DateTime2))
GO
INSERT [dbo].[product_variants] ([id], [product_id], [size_id], [color_id], [stock_quantity], [last_restock_date]) VALUES (23, 4, 12, 7, 35, CAST(N'2025-03-01T05:33:28.4200000' AS DateTime2))
GO
INSERT [dbo].[product_variants] ([id], [product_id], [size_id], [color_id], [stock_quantity], [last_restock_date]) VALUES (24, 4, 13, 7, 49, CAST(N'2025-03-01T05:33:26.4733333' AS DateTime2))
GO
INSERT [dbo].[product_variants] ([id], [product_id], [size_id], [color_id], [stock_quantity], [last_restock_date]) VALUES (25, 4, 14, 7, 24, CAST(N'2025-03-01T05:33:24.7666667' AS DateTime2))
GO
INSERT [dbo].[product_variants] ([id], [product_id], [size_id], [color_id], [stock_quantity], [last_restock_date]) VALUES (26, 4, 12, 8, 30, CAST(N'2025-03-01T05:33:23.1033333' AS DateTime2))
GO
INSERT [dbo].[product_variants] ([id], [product_id], [size_id], [color_id], [stock_quantity], [last_restock_date]) VALUES (27, 4, 13, 8, 44, CAST(N'2025-03-01T05:33:21.2866667' AS DateTime2))
GO
INSERT [dbo].[product_variants] ([id], [product_id], [size_id], [color_id], [stock_quantity], [last_restock_date]) VALUES (28, 4, 14, 8, 20, CAST(N'2025-03-01T05:33:19.7200000' AS DateTime2))
GO
INSERT [dbo].[product_variants] ([id], [product_id], [size_id], [color_id], [stock_quantity], [last_restock_date]) VALUES (29, 5, 15, 9, 60, CAST(N'2025-03-01T05:33:02.6033333' AS DateTime2))
GO
INSERT [dbo].[product_variants] ([id], [product_id], [size_id], [color_id], [stock_quantity], [last_restock_date]) VALUES (30, 5, 16, 9, 73, CAST(N'2025-03-01T05:33:04.3900000' AS DateTime2))
GO
INSERT [dbo].[product_variants] ([id], [product_id], [size_id], [color_id], [stock_quantity], [last_restock_date]) VALUES (31, 5, 17, 9, 50, CAST(N'2025-03-01T05:33:08.3566667' AS DateTime2))
GO
INSERT [dbo].[product_variants] ([id], [product_id], [size_id], [color_id], [stock_quantity], [last_restock_date]) VALUES (32, 5, 15, 10, 54, CAST(N'2025-03-01T05:33:06.7300000' AS DateTime2))
GO
INSERT [dbo].[product_variants] ([id], [product_id], [size_id], [color_id], [stock_quantity], [last_restock_date]) VALUES (33, 5, 16, 10, 70, CAST(N'2025-03-01T05:33:09.9700000' AS DateTime2))
GO
INSERT [dbo].[product_variants] ([id], [product_id], [size_id], [color_id], [stock_quantity], [last_restock_date]) VALUES (34, 5, 17, 10, 45, CAST(N'2025-03-01T05:33:12.7200000' AS DateTime2))
GO
INSERT [dbo].[product_variants] ([id], [product_id], [size_id], [color_id], [stock_quantity], [last_restock_date]) VALUES (35, 6, 18, 11, 63, CAST(N'2025-03-01T05:34:24.9300000' AS DateTime2))
GO
INSERT [dbo].[product_variants] ([id], [product_id], [size_id], [color_id], [stock_quantity], [last_restock_date]) VALUES (36, 6, 19, 11, 80, CAST(N'2025-03-01T05:34:23.2400000' AS DateTime2))
GO
INSERT [dbo].[product_variants] ([id], [product_id], [size_id], [color_id], [stock_quantity], [last_restock_date]) VALUES (37, 6, 20, 11, 55, CAST(N'2025-03-01T05:34:21.4366667' AS DateTime2))
GO
INSERT [dbo].[product_variants] ([id], [product_id], [size_id], [color_id], [stock_quantity], [last_restock_date]) VALUES (38, 6, 18, 12, 60, CAST(N'2025-03-01T05:34:30.2333333' AS DateTime2))
GO
INSERT [dbo].[product_variants] ([id], [product_id], [size_id], [color_id], [stock_quantity], [last_restock_date]) VALUES (39, 6, 19, 12, 75, CAST(N'2025-03-01T05:34:28.4800000' AS DateTime2))
GO
INSERT [dbo].[product_variants] ([id], [product_id], [size_id], [color_id], [stock_quantity], [last_restock_date]) VALUES (40, 6, 20, 12, 50, CAST(N'2025-03-01T05:34:26.6366667' AS DateTime2))
GO
INSERT [dbo].[product_variants] ([id], [product_id], [size_id], [color_id], [stock_quantity], [last_restock_date]) VALUES (41, 7, 24, 13, 40, CAST(N'2025-03-01T05:34:46.2300000' AS DateTime2))
GO
INSERT [dbo].[product_variants] ([id], [product_id], [size_id], [color_id], [stock_quantity], [last_restock_date]) VALUES (42, 7, 25, 13, 50, CAST(N'2025-03-01T05:34:44.6233333' AS DateTime2))
GO
INSERT [dbo].[product_variants] ([id], [product_id], [size_id], [color_id], [stock_quantity], [last_restock_date]) VALUES (43, 7, 26, 13, 30, CAST(N'2025-03-01T05:34:43.1500000' AS DateTime2))
GO
INSERT [dbo].[product_variants] ([id], [product_id], [size_id], [color_id], [stock_quantity], [last_restock_date]) VALUES (44, 7, 24, 14, 35, CAST(N'2025-03-01T05:34:41.5633333' AS DateTime2))
GO
INSERT [dbo].[product_variants] ([id], [product_id], [size_id], [color_id], [stock_quantity], [last_restock_date]) VALUES (45, 7, 25, 14, 45, CAST(N'2025-03-01T05:34:38.2533333' AS DateTime2))
GO
INSERT [dbo].[product_variants] ([id], [product_id], [size_id], [color_id], [stock_quantity], [last_restock_date]) VALUES (46, 7, 26, 14, 25, CAST(N'2025-03-01T05:34:40.0266667' AS DateTime2))
GO
INSERT [dbo].[product_variants] ([id], [product_id], [size_id], [color_id], [stock_quantity], [last_restock_date]) VALUES (49, 9, 28, 17, 25, CAST(N'2025-03-01T05:35:49.7300000' AS DateTime2))
GO
INSERT [dbo].[product_variants] ([id], [product_id], [size_id], [color_id], [stock_quantity], [last_restock_date]) VALUES (50, 9, 29, 17, 34, CAST(N'2025-03-01T05:35:45.2166667' AS DateTime2))
GO
INSERT [dbo].[product_variants] ([id], [product_id], [size_id], [color_id], [stock_quantity], [last_restock_date]) VALUES (51, 9, 30, 17, 40, CAST(N'2025-03-01T05:35:52.1066667' AS DateTime2))
GO
INSERT [dbo].[product_variants] ([id], [product_id], [size_id], [color_id], [stock_quantity], [last_restock_date]) VALUES (52, 9, 31, 17, 30, CAST(N'2025-03-01T05:35:57.1700000' AS DateTime2))
GO
INSERT [dbo].[product_variants] ([id], [product_id], [size_id], [color_id], [stock_quantity], [last_restock_date]) VALUES (53, 9, 32, 17, 20, CAST(N'2025-03-01T05:35:54.7366667' AS DateTime2))
GO
INSERT [dbo].[product_variants] ([id], [product_id], [size_id], [color_id], [stock_quantity], [last_restock_date]) VALUES (54, 9, 28, 18, 20, CAST(N'2025-03-01T05:35:36.2066667' AS DateTime2))
GO
INSERT [dbo].[product_variants] ([id], [product_id], [size_id], [color_id], [stock_quantity], [last_restock_date]) VALUES (55, 9, 29, 18, 30, CAST(N'2025-03-01T05:35:39.6033333' AS DateTime2))
GO
INSERT [dbo].[product_variants] ([id], [product_id], [size_id], [color_id], [stock_quantity], [last_restock_date]) VALUES (56, 9, 30, 18, 35, CAST(N'2025-03-01T05:35:37.9700000' AS DateTime2))
GO
INSERT [dbo].[product_variants] ([id], [product_id], [size_id], [color_id], [stock_quantity], [last_restock_date]) VALUES (57, 9, 31, 18, 25, CAST(N'2025-03-01T05:35:41.3400000' AS DateTime2))
GO
INSERT [dbo].[product_variants] ([id], [product_id], [size_id], [color_id], [stock_quantity], [last_restock_date]) VALUES (58, 9, 32, 18, 15, CAST(N'2025-03-01T05:35:47.2166667' AS DateTime2))
GO
INSERT [dbo].[product_variants] ([id], [product_id], [size_id], [color_id], [stock_quantity], [last_restock_date]) VALUES (59, 10, 33, 19, 30, CAST(N'2025-03-01T05:34:59.9733333' AS DateTime2))
GO
INSERT [dbo].[product_variants] ([id], [product_id], [size_id], [color_id], [stock_quantity], [last_restock_date]) VALUES (60, 10, 34, 19, 40, CAST(N'2025-03-01T05:35:03.4600000' AS DateTime2))
GO
INSERT [dbo].[product_variants] ([id], [product_id], [size_id], [color_id], [stock_quantity], [last_restock_date]) VALUES (61, 10, 35, 19, 50, CAST(N'2025-03-01T05:35:05.2566667' AS DateTime2))
GO
INSERT [dbo].[product_variants] ([id], [product_id], [size_id], [color_id], [stock_quantity], [last_restock_date]) VALUES (62, 10, 36, 19, 35, CAST(N'2025-03-01T05:35:06.9266667' AS DateTime2))
GO
INSERT [dbo].[product_variants] ([id], [product_id], [size_id], [color_id], [stock_quantity], [last_restock_date]) VALUES (63, 10, 37, 19, 25, CAST(N'2025-03-01T05:35:09.0933333' AS DateTime2))
GO
INSERT [dbo].[product_variants] ([id], [product_id], [size_id], [color_id], [stock_quantity], [last_restock_date]) VALUES (64, 10, 33, 20, 20, CAST(N'2025-03-01T05:34:53.1966667' AS DateTime2))
GO
INSERT [dbo].[product_variants] ([id], [product_id], [size_id], [color_id], [stock_quantity], [last_restock_date]) VALUES (65, 10, 34, 20, 28, CAST(N'2025-03-01T05:34:55.0733333' AS DateTime2))
GO
INSERT [dbo].[product_variants] ([id], [product_id], [size_id], [color_id], [stock_quantity], [last_restock_date]) VALUES (66, 10, 35, 20, 45, CAST(N'2025-03-01T05:34:56.6600000' AS DateTime2))
GO
INSERT [dbo].[product_variants] ([id], [product_id], [size_id], [color_id], [stock_quantity], [last_restock_date]) VALUES (67, 10, 36, 20, 40, CAST(N'2025-03-01T05:34:58.1466667' AS DateTime2))
GO
INSERT [dbo].[product_variants] ([id], [product_id], [size_id], [color_id], [stock_quantity], [last_restock_date]) VALUES (68, 10, 37, 20, 30, CAST(N'2025-03-01T05:35:01.5366667' AS DateTime2))
GO
INSERT [dbo].[product_variants] ([id], [product_id], [size_id], [color_id], [stock_quantity], [last_restock_date]) VALUES (69, 10, 33, 21, 25, CAST(N'2025-03-01T05:35:11.7233333' AS DateTime2))
GO
INSERT [dbo].[product_variants] ([id], [product_id], [size_id], [color_id], [stock_quantity], [last_restock_date]) VALUES (70, 10, 34, 21, 35, CAST(N'2025-03-01T05:35:17.1533333' AS DateTime2))
GO
INSERT [dbo].[product_variants] ([id], [product_id], [size_id], [color_id], [stock_quantity], [last_restock_date]) VALUES (71, 10, 35, 21, 50, CAST(N'2025-03-01T05:35:20.3666667' AS DateTime2))
GO
INSERT [dbo].[product_variants] ([id], [product_id], [size_id], [color_id], [stock_quantity], [last_restock_date]) VALUES (72, 10, 36, 21, 45, CAST(N'2025-03-01T05:35:23.5666667' AS DateTime2))
GO
INSERT [dbo].[product_variants] ([id], [product_id], [size_id], [color_id], [stock_quantity], [last_restock_date]) VALUES (73, 10, 37, 21, 30, CAST(N'2025-03-01T05:35:14.4900000' AS DateTime2))
GO
INSERT [dbo].[product_variants] ([id], [product_id], [size_id], [color_id], [stock_quantity], [last_restock_date]) VALUES (74, 11, 21, 22, 54, CAST(N'2025-03-29T17:11:08.7000000' AS DateTime2))
GO
INSERT [dbo].[product_variants] ([id], [product_id], [size_id], [color_id], [stock_quantity], [last_restock_date]) VALUES (75, 11, 22, 22, 65, CAST(N'2025-03-01T05:37:42.5333333' AS DateTime2))
GO
INSERT [dbo].[product_variants] ([id], [product_id], [size_id], [color_id], [stock_quantity], [last_restock_date]) VALUES (76, 11, 23, 22, 50, CAST(N'2025-03-01T05:37:44.3800000' AS DateTime2))
GO
INSERT [dbo].[product_variants] ([id], [product_id], [size_id], [color_id], [stock_quantity], [last_restock_date]) VALUES (77, 11, 21, 23, 45, CAST(N'2025-03-01T05:37:36.0500000' AS DateTime2))
GO
INSERT [dbo].[product_variants] ([id], [product_id], [size_id], [color_id], [stock_quantity], [last_restock_date]) VALUES (78, 11, 22, 23, 60, CAST(N'2025-03-01T05:37:37.9966667' AS DateTime2))
GO
INSERT [dbo].[product_variants] ([id], [product_id], [size_id], [color_id], [stock_quantity], [last_restock_date]) VALUES (79, 11, 23, 23, 55, CAST(N'2025-03-01T05:37:39.5366667' AS DateTime2))
GO
INSERT [dbo].[product_variants] ([id], [product_id], [size_id], [color_id], [stock_quantity], [last_restock_date]) VALUES (80, 12, 38, 24, 40, CAST(N'2025-03-01T05:32:29.2166667' AS DateTime2))
GO
INSERT [dbo].[product_variants] ([id], [product_id], [size_id], [color_id], [stock_quantity], [last_restock_date]) VALUES (81, 12, 39, 24, 55, CAST(N'2025-03-01T05:32:26.0466667' AS DateTime2))
GO
INSERT [dbo].[product_variants] ([id], [product_id], [size_id], [color_id], [stock_quantity], [last_restock_date]) VALUES (82, 12, 40, 24, 33, CAST(N'2025-03-01T05:32:24.5433333' AS DateTime2))
GO
INSERT [dbo].[product_variants] ([id], [product_id], [size_id], [color_id], [stock_quantity], [last_restock_date]) VALUES (83, 12, 41, 24, 50, CAST(N'2025-03-01T05:32:32.7566667' AS DateTime2))
GO
INSERT [dbo].[product_variants] ([id], [product_id], [size_id], [color_id], [stock_quantity], [last_restock_date]) VALUES (84, 12, 38, 25, 45, CAST(N'2025-03-01T05:32:38.0100000' AS DateTime2))
GO
INSERT [dbo].[product_variants] ([id], [product_id], [size_id], [color_id], [stock_quantity], [last_restock_date]) VALUES (85, 12, 39, 25, 60, CAST(N'2025-03-01T05:32:30.8466667' AS DateTime2))
GO
INSERT [dbo].[product_variants] ([id], [product_id], [size_id], [color_id], [stock_quantity], [last_restock_date]) VALUES (86, 12, 40, 25, 30, CAST(N'2025-03-01T05:32:34.5133333' AS DateTime2))
GO
INSERT [dbo].[product_variants] ([id], [product_id], [size_id], [color_id], [stock_quantity], [last_restock_date]) VALUES (87, 12, 41, 25, 55, CAST(N'2025-03-01T05:32:36.2933333' AS DateTime2))
GO
INSERT [dbo].[product_variants] ([id], [product_id], [size_id], [color_id], [stock_quantity], [last_restock_date]) VALUES (88, 13, 42, 26, 39, CAST(N'2025-03-01T05:30:59.8700000' AS DateTime2))
GO
INSERT [dbo].[product_variants] ([id], [product_id], [size_id], [color_id], [stock_quantity], [last_restock_date]) VALUES (89, 13, 43, 26, 60, CAST(N'2025-03-01T05:30:55.6000000' AS DateTime2))
GO
INSERT [dbo].[product_variants] ([id], [product_id], [size_id], [color_id], [stock_quantity], [last_restock_date]) VALUES (90, 13, 44, 26, 50, CAST(N'2025-03-01T05:30:53.9466667' AS DateTime2))
GO
INSERT [dbo].[product_variants] ([id], [product_id], [size_id], [color_id], [stock_quantity], [last_restock_date]) VALUES (91, 13, 45, 26, 30, CAST(N'2025-03-01T05:30:57.5000000' AS DateTime2))
GO
INSERT [dbo].[product_variants] ([id], [product_id], [size_id], [color_id], [stock_quantity], [last_restock_date]) VALUES (92, 13, 42, 27, 35, CAST(N'2025-03-01T05:31:05.5466667' AS DateTime2))
GO
INSERT [dbo].[product_variants] ([id], [product_id], [size_id], [color_id], [stock_quantity], [last_restock_date]) VALUES (93, 13, 43, 27, 55, CAST(N'2025-03-01T05:31:03.5166667' AS DateTime2))
GO
INSERT [dbo].[product_variants] ([id], [product_id], [size_id], [color_id], [stock_quantity], [last_restock_date]) VALUES (94, 13, 44, 27, 45, CAST(N'2025-03-01T05:31:01.7566667' AS DateTime2))
GO
INSERT [dbo].[product_variants] ([id], [product_id], [size_id], [color_id], [stock_quantity], [last_restock_date]) VALUES (95, 13, 45, 27, 25, CAST(N'2025-03-01T05:31:08.3633333' AS DateTime2))
GO
INSERT [dbo].[product_variants] ([id], [product_id], [size_id], [color_id], [stock_quantity], [last_restock_date]) VALUES (100, 14, 46, 29, 45, CAST(N'2025-03-01T05:31:37.6933333' AS DateTime2))
GO
INSERT [dbo].[product_variants] ([id], [product_id], [size_id], [color_id], [stock_quantity], [last_restock_date]) VALUES (101, 14, 47, 29, 65, CAST(N'2025-03-01T05:31:34.0066667' AS DateTime2))
GO
INSERT [dbo].[product_variants] ([id], [product_id], [size_id], [color_id], [stock_quantity], [last_restock_date]) VALUES (102, 14, 48, 29, 55, CAST(N'2025-03-01T05:31:31.0666667' AS DateTime2))
GO
INSERT [dbo].[product_variants] ([id], [product_id], [size_id], [color_id], [stock_quantity], [last_restock_date]) VALUES (103, 14, 49, 29, 35, CAST(N'2025-03-01T05:31:35.6833333' AS DateTime2))
GO
INSERT [dbo].[product_variants] ([id], [product_id], [size_id], [color_id], [stock_quantity], [last_restock_date]) VALUES (104, 14, 46, 30, 38, CAST(N'2025-03-01T05:31:44.9633333' AS DateTime2))
GO
INSERT [dbo].[product_variants] ([id], [product_id], [size_id], [color_id], [stock_quantity], [last_restock_date]) VALUES (105, 14, 47, 30, 58, CAST(N'2025-03-01T05:31:42.9900000' AS DateTime2))
GO
INSERT [dbo].[product_variants] ([id], [product_id], [size_id], [color_id], [stock_quantity], [last_restock_date]) VALUES (106, 14, 48, 30, 50, CAST(N'2025-03-01T05:31:40.2200000' AS DateTime2))
GO
INSERT [dbo].[product_variants] ([id], [product_id], [size_id], [color_id], [stock_quantity], [last_restock_date]) VALUES (107, 14, 49, 30, 30, CAST(N'2025-03-01T05:31:46.7166667' AS DateTime2))
GO
INSERT [dbo].[product_variants] ([id], [product_id], [size_id], [color_id], [stock_quantity], [last_restock_date]) VALUES (108, 14, 46, 31, 35, CAST(N'2025-03-01T05:31:55.0566667' AS DateTime2))
GO
INSERT [dbo].[product_variants] ([id], [product_id], [size_id], [color_id], [stock_quantity], [last_restock_date]) VALUES (109, 14, 47, 31, 55, CAST(N'2025-03-01T05:31:51.9633333' AS DateTime2))
GO
INSERT [dbo].[product_variants] ([id], [product_id], [size_id], [color_id], [stock_quantity], [last_restock_date]) VALUES (110, 14, 48, 31, 45, CAST(N'2025-03-01T05:31:49.3600000' AS DateTime2))
GO
INSERT [dbo].[product_variants] ([id], [product_id], [size_id], [color_id], [stock_quantity], [last_restock_date]) VALUES (111, 14, 49, 31, 25, CAST(N'2025-03-01T05:31:57.5966667' AS DateTime2))
GO
INSERT [dbo].[product_variants] ([id], [product_id], [size_id], [color_id], [stock_quantity], [last_restock_date]) VALUES (112, 15, 50, 32, 29, CAST(N'2025-03-01T05:32:14.0900000' AS DateTime2))
GO
INSERT [dbo].[product_variants] ([id], [product_id], [size_id], [color_id], [stock_quantity], [last_restock_date]) VALUES (113, 15, 51, 32, 45, CAST(N'2025-03-01T05:32:10.7633333' AS DateTime2))
GO
INSERT [dbo].[product_variants] ([id], [product_id], [size_id], [color_id], [stock_quantity], [last_restock_date]) VALUES (114, 15, 52, 32, 25, CAST(N'2025-03-01T05:32:12.4100000' AS DateTime2))
GO
INSERT [dbo].[product_variants] ([id], [product_id], [size_id], [color_id], [stock_quantity], [last_restock_date]) VALUES (115, 15, 50, 33, 35, CAST(N'2025-03-29T17:06:01.0000000' AS DateTime2))
GO
INSERT [dbo].[product_variants] ([id], [product_id], [size_id], [color_id], [stock_quantity], [last_restock_date]) VALUES (116, 15, 51, 33, 50, CAST(N'2025-03-01T05:32:06.5033333' AS DateTime2))
GO
INSERT [dbo].[product_variants] ([id], [product_id], [size_id], [color_id], [stock_quantity], [last_restock_date]) VALUES (117, 15, 52, 33, 30, CAST(N'2025-03-01T05:32:04.3800000' AS DateTime2))
GO
INSERT [dbo].[product_variants] ([id], [product_id], [size_id], [color_id], [stock_quantity], [last_restock_date]) VALUES (118, 16, 53, 34, 49, CAST(N'2025-03-01T05:30:33.9566667' AS DateTime2))
GO
INSERT [dbo].[product_variants] ([id], [product_id], [size_id], [color_id], [stock_quantity], [last_restock_date]) VALUES (119, 16, 54, 34, 70, CAST(N'2025-03-01T05:30:24.7866667' AS DateTime2))
GO
INSERT [dbo].[product_variants] ([id], [product_id], [size_id], [color_id], [stock_quantity], [last_restock_date]) VALUES (120, 16, 55, 34, 60, CAST(N'2025-03-01T05:30:31.8500000' AS DateTime2))
GO
INSERT [dbo].[product_variants] ([id], [product_id], [size_id], [color_id], [stock_quantity], [last_restock_date]) VALUES (121, 16, 56, 34, 40, CAST(N'2025-03-01T05:30:36.4300000' AS DateTime2))
GO
INSERT [dbo].[product_variants] ([id], [product_id], [size_id], [color_id], [stock_quantity], [last_restock_date]) VALUES (122, 16, 53, 35, 55, CAST(N'2025-03-01T05:30:27.0500000' AS DateTime2))
GO
INSERT [dbo].[product_variants] ([id], [product_id], [size_id], [color_id], [stock_quantity], [last_restock_date]) VALUES (123, 16, 54, 35, 75, CAST(N'2025-03-01T05:30:22.6733333' AS DateTime2))
GO
INSERT [dbo].[product_variants] ([id], [product_id], [size_id], [color_id], [stock_quantity], [last_restock_date]) VALUES (124, 16, 55, 35, 65, CAST(N'2025-03-01T05:30:17.3166667' AS DateTime2))
GO
INSERT [dbo].[product_variants] ([id], [product_id], [size_id], [color_id], [stock_quantity], [last_restock_date]) VALUES (125, 16, 56, 35, 45, CAST(N'2025-03-01T05:30:29.3466667' AS DateTime2))
GO
INSERT [dbo].[product_variants] ([id], [product_id], [size_id], [color_id], [stock_quantity], [last_restock_date]) VALUES (126, 16, 53, 36, 45, CAST(N'2025-03-01T05:30:44.3900000' AS DateTime2))
GO
INSERT [dbo].[product_variants] ([id], [product_id], [size_id], [color_id], [stock_quantity], [last_restock_date]) VALUES (127, 16, 54, 36, 65, CAST(N'2025-03-01T05:30:41.5300000' AS DateTime2))
GO
INSERT [dbo].[product_variants] ([id], [product_id], [size_id], [color_id], [stock_quantity], [last_restock_date]) VALUES (128, 16, 55, 36, 55, CAST(N'2025-03-01T05:30:39.4133333' AS DateTime2))
GO
INSERT [dbo].[product_variants] ([id], [product_id], [size_id], [color_id], [stock_quantity], [last_restock_date]) VALUES (129, 16, 56, 36, 35, CAST(N'2025-03-01T05:30:47.0933333' AS DateTime2))
GO
INSERT [dbo].[product_variants] ([id], [product_id], [size_id], [color_id], [stock_quantity], [last_restock_date]) VALUES (130, 17, 57, 37, 40, CAST(N'2025-03-01T05:29:52.5600000' AS DateTime2))
GO
INSERT [dbo].[product_variants] ([id], [product_id], [size_id], [color_id], [stock_quantity], [last_restock_date]) VALUES (131, 17, 58, 37, 49, CAST(N'2025-03-01T05:29:54.0866667' AS DateTime2))
GO
INSERT [dbo].[product_variants] ([id], [product_id], [size_id], [color_id], [stock_quantity], [last_restock_date]) VALUES (132, 17, 59, 37, 35, CAST(N'2025-03-01T05:29:55.4700000' AS DateTime2))
GO
INSERT [dbo].[product_variants] ([id], [product_id], [size_id], [color_id], [stock_quantity], [last_restock_date]) VALUES (133, 17, 57, 38, 45, CAST(N'2025-03-01T05:29:57.4000000' AS DateTime2))
GO
INSERT [dbo].[product_variants] ([id], [product_id], [size_id], [color_id], [stock_quantity], [last_restock_date]) VALUES (134, 17, 58, 38, 55, CAST(N'2025-03-01T05:29:59.3200000' AS DateTime2))
GO
INSERT [dbo].[product_variants] ([id], [product_id], [size_id], [color_id], [stock_quantity], [last_restock_date]) VALUES (135, 17, 59, 38, 40, CAST(N'2025-03-01T05:30:01.0166667' AS DateTime2))
GO
INSERT [dbo].[product_variants] ([id], [product_id], [size_id], [color_id], [stock_quantity], [last_restock_date]) VALUES (136, 18, 60, 39, 60, CAST(N'2025-03-01T05:29:39.2666667' AS DateTime2))
GO
INSERT [dbo].[product_variants] ([id], [product_id], [size_id], [color_id], [stock_quantity], [last_restock_date]) VALUES (137, 18, 60, 40, 65, CAST(N'2025-03-01T05:29:40.9066667' AS DateTime2))
GO
INSERT [dbo].[product_variants] ([id], [product_id], [size_id], [color_id], [stock_quantity], [last_restock_date]) VALUES (138, 18, 60, 41, 55, CAST(N'2025-03-01T05:29:42.5666667' AS DateTime2))
GO
INSERT [dbo].[product_variants] ([id], [product_id], [size_id], [color_id], [stock_quantity], [last_restock_date]) VALUES (139, 19, 61, 42, 29, CAST(N'2025-03-01T05:29:22.3866667' AS DateTime2))
GO
INSERT [dbo].[product_variants] ([id], [product_id], [size_id], [color_id], [stock_quantity], [last_restock_date]) VALUES (140, 19, 62, 42, 40, CAST(N'2025-03-01T05:29:24.2033333' AS DateTime2))
GO
INSERT [dbo].[product_variants] ([id], [product_id], [size_id], [color_id], [stock_quantity], [last_restock_date]) VALUES (141, 19, 63, 42, 20, CAST(N'2025-03-01T05:29:29.9100000' AS DateTime2))
GO
INSERT [dbo].[product_variants] ([id], [product_id], [size_id], [color_id], [stock_quantity], [last_restock_date]) VALUES (142, 19, 61, 43, 25, CAST(N'2025-03-01T05:29:25.8733333' AS DateTime2))
GO
INSERT [dbo].[product_variants] ([id], [product_id], [size_id], [color_id], [stock_quantity], [last_restock_date]) VALUES (143, 19, 62, 43, 35, CAST(N'2025-03-01T05:29:27.5466667' AS DateTime2))
GO
INSERT [dbo].[product_variants] ([id], [product_id], [size_id], [color_id], [stock_quantity], [last_restock_date]) VALUES (144, 19, 63, 43, 15, CAST(N'2025-03-01T05:29:31.7000000' AS DateTime2))
GO
INSERT [dbo].[product_variants] ([id], [product_id], [size_id], [color_id], [stock_quantity], [last_restock_date]) VALUES (145, 20, 64, 44, 25, CAST(N'2025-03-01T05:28:35.0333333' AS DateTime2))
GO
INSERT [dbo].[product_variants] ([id], [product_id], [size_id], [color_id], [stock_quantity], [last_restock_date]) VALUES (146, 20, 65, 44, 35, CAST(N'2025-03-01T05:28:37.2400000' AS DateTime2))
GO
INSERT [dbo].[product_variants] ([id], [product_id], [size_id], [color_id], [stock_quantity], [last_restock_date]) VALUES (147, 20, 66, 44, 45, CAST(N'2025-03-01T05:28:42.5166667' AS DateTime2))
GO
INSERT [dbo].[product_variants] ([id], [product_id], [size_id], [color_id], [stock_quantity], [last_restock_date]) VALUES (148, 20, 67, 44, 40, CAST(N'2025-03-01T05:28:44.7433333' AS DateTime2))
GO
INSERT [dbo].[product_variants] ([id], [product_id], [size_id], [color_id], [stock_quantity], [last_restock_date]) VALUES (149, 20, 68, 44, 30, CAST(N'2025-03-01T05:28:40.6700000' AS DateTime2))
GO
INSERT [dbo].[product_variants] ([id], [product_id], [size_id], [color_id], [stock_quantity], [last_restock_date]) VALUES (150, 20, 64, 45, 19, CAST(N'2025-03-01T05:29:02.5600000' AS DateTime2))
GO
INSERT [dbo].[product_variants] ([id], [product_id], [size_id], [color_id], [stock_quantity], [last_restock_date]) VALUES (151, 20, 65, 45, 30, CAST(N'2025-03-01T05:29:05.3500000' AS DateTime2))
GO
INSERT [dbo].[product_variants] ([id], [product_id], [size_id], [color_id], [stock_quantity], [last_restock_date]) VALUES (152, 20, 66, 45, 40, CAST(N'2025-03-01T05:29:08.5833333' AS DateTime2))
GO
INSERT [dbo].[product_variants] ([id], [product_id], [size_id], [color_id], [stock_quantity], [last_restock_date]) VALUES (153, 20, 67, 45, 35, CAST(N'2025-03-01T05:29:11.8866667' AS DateTime2))
GO
INSERT [dbo].[product_variants] ([id], [product_id], [size_id], [color_id], [stock_quantity], [last_restock_date]) VALUES (154, 20, 68, 45, 25, CAST(N'2025-03-01T05:29:14.6566667' AS DateTime2))
GO
INSERT [dbo].[product_variants] ([id], [product_id], [size_id], [color_id], [stock_quantity], [last_restock_date]) VALUES (155, 20, 64, 46, 15, CAST(N'2025-03-01T05:28:49.3633333' AS DateTime2))
GO
INSERT [dbo].[product_variants] ([id], [product_id], [size_id], [color_id], [stock_quantity], [last_restock_date]) VALUES (156, 20, 65, 46, 25, CAST(N'2025-03-01T05:28:51.9500000' AS DateTime2))
GO
INSERT [dbo].[product_variants] ([id], [product_id], [size_id], [color_id], [stock_quantity], [last_restock_date]) VALUES (157, 20, 66, 46, 35, CAST(N'2025-03-01T05:28:54.7533333' AS DateTime2))
GO
INSERT [dbo].[product_variants] ([id], [product_id], [size_id], [color_id], [stock_quantity], [last_restock_date]) VALUES (158, 20, 67, 46, 30, CAST(N'2025-03-01T05:28:57.6900000' AS DateTime2))
GO
INSERT [dbo].[product_variants] ([id], [product_id], [size_id], [color_id], [stock_quantity], [last_restock_date]) VALUES (159, 20, 68, 46, 20, CAST(N'2025-03-01T05:29:00.1233333' AS DateTime2))
GO
INSERT [dbo].[product_variants] ([id], [product_id], [size_id], [color_id], [stock_quantity], [last_restock_date]) VALUES (160, 21, 69, 47, 49, CAST(N'2025-03-01T05:28:23.5800000' AS DateTime2))
GO
INSERT [dbo].[product_variants] ([id], [product_id], [size_id], [color_id], [stock_quantity], [last_restock_date]) VALUES (161, 21, 69, 48, 45, CAST(N'2025-03-01T05:28:25.1700000' AS DateTime2))
GO
INSERT [dbo].[product_variants] ([id], [product_id], [size_id], [color_id], [stock_quantity], [last_restock_date]) VALUES (162, 21, 69, 49, 40, CAST(N'2025-03-01T05:28:26.6266667' AS DateTime2))
GO
INSERT [dbo].[product_variants] ([id], [product_id], [size_id], [color_id], [stock_quantity], [last_restock_date]) VALUES (163, 22, 70, 50, 35, CAST(N'2025-03-01T05:28:03.0966667' AS DateTime2))
GO
INSERT [dbo].[product_variants] ([id], [product_id], [size_id], [color_id], [stock_quantity], [last_restock_date]) VALUES (164, 22, 71, 50, 50, CAST(N'2025-03-01T05:27:55.7566667' AS DateTime2))
GO
INSERT [dbo].[product_variants] ([id], [product_id], [size_id], [color_id], [stock_quantity], [last_restock_date]) VALUES (165, 22, 72, 50, 40, CAST(N'2025-03-01T05:27:53.1566667' AS DateTime2))
GO
INSERT [dbo].[product_variants] ([id], [product_id], [size_id], [color_id], [stock_quantity], [last_restock_date]) VALUES (166, 22, 73, 50, 30, CAST(N'2025-03-01T05:28:05.5400000' AS DateTime2))
GO
INSERT [dbo].[product_variants] ([id], [product_id], [size_id], [color_id], [stock_quantity], [last_restock_date]) VALUES (167, 22, 70, 51, 30, CAST(N'2025-03-01T05:27:49.6533333' AS DateTime2))
GO
INSERT [dbo].[product_variants] ([id], [product_id], [size_id], [color_id], [stock_quantity], [last_restock_date]) VALUES (168, 22, 71, 51, 44, CAST(N'2025-03-01T05:27:47.7933333' AS DateTime2))
GO
INSERT [dbo].[product_variants] ([id], [product_id], [size_id], [color_id], [stock_quantity], [last_restock_date]) VALUES (169, 22, 72, 51, 35, CAST(N'2025-03-01T05:27:45.6300000' AS DateTime2))
GO
INSERT [dbo].[product_variants] ([id], [product_id], [size_id], [color_id], [stock_quantity], [last_restock_date]) VALUES (170, 22, 73, 51, 25, CAST(N'2025-03-01T05:27:51.3533333' AS DateTime2))
GO
INSERT [dbo].[product_variants] ([id], [product_id], [size_id], [color_id], [stock_quantity], [last_restock_date]) VALUES (171, 22, 70, 52, 24, CAST(N'2025-03-01T05:28:13.2666667' AS DateTime2))
GO
INSERT [dbo].[product_variants] ([id], [product_id], [size_id], [color_id], [stock_quantity], [last_restock_date]) VALUES (172, 22, 71, 52, 40, CAST(N'2025-03-01T05:28:10.6200000' AS DateTime2))
GO
INSERT [dbo].[product_variants] ([id], [product_id], [size_id], [color_id], [stock_quantity], [last_restock_date]) VALUES (173, 22, 72, 52, 30, CAST(N'2025-03-01T05:28:08.2266667' AS DateTime2))
GO
INSERT [dbo].[product_variants] ([id], [product_id], [size_id], [color_id], [stock_quantity], [last_restock_date]) VALUES (174, 22, 73, 52, 20, CAST(N'2025-03-01T05:28:16.0233333' AS DateTime2))
GO
INSERT [dbo].[product_variants] ([id], [product_id], [size_id], [color_id], [stock_quantity], [last_restock_date]) VALUES (175, 23, 74, 53, 40, CAST(N'2025-03-01T05:27:17.6100000' AS DateTime2))
GO
INSERT [dbo].[product_variants] ([id], [product_id], [size_id], [color_id], [stock_quantity], [last_restock_date]) VALUES (176, 23, 75, 53, 60, CAST(N'2025-03-01T05:27:14.9200000' AS DateTime2))
GO
INSERT [dbo].[product_variants] ([id], [product_id], [size_id], [color_id], [stock_quantity], [last_restock_date]) VALUES (177, 23, 76, 53, 50, CAST(N'2025-03-01T05:27:09.6000000' AS DateTime2))
GO
INSERT [dbo].[product_variants] ([id], [product_id], [size_id], [color_id], [stock_quantity], [last_restock_date]) VALUES (178, 23, 77, 53, 30, CAST(N'2025-03-01T05:27:25.1033333' AS DateTime2))
GO
INSERT [dbo].[product_variants] ([id], [product_id], [size_id], [color_id], [stock_quantity], [last_restock_date]) VALUES (179, 23, 74, 54, 45, CAST(N'2025-03-01T05:27:03.9733333' AS DateTime2))
GO
INSERT [dbo].[product_variants] ([id], [product_id], [size_id], [color_id], [stock_quantity], [last_restock_date]) VALUES (180, 23, 75, 54, 65, CAST(N'2025-03-01T05:26:58.5833333' AS DateTime2))
GO
INSERT [dbo].[product_variants] ([id], [product_id], [size_id], [color_id], [stock_quantity], [last_restock_date]) VALUES (181, 23, 76, 54, 55, CAST(N'2025-03-01T05:26:57.0500000' AS DateTime2))
GO
INSERT [dbo].[product_variants] ([id], [product_id], [size_id], [color_id], [stock_quantity], [last_restock_date]) VALUES (182, 23, 77, 54, 35, CAST(N'2025-03-01T05:27:02.2800000' AS DateTime2))
GO
INSERT [dbo].[product_variants] ([id], [product_id], [size_id], [color_id], [stock_quantity], [last_restock_date]) VALUES (183, 23, 74, 55, 35, CAST(N'2025-03-01T05:27:32.9466667' AS DateTime2))
GO
INSERT [dbo].[product_variants] ([id], [product_id], [size_id], [color_id], [stock_quantity], [last_restock_date]) VALUES (184, 23, 75, 55, 55, CAST(N'2025-03-01T05:27:30.5733333' AS DateTime2))
GO
INSERT [dbo].[product_variants] ([id], [product_id], [size_id], [color_id], [stock_quantity], [last_restock_date]) VALUES (185, 23, 76, 55, 45, CAST(N'2025-03-01T05:27:28.0966667' AS DateTime2))
GO
INSERT [dbo].[product_variants] ([id], [product_id], [size_id], [color_id], [stock_quantity], [last_restock_date]) VALUES (186, 23, 77, 55, 25, CAST(N'2025-03-01T05:27:35.6400000' AS DateTime2))
GO
INSERT [dbo].[product_variants] ([id], [product_id], [size_id], [color_id], [stock_quantity], [last_restock_date]) VALUES (187, 24, 78, 56, 30, CAST(N'2025-03-01T05:26:03.7366667' AS DateTime2))
GO
INSERT [dbo].[product_variants] ([id], [product_id], [size_id], [color_id], [stock_quantity], [last_restock_date]) VALUES (188, 24, 79, 56, 45, CAST(N'2025-03-01T05:26:02.1633333' AS DateTime2))
GO
INSERT [dbo].[product_variants] ([id], [product_id], [size_id], [color_id], [stock_quantity], [last_restock_date]) VALUES (189, 24, 80, 56, 40, CAST(N'2025-03-01T05:26:00.2733333' AS DateTime2))
GO
INSERT [dbo].[product_variants] ([id], [product_id], [size_id], [color_id], [stock_quantity], [last_restock_date]) VALUES (190, 24, 81, 56, 25, CAST(N'2025-03-01T05:26:05.3500000' AS DateTime2))
GO
INSERT [dbo].[product_variants] ([id], [product_id], [size_id], [color_id], [stock_quantity], [last_restock_date]) VALUES (191, 24, 78, 57, 35, CAST(N'2025-03-01T05:26:48.7033333' AS DateTime2))
GO
INSERT [dbo].[product_variants] ([id], [product_id], [size_id], [color_id], [stock_quantity], [last_restock_date]) VALUES (192, 24, 79, 57, 50, CAST(N'2025-03-01T05:26:45.1800000' AS DateTime2))
GO
INSERT [dbo].[product_variants] ([id], [product_id], [size_id], [color_id], [stock_quantity], [last_restock_date]) VALUES (193, 24, 80, 57, 45, CAST(N'2025-03-01T05:26:24.5800000' AS DateTime2))
GO
INSERT [dbo].[product_variants] ([id], [product_id], [size_id], [color_id], [stock_quantity], [last_restock_date]) VALUES (194, 24, 81, 57, 30, CAST(N'2025-03-01T05:26:51.6466667' AS DateTime2))
GO
INSERT [dbo].[product_variants] ([id], [product_id], [size_id], [color_id], [stock_quantity], [last_restock_date]) VALUES (195, 24, 78, 58, 25, CAST(N'2025-03-01T05:26:14.5733333' AS DateTime2))
GO
INSERT [dbo].[product_variants] ([id], [product_id], [size_id], [color_id], [stock_quantity], [last_restock_date]) VALUES (196, 24, 79, 58, 40, CAST(N'2025-03-01T05:26:11.5666667' AS DateTime2))
GO
INSERT [dbo].[product_variants] ([id], [product_id], [size_id], [color_id], [stock_quantity], [last_restock_date]) VALUES (197, 24, 80, 58, 35, CAST(N'2025-03-01T05:26:07.5566667' AS DateTime2))
GO
INSERT [dbo].[product_variants] ([id], [product_id], [size_id], [color_id], [stock_quantity], [last_restock_date]) VALUES (198, 24, 81, 58, 20, CAST(N'2025-03-01T05:26:17.1166667' AS DateTime2))
GO
INSERT [dbo].[product_variants] ([id], [product_id], [size_id], [color_id], [stock_quantity], [last_restock_date]) VALUES (199, 25, 82, 59, 49, CAST(N'2025-03-29T17:06:52.3766667' AS DateTime2))
GO
INSERT [dbo].[product_variants] ([id], [product_id], [size_id], [color_id], [stock_quantity], [last_restock_date]) VALUES (200, 25, 82, 60, 45, CAST(N'2025-03-01T05:25:51.0066667' AS DateTime2))
GO
INSERT [dbo].[product_variants] ([id], [product_id], [size_id], [color_id], [stock_quantity], [last_restock_date]) VALUES (201, 25, 82, 61, 40, CAST(N'2025-03-01T05:25:52.7800000' AS DateTime2))
GO
INSERT [dbo].[product_variants] ([id], [product_id], [size_id], [color_id], [stock_quantity], [last_restock_date]) VALUES (202, 26, 83, 62, 59, CAST(N'2025-03-01T05:25:41.6866667' AS DateTime2))
GO
INSERT [dbo].[product_variants] ([id], [product_id], [size_id], [color_id], [stock_quantity], [last_restock_date]) VALUES (203, 26, 83, 63, 55, CAST(N'2025-03-01T05:25:43.2966667' AS DateTime2))
GO
INSERT [dbo].[product_variants] ([id], [product_id], [size_id], [color_id], [stock_quantity], [last_restock_date]) VALUES (204, 27, 84, 64, 35, CAST(N'2025-03-01T05:25:00.1066667' AS DateTime2))
GO
INSERT [dbo].[product_variants] ([id], [product_id], [size_id], [color_id], [stock_quantity], [last_restock_date]) VALUES (205, 27, 85, 64, 50, CAST(N'2025-03-01T05:24:56.8533333' AS DateTime2))
GO
INSERT [dbo].[product_variants] ([id], [product_id], [size_id], [color_id], [stock_quantity], [last_restock_date]) VALUES (206, 27, 86, 64, 40, CAST(N'2025-03-01T05:24:55.0133333' AS DateTime2))
GO
INSERT [dbo].[product_variants] ([id], [product_id], [size_id], [color_id], [stock_quantity], [last_restock_date]) VALUES (207, 27, 84, 65, 30, CAST(N'2025-03-01T05:25:06.7300000' AS DateTime2))
GO
INSERT [dbo].[product_variants] ([id], [product_id], [size_id], [color_id], [stock_quantity], [last_restock_date]) VALUES (208, 27, 85, 65, 45, CAST(N'2025-03-01T05:25:04.4333333' AS DateTime2))
GO
INSERT [dbo].[product_variants] ([id], [product_id], [size_id], [color_id], [stock_quantity], [last_restock_date]) VALUES (209, 27, 86, 65, 35, CAST(N'2025-03-01T05:25:02.0933333' AS DateTime2))
GO
INSERT [dbo].[product_variants] ([id], [product_id], [size_id], [color_id], [stock_quantity], [last_restock_date]) VALUES (210, 27, 84, 66, 25, CAST(N'2025-03-01T05:18:35.2833333' AS DateTime2))
GO
INSERT [dbo].[product_variants] ([id], [product_id], [size_id], [color_id], [stock_quantity], [last_restock_date]) VALUES (211, 27, 85, 66, 40, CAST(N'2025-03-01T05:18:33.6066667' AS DateTime2))
GO
INSERT [dbo].[product_variants] ([id], [product_id], [size_id], [color_id], [stock_quantity], [last_restock_date]) VALUES (212, 27, 86, 66, 30, CAST(N'2025-03-01T05:18:31.8800000' AS DateTime2))
GO
INSERT [dbo].[product_variants] ([id], [product_id], [size_id], [color_id], [stock_quantity], [last_restock_date]) VALUES (213, 28, 87, 67, 44, CAST(N'2025-03-01T05:07:28.7233333' AS DateTime2))
GO
INSERT [dbo].[product_variants] ([id], [product_id], [size_id], [color_id], [stock_quantity], [last_restock_date]) VALUES (214, 28, 88, 67, 60, CAST(N'2025-03-01T05:07:30.5033333' AS DateTime2))
GO
INSERT [dbo].[product_variants] ([id], [product_id], [size_id], [color_id], [stock_quantity], [last_restock_date]) VALUES (215, 28, 89, 67, 55, CAST(N'2025-03-01T05:07:32.1733333' AS DateTime2))
GO
INSERT [dbo].[product_variants] ([id], [product_id], [size_id], [color_id], [stock_quantity], [last_restock_date]) VALUES (216, 28, 90, 67, 50, CAST(N'2025-03-01T05:07:33.7733333' AS DateTime2))
GO
INSERT [dbo].[product_variants] ([id], [product_id], [size_id], [color_id], [stock_quantity], [last_restock_date]) VALUES (217, 28, 91, 67, 40, CAST(N'2025-03-01T05:07:35.4500000' AS DateTime2))
GO
INSERT [dbo].[product_variants] ([id], [product_id], [size_id], [color_id], [stock_quantity], [last_restock_date]) VALUES (218, 28, 87, 68, 40, CAST(N'2025-03-29T16:47:58.3866667' AS DateTime2))
GO
INSERT [dbo].[product_variants] ([id], [product_id], [size_id], [color_id], [stock_quantity], [last_restock_date]) VALUES (219, 28, 88, 68, 54, CAST(N'2025-03-01T05:07:40.4733333' AS DateTime2))
GO
INSERT [dbo].[product_variants] ([id], [product_id], [size_id], [color_id], [stock_quantity], [last_restock_date]) VALUES (220, 28, 89, 68, 50, CAST(N'2025-03-01T05:07:43.7200000' AS DateTime2))
GO
INSERT [dbo].[product_variants] ([id], [product_id], [size_id], [color_id], [stock_quantity], [last_restock_date]) VALUES (221, 28, 90, 68, 45, CAST(N'2025-03-01T05:07:46.3200000' AS DateTime2))
GO
INSERT [dbo].[product_variants] ([id], [product_id], [size_id], [color_id], [stock_quantity], [last_restock_date]) VALUES (222, 28, 91, 68, 35, CAST(N'2025-03-01T05:07:48.9600000' AS DateTime2))
GO
INSERT [dbo].[product_variants] ([id], [product_id], [size_id], [color_id], [stock_quantity], [last_restock_date]) VALUES (223, 29, 92, 69, 49, CAST(N'2025-03-01T05:06:43.1100000' AS DateTime2))
GO
INSERT [dbo].[product_variants] ([id], [product_id], [size_id], [color_id], [stock_quantity], [last_restock_date]) VALUES (224, 29, 93, 69, 65, CAST(N'2025-03-29T20:08:25.3533333' AS DateTime2))
GO
INSERT [dbo].[product_variants] ([id], [product_id], [size_id], [color_id], [stock_quantity], [last_restock_date]) VALUES (225, 29, 94, 69, 55, CAST(N'2025-03-01T05:06:53.3000000' AS DateTime2))
GO
INSERT [dbo].[product_variants] ([id], [product_id], [size_id], [color_id], [stock_quantity], [last_restock_date]) VALUES (226, 29, 95, 69, 45, CAST(N'2025-03-01T05:06:51.1733333' AS DateTime2))
GO
INSERT [dbo].[product_variants] ([id], [product_id], [size_id], [color_id], [stock_quantity], [last_restock_date]) VALUES (227, 29, 92, 70, 40, CAST(N'2025-03-01T05:07:10.9900000' AS DateTime2))
GO
INSERT [dbo].[product_variants] ([id], [product_id], [size_id], [color_id], [stock_quantity], [last_restock_date]) VALUES (228, 29, 93, 70, 60, CAST(N'2025-03-01T05:07:20.0133333' AS DateTime2))
GO
INSERT [dbo].[product_variants] ([id], [product_id], [size_id], [color_id], [stock_quantity], [last_restock_date]) VALUES (229, 29, 94, 70, 50, CAST(N'2025-03-01T05:07:17.0166667' AS DateTime2))
GO
INSERT [dbo].[product_variants] ([id], [product_id], [size_id], [color_id], [stock_quantity], [last_restock_date]) VALUES (230, 29, 95, 70, 40, CAST(N'2025-03-01T05:07:14.2666667' AS DateTime2))
GO
INSERT [dbo].[product_variants] ([id], [product_id], [size_id], [color_id], [stock_quantity], [last_restock_date]) VALUES (231, 29, 92, 71, 40, CAST(N'2025-03-01T05:06:56.0033333' AS DateTime2))
GO
INSERT [dbo].[product_variants] ([id], [product_id], [size_id], [color_id], [stock_quantity], [last_restock_date]) VALUES (232, 29, 93, 71, 55, CAST(N'2025-03-01T05:06:58.2533333' AS DateTime2))
GO
INSERT [dbo].[product_variants] ([id], [product_id], [size_id], [color_id], [stock_quantity], [last_restock_date]) VALUES (233, 29, 94, 71, 45, CAST(N'2025-03-01T05:07:01.8100000' AS DateTime2))
GO
INSERT [dbo].[product_variants] ([id], [product_id], [size_id], [color_id], [stock_quantity], [last_restock_date]) VALUES (234, 29, 95, 71, 35, CAST(N'2025-03-01T05:07:06.8766667' AS DateTime2))
GO
INSERT [dbo].[product_variants] ([id], [product_id], [size_id], [color_id], [stock_quantity], [last_restock_date]) VALUES (235, 30, 96, 72, 28, CAST(N'2025-03-01T04:44:23.9066667' AS DateTime2))
GO
INSERT [dbo].[product_variants] ([id], [product_id], [size_id], [color_id], [stock_quantity], [last_restock_date]) VALUES (236, 30, 97, 72, 39, CAST(N'2025-03-01T04:44:30.8933333' AS DateTime2))
GO
INSERT [dbo].[product_variants] ([id], [product_id], [size_id], [color_id], [stock_quantity], [last_restock_date]) VALUES (237, 30, 98, 72, 35, CAST(N'2025-03-01T04:57:43.5466667' AS DateTime2))
GO
INSERT [dbo].[product_variants] ([id], [product_id], [size_id], [color_id], [stock_quantity], [last_restock_date]) VALUES (238, 30, 99, 72, 25, CAST(N'2025-03-01T04:57:45.6966667' AS DateTime2))
GO
INSERT [dbo].[product_variants] ([id], [product_id], [size_id], [color_id], [stock_quantity], [last_restock_date]) VALUES (239, 30, 96, 73, 24, CAST(N'2025-03-01T05:05:25.7800000' AS DateTime2))
GO
INSERT [dbo].[product_variants] ([id], [product_id], [size_id], [color_id], [stock_quantity], [last_restock_date]) VALUES (240, 30, 97, 73, 35, CAST(N'2025-03-01T05:06:23.2533333' AS DateTime2))
GO
INSERT [dbo].[product_variants] ([id], [product_id], [size_id], [color_id], [stock_quantity], [last_restock_date]) VALUES (241, 30, 98, 73, 30, CAST(N'2025-03-01T05:06:26.2366667' AS DateTime2))
GO
INSERT [dbo].[product_variants] ([id], [product_id], [size_id], [color_id], [stock_quantity], [last_restock_date]) VALUES (242, 30, 99, 73, 20, CAST(N'2025-03-01T05:06:29.0633333' AS DateTime2))
GO
INSERT [dbo].[product_variants] ([id], [product_id], [size_id], [color_id], [stock_quantity], [last_restock_date]) VALUES (243, 31, 100, 74, 38, CAST(N'2025-03-01T04:26:19.1566667' AS DateTime2))
GO
INSERT [dbo].[product_variants] ([id], [product_id], [size_id], [color_id], [stock_quantity], [last_restock_date]) VALUES (244, 31, 101, 74, 55, CAST(N'2025-03-01T04:26:17.3833333' AS DateTime2))
GO
INSERT [dbo].[product_variants] ([id], [product_id], [size_id], [color_id], [stock_quantity], [last_restock_date]) VALUES (245, 31, 102, 74, 45, CAST(N'2025-03-01T04:26:15.5300000' AS DateTime2))
GO
INSERT [dbo].[product_variants] ([id], [product_id], [size_id], [color_id], [stock_quantity], [last_restock_date]) VALUES (246, 31, 100, 75, 33, CAST(N'2025-03-01T04:26:39.4000000' AS DateTime2))
GO
INSERT [dbo].[product_variants] ([id], [product_id], [size_id], [color_id], [stock_quantity], [last_restock_date]) VALUES (247, 31, 101, 75, 48, CAST(N'2025-03-01T04:26:32.6266667' AS DateTime2))
GO
INSERT [dbo].[product_variants] ([id], [product_id], [size_id], [color_id], [stock_quantity], [last_restock_date]) VALUES (248, 31, 102, 75, 40, CAST(N'2025-03-01T04:26:29.6300000' AS DateTime2))
GO
INSERT [dbo].[product_variants] ([id], [product_id], [size_id], [color_id], [stock_quantity], [last_restock_date]) VALUES (249, 31, 100, 76, 30, CAST(N'2025-03-01T05:05:18.6300000' AS DateTime2))
GO
INSERT [dbo].[product_variants] ([id], [product_id], [size_id], [color_id], [stock_quantity], [last_restock_date]) VALUES (250, 31, 101, 76, 45, CAST(N'2025-03-01T05:05:16.5200000' AS DateTime2))
GO
INSERT [dbo].[product_variants] ([id], [product_id], [size_id], [color_id], [stock_quantity], [last_restock_date]) VALUES (251, 31, 102, 76, 35, CAST(N'2025-03-01T05:04:58.2700000' AS DateTime2))
GO
INSERT [dbo].[product_variants] ([id], [product_id], [size_id], [color_id], [stock_quantity], [last_restock_date]) VALUES (252, 32, 103, 80, 45, CAST(N'2025-03-01T04:25:44.3400000' AS DateTime2))
GO
INSERT [dbo].[product_variants] ([id], [product_id], [size_id], [color_id], [stock_quantity], [last_restock_date]) VALUES (253, 32, 104, 77, 60, CAST(N'2025-03-01T04:15:31.7700000' AS DateTime2))
GO
INSERT [dbo].[product_variants] ([id], [product_id], [size_id], [color_id], [stock_quantity], [last_restock_date]) VALUES (254, 32, 105, 77, 55, CAST(N'2025-03-01T04:15:34.3033333' AS DateTime2))
GO
INSERT [dbo].[product_variants] ([id], [product_id], [size_id], [color_id], [stock_quantity], [last_restock_date]) VALUES (255, 32, 106, 77, 38, CAST(N'2025-03-01T04:15:36.9300000' AS DateTime2))
GO
INSERT [dbo].[product_variants] ([id], [product_id], [size_id], [color_id], [stock_quantity], [last_restock_date]) VALUES (256, 32, 107, 77, 30, CAST(N'2025-03-01T04:15:39.3333333' AS DateTime2))
GO
INSERT [dbo].[product_variants] ([id], [product_id], [size_id], [color_id], [stock_quantity], [last_restock_date]) VALUES (257, 32, 103, 78, 37, CAST(N'2025-03-01T05:04:34.5466667' AS DateTime2))
GO
INSERT [dbo].[product_variants] ([id], [product_id], [size_id], [color_id], [stock_quantity], [last_restock_date]) VALUES (258, 32, 104, 78, 53, CAST(N'2025-03-01T05:04:41.9300000' AS DateTime2))
GO
INSERT [dbo].[product_variants] ([id], [product_id], [size_id], [color_id], [stock_quantity], [last_restock_date]) VALUES (259, 32, 105, 78, 50, CAST(N'2025-03-01T05:04:45.7666667' AS DateTime2))
GO
INSERT [dbo].[product_variants] ([id], [product_id], [size_id], [color_id], [stock_quantity], [last_restock_date]) VALUES (260, 32, 106, 78, 35, CAST(N'2025-03-01T05:04:48.6333333' AS DateTime2))
GO
INSERT [dbo].[product_variants] ([id], [product_id], [size_id], [color_id], [stock_quantity], [last_restock_date]) VALUES (261, 32, 107, 78, 25, CAST(N'2025-03-01T05:04:51.2233333' AS DateTime2))
GO
INSERT [dbo].[product_variants] ([id], [product_id], [size_id], [color_id], [stock_quantity], [last_restock_date]) VALUES (262, 32, 103, 79, 35, CAST(N'2025-03-01T04:24:59.3200000' AS DateTime2))
GO
INSERT [dbo].[product_variants] ([id], [product_id], [size_id], [color_id], [stock_quantity], [last_restock_date]) VALUES (263, 32, 104, 79, 50, CAST(N'2025-03-01T04:25:22.7033333' AS DateTime2))
GO
INSERT [dbo].[product_variants] ([id], [product_id], [size_id], [color_id], [stock_quantity], [last_restock_date]) VALUES (264, 32, 105, 79, 45, CAST(N'2025-03-01T04:25:25.0966667' AS DateTime2))
GO
INSERT [dbo].[product_variants] ([id], [product_id], [size_id], [color_id], [stock_quantity], [last_restock_date]) VALUES (265, 32, 106, 79, 30, CAST(N'2025-03-01T04:25:29.8200000' AS DateTime2))
GO
INSERT [dbo].[product_variants] ([id], [product_id], [size_id], [color_id], [stock_quantity], [last_restock_date]) VALUES (266, 32, 107, 79, 20, CAST(N'2025-03-01T04:25:33.5133333' AS DateTime2))
GO
INSERT [dbo].[product_variants] ([id], [product_id], [size_id], [color_id], [stock_quantity], [last_restock_date]) VALUES (268, 32, 107, 81, 1, CAST(N'2025-03-01T04:25:38.7000000' AS DateTime2))
GO
SET IDENTITY_INSERT [dbo].[product_variants] OFF
GO
SET IDENTITY_INSERT [dbo].[cart_items] ON 
GO
INSERT [dbo].[cart_items] ([id], [cart_id], [product_id], [variant_id], [quantity]) VALUES (1, 1, 1, 1, 2)
GO
INSERT [dbo].[cart_items] ([id], [cart_id], [product_id], [variant_id], [quantity]) VALUES (2, 2, 2, 2, 1)
GO
INSERT [dbo].[cart_items] ([id], [cart_id], [product_id], [variant_id], [quantity]) VALUES (3, 3, 3, 3, 1)
GO
INSERT [dbo].[cart_items] ([id], [cart_id], [product_id], [variant_id], [quantity]) VALUES (6, 5, 31, 246, 1)
GO
SET IDENTITY_INSERT [dbo].[cart_items] OFF
GO
SET IDENTITY_INSERT [dbo].[orders] ON 
GO
INSERT [dbo].[orders] ([id], [user_id], [status], [total_amount], [recipient_name], [recipient_email], [recipient_phone], [recipient_address], [shipping_code], [shiping_name], [notes], [created_at], [updated_at]) VALUES (1, 4, N'pending', CAST(1050000.00 AS Decimal(10, 2)), N'Nguyễn Văn A', N'user123@gmail.com', N'0866046581', N'thôn 1, Xã Ngọc Hồi, Huyện Thanh Trì, Thành phố Hà Nội', NULL, NULL, N'ORD1743241428405538', CAST(N'2025-03-29T16:43:48.4100000' AS DateTime2), CAST(N'2025-03-29T16:43:48.4100000' AS DateTime2))
GO
INSERT [dbo].[orders] ([id], [user_id], [status], [total_amount], [recipient_name], [recipient_email], [recipient_phone], [recipient_address], [shipping_code], [shiping_name], [notes], [created_at], [updated_at]) VALUES (2, 4, N'shipping', CAST(711000.00 AS Decimal(10, 2)), N'Nguyễn Văn A', N'user123@gmail.com', N'0866046581', N'thôn 1, Xã Ngọc Hồi, Huyện Thanh Trì, Thành phố Hà Nội', NULL, NULL, N'ORD1743241470259289', CAST(N'2025-03-29T16:44:30.2566667' AS DateTime2), CAST(N'2025-03-29T16:44:48.7100000' AS DateTime2))
GO
INSERT [dbo].[orders] ([id], [user_id], [status], [total_amount], [recipient_name], [recipient_email], [recipient_phone], [recipient_address], [shipping_code], [shiping_name], [notes], [created_at], [updated_at]) VALUES (3, 4, N'processing', CAST(530000.00 AS Decimal(10, 2)), N'Nguyễn Văn A', N'user123@gmail.com', N'0866046581', N'thôn 1, Xã Ngọc Hồi, Huyện Thanh Trì, Thành phố Hà Nội', NULL, NULL, N'ORD1743241514599980', CAST(N'2025-03-29T16:45:14.6000000' AS DateTime2), CAST(N'2025-03-29T16:45:23.3066667' AS DateTime2))
GO
INSERT [dbo].[orders] ([id], [user_id], [status], [total_amount], [recipient_name], [recipient_email], [recipient_phone], [recipient_address], [shipping_code], [shiping_name], [notes], [created_at], [updated_at]) VALUES (4, 4, N'completed', CAST(1300000.00 AS Decimal(10, 2)), N'Nguyễn Văn A', N'user123@gmail.com', N'0866046581', N'thôn 1, Xã Ngọc Hồi, Huyện Thanh Trì, Thành phố Hà Nội', NULL, NULL, N'ORD1743241570395435', CAST(N'2025-03-29T16:46:10.3933333' AS DateTime2), CAST(N'2025-03-29T16:46:57.8066667' AS DateTime2))
GO
INSERT [dbo].[orders] ([id], [user_id], [status], [total_amount], [recipient_name], [recipient_email], [recipient_phone], [recipient_address], [shipping_code], [shiping_name], [notes], [created_at], [updated_at]) VALUES (5, 4, N'returned', CAST(225000.00 AS Decimal(10, 2)), N'Nguyễn Văn A', N'user123@gmail.com', N'0866046581', N'thôn 1, Xã Ngọc Hồi, Huyện Thanh Trì, Thành phố Hà Nội', NULL, NULL, N'ORD1743241646245155', CAST(N'2025-03-29T16:47:26.2466667' AS DateTime2), CAST(N'2025-03-29T16:47:58.3800000' AS DateTime2))
GO
INSERT [dbo].[orders] ([id], [user_id], [status], [total_amount], [recipient_name], [recipient_email], [recipient_phone], [recipient_address], [shipping_code], [shiping_name], [notes], [created_at], [updated_at]) VALUES (6, 4, N'completed', CAST(252000.00 AS Decimal(10, 2)), N'Nguyễn Văn A', N'user123@gmail.com', N'0866046581', N'thôn 1, Xã Ngọc Hồi, Huyện Thanh Trì, Thành phố Hà Nội', NULL, NULL, N'ORD1743241725948883', CAST(N'2025-03-29T16:48:45.9466667' AS DateTime2), CAST(N'2025-03-29T16:49:21.6766667' AS DateTime2))
GO
INSERT [dbo].[orders] ([id], [user_id], [status], [total_amount], [recipient_name], [recipient_email], [recipient_phone], [recipient_address], [shipping_code], [shiping_name], [notes], [created_at], [updated_at]) VALUES (7, 4, N'completed', CAST(510000.00 AS Decimal(10, 2)), N'Nguyễn Thi B', N'user123@gmail.com', N'0866046585', N'thôn 4, Phường Duyệt Trung, Thành phố Cao Bằng, Tỉnh Cao Bằng', NULL, NULL, N'ORD1743241840947177', CAST(N'2025-03-29T16:50:40.9466667' AS DateTime2), CAST(N'2025-03-29T16:51:17.9600000' AS DateTime2))
GO
INSERT [dbo].[orders] ([id], [user_id], [status], [total_amount], [recipient_name], [recipient_email], [recipient_phone], [recipient_address], [shipping_code], [shiping_name], [notes], [created_at], [updated_at]) VALUES (8, 4, N'completed', CAST(830000.00 AS Decimal(10, 2)), N'Nguyễn Văn C', N'user123@gmail.com', N'0961004959', N'thôn 5, Xã Mông Ân, Huyện Bảo Lâm, Tỉnh Cao Bằng', NULL, NULL, N'ORD1743241990370593', CAST(N'2025-03-29T16:53:10.3700000' AS DateTime2), CAST(N'2025-03-29T16:53:57.3333333' AS DateTime2))
GO
INSERT [dbo].[orders] ([id], [user_id], [status], [total_amount], [recipient_name], [recipient_email], [recipient_phone], [recipient_address], [shipping_code], [shiping_name], [notes], [created_at], [updated_at]) VALUES (9, 6, N'completed', CAST(1430000.00 AS Decimal(10, 2)), N'Nguyen Hanh Nhan', N'user321@gmail.com', N'0866046598', N'thôn 6, Xã Mông Ân, Huyện Bảo Lâm, Tỉnh Cao Bằng', NULL, NULL, N'ORD1743242141730751', CAST(N'2025-03-29T16:55:41.7300000' AS DateTime2), CAST(N'2025-03-29T16:56:07.8400000' AS DateTime2))
GO
INSERT [dbo].[orders] ([id], [user_id], [status], [total_amount], [recipient_name], [recipient_email], [recipient_phone], [recipient_address], [shipping_code], [shiping_name], [notes], [created_at], [updated_at]) VALUES (10, 6, N'completed', CAST(580000.00 AS Decimal(10, 2)), N'Nguyen Hanh Nhan', N'user321@gmail.com', N'0866046598', N'thôn 6, Xã Mông Ân, Huyện Bảo Lâm, Tỉnh Cao Bằng', NULL, NULL, N'ORD1743242411259913', CAST(N'2025-03-29T17:00:11.2600000' AS DateTime2), CAST(N'2025-03-29T17:01:10.2233333' AS DateTime2))
GO
INSERT [dbo].[orders] ([id], [user_id], [status], [total_amount], [recipient_name], [recipient_email], [recipient_phone], [recipient_address], [shipping_code], [shiping_name], [notes], [created_at], [updated_at]) VALUES (11, 6, N'pending', CAST(180000.00 AS Decimal(10, 2)), N'Nguyen Hanh Nhan', N'user321@gmail.com', N'0866046598', N'thôn 6, Xã Mông Ân, Huyện Bảo Lâm, Tỉnh Cao Bằng', NULL, NULL, N'ORD1743242501646465', CAST(N'2025-03-29T17:01:41.6466667' AS DateTime2), CAST(N'2025-03-29T17:01:41.6466667' AS DateTime2))
GO
INSERT [dbo].[orders] ([id], [user_id], [status], [total_amount], [recipient_name], [recipient_email], [recipient_phone], [recipient_address], [shipping_code], [shiping_name], [notes], [created_at], [updated_at]) VALUES (12, 6, N'processing', CAST(260000.00 AS Decimal(10, 2)), N'Nguyen Hanh Nhan', N'user321@gmail.com', N'0866046598', N'thôn 6, Xã Mông Ân, Huyện Bảo Lâm, Tỉnh Cao Bằng', NULL, NULL, N'ORD1743242522880742', CAST(N'2025-03-29T17:02:02.8800000' AS DateTime2), CAST(N'2025-03-29T17:02:13.7933333' AS DateTime2))
GO
INSERT [dbo].[orders] ([id], [user_id], [status], [total_amount], [recipient_name], [recipient_email], [recipient_phone], [recipient_address], [shipping_code], [shiping_name], [notes], [created_at], [updated_at]) VALUES (13, 8, N'completed', CAST(1380000.00 AS Decimal(10, 2)), N'Nguyen Van Anh', N'Medusa@gmail.com', N'0866046585', N'thôn 4, Phường Trần Phú, Thành phố Hà Giang, Tỉnh Hà Giang', NULL, NULL, N'ORD1743242625696490', CAST(N'2025-03-29T17:03:45.6933333' AS DateTime2), CAST(N'2025-03-29T17:04:09.4933333' AS DateTime2))
GO
INSERT [dbo].[orders] ([id], [user_id], [status], [total_amount], [recipient_name], [recipient_email], [recipient_phone], [recipient_address], [shipping_code], [shiping_name], [notes], [created_at], [updated_at]) VALUES (14, 8, N'shipping', CAST(180000.00 AS Decimal(10, 2)), N'Nguyen Van Anh', N'Medusa@gmail.com', N'0866046585', N'thôn 4, Phường Trần Phú, Thành phố Hà Giang, Tỉnh Hà Giang', NULL, NULL, N'ORD1743242680246480', CAST(N'2025-03-29T17:04:40.2466667' AS DateTime2), CAST(N'2025-03-29T17:04:59.4266667' AS DateTime2))
GO
INSERT [dbo].[orders] ([id], [user_id], [status], [total_amount], [recipient_name], [recipient_email], [recipient_phone], [recipient_address], [shipping_code], [shiping_name], [notes], [created_at], [updated_at]) VALUES (15, 8, N'cancelled', CAST(445000.00 AS Decimal(10, 2)), N'Nguyen Van Anh', N'Medusa@gmail.com', N'0866046585', N'thôn 4, Phường Trần Phú, Thành phố Hà Giang, Tỉnh Hà Giang', NULL, NULL, N'ORD1743242748011878', CAST(N'2025-03-29T17:05:48.0100000' AS DateTime2), CAST(N'2025-03-29T17:06:00.9800000' AS DateTime2))
GO
INSERT [dbo].[orders] ([id], [user_id], [status], [total_amount], [recipient_name], [recipient_email], [recipient_phone], [recipient_address], [shipping_code], [shiping_name], [notes], [created_at], [updated_at]) VALUES (16, 8, N'returned', CAST(295000.00 AS Decimal(10, 2)), N'Nguyen Van Anh', N'Medusa@gmail.com', N'0866046585', N'thôn 4, Phường Trần Phú, Thành phố Hà Giang, Tỉnh Hà Giang', NULL, NULL, N'ORD1743242790299989', CAST(N'2025-03-29T17:06:30.3000000' AS DateTime2), CAST(N'2025-03-29T17:06:52.3733333' AS DateTime2))
GO
INSERT [dbo].[orders] ([id], [user_id], [status], [total_amount], [recipient_name], [recipient_email], [recipient_phone], [recipient_address], [shipping_code], [shiping_name], [notes], [created_at], [updated_at]) VALUES (17, 12, N'completed', CAST(900000.00 AS Decimal(10, 2)), N'Nguyen Hong Hanh', N'GuYuan@gmail.com', N'0961004935', N'thôn 5, Xã Quảng Khê, Huyện Ba Bể, Tỉnh Bắc Kạn', NULL, NULL, N'ORD1743242886766576', CAST(N'2025-03-29T17:08:06.7633333' AS DateTime2), CAST(N'2025-03-29T17:08:40.9600000' AS DateTime2))
GO
INSERT [dbo].[orders] ([id], [user_id], [status], [total_amount], [recipient_name], [recipient_email], [recipient_phone], [recipient_address], [shipping_code], [shiping_name], [notes], [created_at], [updated_at]) VALUES (18, 12, N'completed', CAST(3230000.00 AS Decimal(10, 2)), N'Nguyen Hong Hanh', N'GuYuan@gmail.com', N'0961004935', N'thôn 5, Xã Quảng Khê, Huyện Ba Bể, Tỉnh Bắc Kạn', NULL, NULL, N'ORD1743243013931542', CAST(N'2025-03-29T17:10:13.9300000' AS DateTime2), CAST(N'2025-03-29T17:10:40.6600000' AS DateTime2))
GO
INSERT [dbo].[orders] ([id], [user_id], [status], [total_amount], [recipient_name], [recipient_email], [recipient_phone], [recipient_address], [shipping_code], [shiping_name], [notes], [created_at], [updated_at]) VALUES (19, 12, N'cancelled', CAST(550000.00 AS Decimal(10, 2)), N'Nguyen Hong Hanh', N'GuYuan@gmail.com', N'0961004935', N'thôn 5, Xã Quảng Khê, Huyện Ba Bể, Tỉnh Bắc Kạn', NULL, NULL, N'ORD1743243064277146', CAST(N'2025-03-29T17:11:04.2766667' AS DateTime2), CAST(N'2025-03-29T17:11:08.6900000' AS DateTime2))
GO
INSERT [dbo].[orders] ([id], [user_id], [status], [total_amount], [recipient_name], [recipient_email], [recipient_phone], [recipient_address], [shipping_code], [shiping_name], [notes], [created_at], [updated_at]) VALUES (20, 7, N'completed', CAST(578000.00 AS Decimal(10, 2)), N'Nguyễn Thi D', N'XiaoDing@gmail.com', N'0866046543', N'thôn 3, Phường Ngọc Hà, Thành phố Hà Giang, Tỉnh Hà Giang', NULL, NULL, N'ORD1743245078046293', CAST(N'2025-03-29T17:44:38.0466667' AS DateTime2), CAST(N'2025-03-29T17:45:39.6066667' AS DateTime2))
GO
INSERT [dbo].[orders] ([id], [user_id], [status], [total_amount], [recipient_name], [recipient_email], [recipient_phone], [recipient_address], [shipping_code], [shiping_name], [notes], [created_at], [updated_at]) VALUES (21, 7, N'completed', CAST(1770000.00 AS Decimal(10, 2)), N'Nguyễn Thi D', N'XiaoDing@gmail.com', N'0866046543', N'thôn 3, Phường Ngọc Hà, Thành phố Hà Giang, Tỉnh Hà Giang', NULL, NULL, N'ORD1743245281309826', CAST(N'2025-03-29T17:48:01.3066667' AS DateTime2), CAST(N'2025-03-29T17:48:29.0633333' AS DateTime2))
GO
INSERT [dbo].[orders] ([id], [user_id], [status], [total_amount], [recipient_name], [recipient_email], [recipient_phone], [recipient_address], [shipping_code], [shiping_name], [notes], [created_at], [updated_at]) VALUES (22, 6, N'completed', CAST(268000.00 AS Decimal(10, 2)), N'Nguyen Hanh Nhan', N'user321@gmail.com', N'0866046598', N'thôn 6, Xã Mông Ân, Huyện Bảo Lâm, Tỉnh Cao Bằng', NULL, NULL, N'ORD174324554941174', CAST(N'2025-03-29T17:52:29.4100000' AS DateTime2), CAST(N'2025-03-29T17:52:50.5066667' AS DateTime2))
GO
INSERT [dbo].[orders] ([id], [user_id], [status], [total_amount], [recipient_name], [recipient_email], [recipient_phone], [recipient_address], [shipping_code], [shiping_name], [notes], [created_at], [updated_at]) VALUES (23, 4, N'pending_pay', CAST(480000.00 AS Decimal(10, 2)), N'Nguyễn Văn A', N'user123@gmail.com', N'0866046581', N'thôn 1, Xã Ngọc Hồi, Huyện Thanh Trì, Thành phố Hà Nội', NULL, NULL, N'ORD17432534094115', CAST(N'2025-03-29T20:03:29.4166667' AS DateTime2), CAST(N'2025-03-29T20:03:29.4766667' AS DateTime2))
GO
INSERT [dbo].[orders] ([id], [user_id], [status], [total_amount], [recipient_name], [recipient_email], [recipient_phone], [recipient_address], [shipping_code], [shiping_name], [notes], [created_at], [updated_at]) VALUES (24, 4, N'processing', CAST(225000.00 AS Decimal(10, 2)), N'Nguyễn Văn C', N'user123@gmail.com', N'0961004959', N'thôn 5, Xã Mông Ân, Huyện Bảo Lâm, Tỉnh Cao Bằng', NULL, NULL, N'ORD1743253488997649', CAST(N'2025-03-29T20:04:48.9966667' AS DateTime2), CAST(N'2025-03-29T20:04:49.0233333' AS DateTime2))
GO
INSERT [dbo].[orders] ([id], [user_id], [status], [total_amount], [recipient_name], [recipient_email], [recipient_phone], [recipient_address], [shipping_code], [shiping_name], [notes], [created_at], [updated_at]) VALUES (25, 4, N'completed', CAST(237000.00 AS Decimal(10, 2)), N'Nguyễn Văn C', N'user123@gmail.com', N'0961004959', N'thôn 5, Xã Mông Ân, Huyện Bảo Lâm, Tỉnh Cao Bằng', NULL, NULL, N'ORD1743253560350921', CAST(N'2025-03-29T20:06:00.3500000' AS DateTime2), CAST(N'2025-03-29T20:06:27.8500000' AS DateTime2))
GO
INSERT [dbo].[orders] ([id], [user_id], [status], [total_amount], [recipient_name], [recipient_email], [recipient_phone], [recipient_address], [shipping_code], [shiping_name], [notes], [created_at], [updated_at]) VALUES (26, 4, N'returned', CAST(180000.00 AS Decimal(10, 2)), N'Nguyễn Thi B', N'user123@gmail.com', N'0866046585', N'thôn 4, Phường Duyệt Trung, Thành phố Cao Bằng, Tỉnh Cao Bằng', NULL, NULL, N'ORD1743253679026823', CAST(N'2025-03-29T20:07:59.0233333' AS DateTime2), CAST(N'2025-03-29T20:08:25.3466667' AS DateTime2))
GO
SET IDENTITY_INSERT [dbo].[orders] OFF
GO
SET IDENTITY_INSERT [dbo].[order_items] ON 
GO
INSERT [dbo].[order_items] ([id], [order_id], [product_id], [product_name], [product_image], [variant_name], [quantity], [unit_price_at_order]) VALUES (1, 1, 32, N'Quần kaki nam', N'https://vulcano.sgp1.digitaloceanspaces.com/media/18894/quan-khaki-3001t-vulcano01.webp', N'28 - Xanh navy', 3, CAST(350000.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[order_items] ([id], [order_id], [product_id], [product_name], [product_image], [variant_name], [quantity], [unit_price_at_order]) VALUES (2, 1, 29, N'Áo thun trẻ em hoạt hình', N'https://product.hstatic.net/1000387570/product/ao_sieu_nhan_dai_tay_be_trai_xanh_1_29b6db9d6dab4e649d6d1528a1cef68d_master.jpg', N'2-4 - Trắng họa tiết', 1, CAST(150000.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[order_items] ([id], [order_id], [product_id], [product_name], [product_image], [variant_name], [quantity], [unit_price_at_order]) VALUES (3, 2, 11, N'Quần short siêu nhân', N'https://img.alicdn.com/imgextra/i3/350427093/O1CN01JDrMyz22GdnbaZ9Y6_!!350427093.jpg_600x600.jpg_.webp', N'2-4 - Xanh', 1, CAST(550000.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[order_items] ([id], [order_id], [product_id], [product_name], [product_image], [variant_name], [quantity], [unit_price_at_order]) VALUES (4, 2, 6, N'Quần short cotton', N'https://ardilla.com.vn/wp-content/uploads/2022/03/TB1601QST.jpg', N'2-4 - Xanh navy', 2, CAST(120000.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[order_items] ([id], [order_id], [product_id], [product_name], [product_image], [variant_name], [quantity], [unit_price_at_order]) VALUES (5, 3, 14, N'Quần jogger thể thao', N'https://thegioidotap.vn/wp-content/uploads/2020/12/quan-dai-the-thao-nam-jogger-sg10-3.jpg', N'S - Xám', 2, CAST(250000.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[order_items] ([id], [order_id], [product_id], [product_name], [product_image], [variant_name], [quantity], [unit_price_at_order]) VALUES (6, 4, 10, N'Giày sneaker', N'https://bizweb.dktcdn.net/thumb/large/100/041/044/products/48f5343d-9f9a-4ed2-aa02-de2ad1f4fabc-jpeg.jpg?v=1694597357733', N'39 - Đen', 2, CAST(400000.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[order_items] ([id], [order_id], [product_id], [product_name], [product_image], [variant_name], [quantity], [unit_price_at_order]) VALUES (7, 4, 9, N'Giày thể thao', N'https://img.mwc.com.vn/giay-thoi-trang?w=480&h=510&FileInput=/Resources/Product/2024/09/22/z5855779313414_2914371405362ca7f474791328971969.jpg', N'39 - Trắng', 1, CAST(500000.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[order_items] ([id], [order_id], [product_id], [product_name], [product_image], [variant_name], [quantity], [unit_price_at_order]) VALUES (8, 5, 28, N'Dép lào nam cao cấp', N'https://cf.shopee.vn/file/c6d1c6eb69fc0f5b382006d61baf5856', N'39 - Nâu', 1, CAST(180000.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[order_items] ([id], [order_id], [product_id], [product_name], [product_image], [variant_name], [quantity], [unit_price_at_order]) VALUES (9, 6, 30, N'Nhẫn bạc đính đá zircon', N'https://lili.vn/wp-content/uploads/2021/08/Nhan-bac-dinh-da-Zircon-Royal-LILI_499436_2.jpg', N'6 - Bạc', 1, CAST(230000.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[order_items] ([id], [order_id], [product_id], [product_name], [product_image], [variant_name], [quantity], [unit_price_at_order]) VALUES (10, 7, 31, N'Chân váy xếp ly dáng ngắn', N'https://down-vn.img.susercontent.com/file/55791d774c509649738b1bb8aba06a7d', N'S - Xám', 2, CAST(280000.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[order_items] ([id], [order_id], [product_id], [product_name], [product_image], [variant_name], [quantity], [unit_price_at_order]) VALUES (11, 8, 12, N'Áo sơ mi xanh', N'https://pos.nvncdn.com/a36e05-151378/ps/20230712_TkKQqMtkUO.jpeg', N'L - Xanh', 2, CAST(200000.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[order_items] ([id], [order_id], [product_id], [product_name], [product_image], [variant_name], [quantity], [unit_price_at_order]) VALUES (12, 8, 22, N'Áo sơ mi nam kẻ sọc', N'https://aoxuanhe.com/upload/product/axh-111/ao-so-mi-nam-ke-soc-xanh-duong-1.jpg', N'M - Trắng sọc đen', 1, CAST(280000.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[order_items] ([id], [order_id], [product_id], [product_name], [product_image], [variant_name], [quantity], [unit_price_at_order]) VALUES (13, 8, 1, N'Áo sơ mi trắng', N'https://product.hstatic.net/1000333436/product/tx_03696_da789ffaa68d42d3b2ad129b099e15ae_master.jpg', N'M - Xanh nhạt', 2, CAST(200000.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[order_items] ([id], [order_id], [product_id], [product_name], [product_image], [variant_name], [quantity], [unit_price_at_order]) VALUES (14, 9, 32, N'Quần kaki nam', N'https://vulcano.sgp1.digitaloceanspaces.com/media/18894/quan-khaki-3001t-vulcano01.webp', N'30 - Xanh navy', 2, CAST(350000.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[order_items] ([id], [order_id], [product_id], [product_name], [product_image], [variant_name], [quantity], [unit_price_at_order]) VALUES (15, 9, 31, N'Chân váy xếp ly dáng ngắn', N'https://down-vn.img.susercontent.com/file/55791d774c509649738b1bb8aba06a7d', N'M - Xám', 1, CAST(280000.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[order_items] ([id], [order_id], [product_id], [product_name], [product_image], [variant_name], [quantity], [unit_price_at_order]) VALUES (16, 9, 4, N'Chân váy denim', N'https://down-vn.img.susercontent.com/file/vn-11134207-7r98o-luaj8uf2in1bf1', N'L - Xanh đậm', 1, CAST(250000.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[order_items] ([id], [order_id], [product_id], [product_name], [product_image], [variant_name], [quantity], [unit_price_at_order]) VALUES (17, 9, 25, N'Túi đeo chéo nữ mini', N'https://image.kacana.vn/images/product/tui-cheo-dung-dien-thoai-va-tien-you-2811-1720436440.jpg', N'Onesize - Đen', 1, CAST(250000.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[order_items] ([id], [order_id], [product_id], [product_name], [product_image], [variant_name], [quantity], [unit_price_at_order]) VALUES (18, 10, 3, N'Đầm hoa mùa hè', N'https://file.hstatic.net/200000503583/file/vay-hoa-mua-he__11__c2791afbbda941238c114b00b403ec57.jpg', N'M - Hoa đỏ', 1, CAST(400000.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[order_items] ([id], [order_id], [product_id], [product_name], [product_image], [variant_name], [quantity], [unit_price_at_order]) VALUES (19, 10, 28, N'Dép lào nam cao cấp', N'https://cf.shopee.vn/file/c6d1c6eb69fc0f5b382006d61baf5856', N'39 - Đen', 1, CAST(180000.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[order_items] ([id], [order_id], [product_id], [product_name], [product_image], [variant_name], [quantity], [unit_price_at_order]) VALUES (20, 11, 29, N'Áo thun trẻ em hoạt hình', N'https://product.hstatic.net/1000387570/product/ao_sieu_nhan_dai_tay_be_trai_xanh_1_29b6db9d6dab4e649d6d1528a1cef68d_master.jpg', N'2-4 - Xanh da trời họa tiết', 1, CAST(150000.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[order_items] ([id], [order_id], [product_id], [product_name], [product_image], [variant_name], [quantity], [unit_price_at_order]) VALUES (21, 12, 30, N'Nhẫn bạc đính đá zircon', N'https://lili.vn/wp-content/uploads/2021/08/Nhan-bac-dinh-da-Zircon-Royal-LILI_499436_2.jpg', N'5 - Bạc', 1, CAST(230000.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[order_items] ([id], [order_id], [product_id], [product_name], [product_image], [variant_name], [quantity], [unit_price_at_order]) VALUES (22, 13, 14, N'Quần jogger thể thao', N'https://thegioidotap.vn/wp-content/uploads/2020/12/quan-dai-the-thao-nam-jogger-sg10-3.jpg', N'M - Xám', 2, CAST(250000.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[order_items] ([id], [order_id], [product_id], [product_name], [product_image], [variant_name], [quantity], [unit_price_at_order]) VALUES (23, 13, 32, N'Quần kaki nam', N'https://vulcano.sgp1.digitaloceanspaces.com/media/18894/quan-khaki-3001t-vulcano01.webp', N'34 - Be', 2, CAST(350000.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[order_items] ([id], [order_id], [product_id], [product_name], [product_image], [variant_name], [quantity], [unit_price_at_order]) VALUES (24, 13, 28, N'Dép lào nam cao cấp', N'https://cf.shopee.vn/file/c6d1c6eb69fc0f5b382006d61baf5856', N'40 - Nâu', 1, CAST(180000.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[order_items] ([id], [order_id], [product_id], [product_name], [product_image], [variant_name], [quantity], [unit_price_at_order]) VALUES (25, 14, 5, N'Áo thun siêu nhân', N'https://target.scene7.com/is/image/Target/GUEST_1079d260-d8e2-4d6e-b757-7dd7254ddda5?wid=800&hei=800&qlt=80&fmt=webp', N'2-4 - Xanh', 1, CAST(150000.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[order_items] ([id], [order_id], [product_id], [product_name], [product_image], [variant_name], [quantity], [unit_price_at_order]) VALUES (26, 15, 15, N'Đầm maxi hoa nhí', N'https://vayfashion.com/wp-content/uploads/2022/05/2c7cf97edbac2d98f120bf85c824f1aa.jpg', N'S - Hồng họa tiết hoa trắng', 1, CAST(420000.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[order_items] ([id], [order_id], [product_id], [product_name], [product_image], [variant_name], [quantity], [unit_price_at_order]) VALUES (27, 16, 25, N'Túi đeo chéo nữ mini', N'https://image.kacana.vn/images/product/tui-cheo-dung-dien-thoai-va-tien-you-2811-1720436440.jpg', N'Onesize - Đen', 1, CAST(250000.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[order_items] ([id], [order_id], [product_id], [product_name], [product_image], [variant_name], [quantity], [unit_price_at_order]) VALUES (28, 17, 29, N'Áo thun trẻ em hoạt hình', N'https://product.hstatic.net/1000387570/product/ao_sieu_nhan_dai_tay_be_trai_xanh_1_29b6db9d6dab4e649d6d1528a1cef68d_master.jpg', N'2-4 - Xanh da trời họa tiết', 4, CAST(150000.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[order_items] ([id], [order_id], [product_id], [product_name], [product_image], [variant_name], [quantity], [unit_price_at_order]) VALUES (29, 17, 5, N'Áo thun siêu nhân', N'https://target.scene7.com/is/image/Target/GUEST_1079d260-d8e2-4d6e-b757-7dd7254ddda5?wid=800&hei=800&qlt=80&fmt=webp', N'4-6 - Đỏ', 2, CAST(150000.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[order_items] ([id], [order_id], [product_id], [product_name], [product_image], [variant_name], [quantity], [unit_price_at_order]) VALUES (30, 18, 2, N'Quần tây đen', N'https://product.hstatic.net/200000053174/product/20_bddc67b2b01a4fc6a89b6d5ca1e78b33_master.jpg', N'M - Đen', 3, CAST(300000.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[order_items] ([id], [order_id], [product_id], [product_name], [product_image], [variant_name], [quantity], [unit_price_at_order]) VALUES (31, 18, 3, N'Đầm hoa mùa hè', N'https://file.hstatic.net/200000503583/file/vay-hoa-mua-he__11__c2791afbbda941238c114b00b403ec57.jpg', N'S - Hoa đỏ', 4, CAST(400000.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[order_items] ([id], [order_id], [product_id], [product_name], [product_image], [variant_name], [quantity], [unit_price_at_order]) VALUES (32, 18, 31, N'Chân váy xếp ly dáng ngắn', N'https://down-vn.img.susercontent.com/file/55791d774c509649738b1bb8aba06a7d', N'M - Xám', 1, CAST(280000.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[order_items] ([id], [order_id], [product_id], [product_name], [product_image], [variant_name], [quantity], [unit_price_at_order]) VALUES (33, 18, 4, N'Chân váy denim', N'https://down-vn.img.susercontent.com/file/vn-11134207-7r98o-luaj8uf2in1bf1', N'M - Đen', 1, CAST(250000.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[order_items] ([id], [order_id], [product_id], [product_name], [product_image], [variant_name], [quantity], [unit_price_at_order]) VALUES (34, 18, 1, N'Áo sơ mi trắng', N'https://product.hstatic.net/1000333436/product/tx_03696_da789ffaa68d42d3b2ad129b099e15ae_master.jpg', N'M - Trắng', 1, CAST(200000.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[order_items] ([id], [order_id], [product_id], [product_name], [product_image], [variant_name], [quantity], [unit_price_at_order]) VALUES (35, 19, 11, N'Quần short siêu nhân', N'https://img.alicdn.com/imgextra/i3/350427093/O1CN01JDrMyz22GdnbaZ9Y6_!!350427093.jpg_600x600.jpg_.webp', N'2-4 - Xanh', 1, CAST(550000.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[order_items] ([id], [order_id], [product_id], [product_name], [product_image], [variant_name], [quantity], [unit_price_at_order]) VALUES (36, 20, 31, N'Chân váy xếp ly dáng ngắn', N'https://down-vn.img.susercontent.com/file/55791d774c509649738b1bb8aba06a7d', N'S - Đen', 1, CAST(280000.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[order_items] ([id], [order_id], [product_id], [product_name], [product_image], [variant_name], [quantity], [unit_price_at_order]) VALUES (37, 20, 4, N'Chân váy denim', N'https://down-vn.img.susercontent.com/file/vn-11134207-7r98o-luaj8uf2in1bf1', N'M - Xanh đậm', 1, CAST(250000.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[order_items] ([id], [order_id], [product_id], [product_name], [product_image], [variant_name], [quantity], [unit_price_at_order]) VALUES (38, 20, 26, N'Bông tai bạc hình giọt nước', N'https://lili.vn/wp-content/uploads/2021/12/Bong-tai-bac-nu-ma-bach-kim-dinh-da-CZ-hinh-giot-nuoc-LILI_416496_13.jpg', N'Onesize - Bạc', 1, CAST(150000.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[order_items] ([id], [order_id], [product_id], [product_name], [product_image], [variant_name], [quantity], [unit_price_at_order]) VALUES (39, 21, 13, N'Áo khoác bomber nam', N'https://ginstore.com.vn/files/sanpham/1885/1/png/ao-khoac-bomber-local-brand-rg-butterfly-varsity-jacket-nam-nu-tay-da-vasity-bong-chay-form-rong-unisex.png', N'S - Đen', 1, CAST(450000.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[order_items] ([id], [order_id], [product_id], [product_name], [product_image], [variant_name], [quantity], [unit_price_at_order]) VALUES (40, 21, 17, N'Váy công chúa cho bé gái', N'https://tutupetti.com/wp-content/uploads/2023/07/dam_dep_cho_be_du_tiec_04.jpg', N'4-6 - Hồng pastel', 1, CAST(320000.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[order_items] ([id], [order_id], [product_id], [product_name], [product_image], [variant_name], [quantity], [unit_price_at_order]) VALUES (41, 21, 15, N'Đầm maxi hoa nhí', N'https://vayfashion.com/wp-content/uploads/2022/05/2c7cf97edbac2d98f120bf85c824f1aa.jpg', N'S - Trắng họa tiết hoa xanh', 1, CAST(420000.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[order_items] ([id], [order_id], [product_id], [product_name], [product_image], [variant_name], [quantity], [unit_price_at_order]) VALUES (42, 21, 21, N'Kính mát thời trang', N'https://hoyahc.vn/wp-content/uploads/2022/01/kinh-redex-kinh-mat.jpg', N'Onesize - Đen', 1, CAST(200000.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[order_items] ([id], [order_id], [product_id], [product_name], [product_image], [variant_name], [quantity], [unit_price_at_order]) VALUES (43, 21, 19, N'Dây chuyền bạc nữ', N'https://pos.nvncdn.com/211f76-106986/ps/20240805_RdCu2zj3rc.jpeg', N'40cm - Bạc', 1, CAST(250000.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[order_items] ([id], [order_id], [product_id], [product_name], [product_image], [variant_name], [quantity], [unit_price_at_order]) VALUES (44, 21, 20, N'Giày cao gót nữ', N'https://img.mwc.com.vn/giay-thoi-trang?w=480&h=510&FileInput=/Resources/Product/2024/09/20/z5850479583248_27cb755c82bd913bc95a09019f771777.jpg', N'35 - Kem', 1, CAST(380000.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[order_items] ([id], [order_id], [product_id], [product_name], [product_image], [variant_name], [quantity], [unit_price_at_order]) VALUES (45, 22, 22, N'Áo sơ mi nam kẻ sọc', N'https://aoxuanhe.com/upload/product/axh-111/ao-so-mi-nam-ke-soc-xanh-duong-1.jpg', N'S - Xanh nhạt sọc trắng', 1, CAST(280000.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[order_items] ([id], [order_id], [product_id], [product_name], [product_image], [variant_name], [quantity], [unit_price_at_order]) VALUES (46, 23, 31, N'Chân váy xếp ly dáng ngắn', N'https://down-vn.img.susercontent.com/file/55791d774c509649738b1bb8aba06a7d', N'S - Đen', 1, CAST(280000.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[order_items] ([id], [order_id], [product_id], [product_name], [product_image], [variant_name], [quantity], [unit_price_at_order]) VALUES (47, 23, 30, N'Nhẫn bạc đính đá zircon', N'https://lili.vn/wp-content/uploads/2021/08/Nhan-bac-dinh-da-Zircon-Royal-LILI_499436_2.jpg', N'5 - Bạc', 1, CAST(230000.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[order_items] ([id], [order_id], [product_id], [product_name], [product_image], [variant_name], [quantity], [unit_price_at_order]) VALUES (48, 24, 16, N'Áo thun unisex', N'https://sure.vn/wp-content/uploads/2024/08/7-1-scaled.jpg', N'S - Trắng', 1, CAST(180000.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[order_items] ([id], [order_id], [product_id], [product_name], [product_image], [variant_name], [quantity], [unit_price_at_order]) VALUES (49, 25, 30, N'Nhẫn bạc đính đá zircon', N'https://lili.vn/wp-content/uploads/2021/08/Nhan-bac-dinh-da-Zircon-Royal-LILI_499436_2.jpg', N'5 - Vàng hồng', 1, CAST(230000.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[order_items] ([id], [order_id], [product_id], [product_name], [product_image], [variant_name], [quantity], [unit_price_at_order]) VALUES (50, 26, 29, N'Áo thun trẻ em hoạt hình', N'https://product.hstatic.net/1000387570/product/ao_sieu_nhan_dai_tay_be_trai_xanh_1_29b6db9d6dab4e649d6d1528a1cef68d_master.jpg', N'4-6 - Trắng họa tiết', 1, CAST(150000.00 AS Decimal(10, 2)))
GO
SET IDENTITY_INSERT [dbo].[order_items] OFF
GO
SET IDENTITY_INSERT [dbo].[feedback] ON 
GO
INSERT [dbo].[feedback] ([id], [order_item_id], [user_id], [rating], [comment], [status], [created_at], [updated_at]) VALUES (1, 30, 12, 5, N'Quần tây đen chất lượng rất tốt, vải dày dặn nhưng vẫn thoáng mát, không bị nhăn nhiều. Form quần chuẩn, lên dáng đẹp, rất phù hợp để đi làm hoặc đi tiệc. Giao hàng nhanh, đóng gói cẩn thận. Mình sẽ tiếp tục ủng hộ shop!', N'approved', CAST(N'2025-03-29T17:22:11.5233333' AS DateTime2), CAST(N'2025-03-29T17:54:40.1633333' AS DateTime2))
GO
INSERT [dbo].[feedback] ([id], [order_item_id], [user_id], [rating], [comment], [status], [created_at], [updated_at]) VALUES (2, 31, 12, 4, N'Váy đẹp, đường may chắc chắn, chất vải mịn. Tuy nhiên, mình đặt size hơi chật một chút, lần sau mình sẽ chọn size lớn hơn. Nhìn chung rất đáng mua!', N'approved', CAST(N'2025-03-29T17:22:11.5433333' AS DateTime2), CAST(N'2025-03-29T17:56:39.7266667' AS DateTime2))
GO
INSERT [dbo].[feedback] ([id], [order_item_id], [user_id], [rating], [comment], [status], [created_at], [updated_at]) VALUES (3, 32, 12, 3, N'Váy đẹp, chất vải mềm mịn, đường may chắc chắn. Tuy nhiên, phần lưng hơi rộng so với dáng người mình, phải bóp lại một chút. Nhưng tổng thể vẫn rất đáng mua!', N'approved', CAST(N'2025-03-29T17:22:11.5500000' AS DateTime2), CAST(N'2025-03-29T17:56:51.6433333' AS DateTime2))
GO
INSERT [dbo].[feedback] ([id], [order_item_id], [user_id], [rating], [comment], [status], [created_at], [updated_at]) VALUES (4, 33, 12, 2, N'Chân váy denim có form đẹp nhưng chất vải cứng và hơi thô, mặc không thoải mái lắm. Mình đặt size S nhưng phần eo hơi rộng, phải chỉnh lại. Giao hàng khá lâu so với dự kiến. Hy vọng shop cải thiện chất lượng và dịch vụ!', N'approved', CAST(N'2025-03-29T17:22:11.5566667' AS DateTime2), CAST(N'2025-03-29T17:56:47.4100000' AS DateTime2))
GO
INSERT [dbo].[feedback] ([id], [order_item_id], [user_id], [rating], [comment], [status], [created_at], [updated_at]) VALUES (5, 34, 12, 5, N'Áo sơ mi trắng đẹp xuất sắc! Chất vải mềm, mịn, không quá mỏng, mặc rất thoải mái. Form áo chuẩn, lên dáng thanh lịch, phù hợp cả đi làm và đi chơi. Giao hàng nhanh, đóng gói cẩn thận. Rất hài lòng, sẽ ủng hộ shop lần sau!', N'approved', CAST(N'2025-03-29T17:22:11.5600000' AS DateTime2), CAST(N'2025-03-29T17:56:43.9533333' AS DateTime2))
GO
INSERT [dbo].[feedback] ([id], [order_item_id], [user_id], [rating], [comment], [status], [created_at], [updated_at]) VALUES (6, 28, 12, 5, N'Áo thun cho bé siêu dễ thương! Chất vải mềm mịn, co giãn tốt, thấm hút mồ hôi nên bé mặc rất thoải mái. Hình in sắc nét, không bị bong tróc sau khi giặt. Giao hàng nhanh, đóng gói cẩn thận. Rất hài lòng, sẽ mua thêm mẫu khác cho bé!', N'approved', CAST(N'2025-03-29T17:23:29.9666667' AS DateTime2), CAST(N'2025-03-29T17:54:36.8333333' AS DateTime2))
GO
INSERT [dbo].[feedback] ([id], [order_item_id], [user_id], [rating], [comment], [status], [created_at], [updated_at]) VALUES (7, 29, 12, 3, N'Áo thun siêu nhân thiết kế đẹp, hình in rõ nét nhưng chất vải hơi mỏng so với mong đợi. Sau khi giặt vài lần, màu có hơi phai nhẹ. Giao hàng đúng hẹn, nhưng mong shop cải thiện chất lượng vải hơn!"
', N'approved', CAST(N'2025-03-29T17:23:29.9733333' AS DateTime2), CAST(N'2025-03-29T17:54:31.2766667' AS DateTime2))
GO
INSERT [dbo].[feedback] ([id], [order_item_id], [user_id], [rating], [comment], [status], [created_at], [updated_at]) VALUES (8, 18, 6, 4, N'Đầm hoa thiết kế xinh, họa tiết dễ thương, rất phù hợp cho mùa hè. Tuy nhiên, chất vải hơi mỏng và nhăn nhiều, phải ủi kỹ trước khi mặc. Form váy cũng rộng hơn so với size mình chọn. Giao hàng nhanh, nhưng mong shop cải thiện chất lượng vải hơn!', N'approved', CAST(N'2025-03-29T17:26:23.8400000' AS DateTime2), CAST(N'2025-03-29T17:54:27.4100000' AS DateTime2))
GO
INSERT [dbo].[feedback] ([id], [order_item_id], [user_id], [rating], [comment], [status], [created_at], [updated_at]) VALUES (9, 19, 6, 5, N'Dép rất êm chân, đế dày dặn và bám tốt, đi lâu không bị đau. Chất liệu bền, không có mùi khó chịu. Thiết kế đơn giản nhưng sang trọng, rất đáng tiền. Giao hàng nhanh, đóng gói cẩn thận. Rất hài lòng!', N'approved', CAST(N'2025-03-29T17:26:23.8600000' AS DateTime2), CAST(N'2025-03-29T17:54:23.0566667' AS DateTime2))
GO
INSERT [dbo].[feedback] ([id], [order_item_id], [user_id], [rating], [comment], [status], [created_at], [updated_at]) VALUES (10, 14, 6, 4, N'Quần kaki chất vải tốt, dày dặn nhưng vẫn thoáng mát, mặc khá thoải mái. Form quần chuẩn, đường may chắc chắn. Tuy nhiên, màu sắc thực tế hơi khác so với hình ảnh. Giao hàng nhanh, shop tư vấn nhiệt tình. Nhìn chung rất hài lòng!', N'approved', CAST(N'2025-03-29T17:28:21.6100000' AS DateTime2), CAST(N'2025-03-29T17:54:19.9366667' AS DateTime2))
GO
INSERT [dbo].[feedback] ([id], [order_item_id], [user_id], [rating], [comment], [status], [created_at], [updated_at]) VALUES (11, 15, 6, 3, N'Chân váy có thiết kế xinh, form ổn nhưng chất vải hơi mỏng và dễ nhăn. Đường may chưa thực sự chắc chắn, mặc vài lần có dấu hiệu bung chỉ nhẹ. Giao hàng đúng hẹn. Mong shop cải thiện chất lượng hơn!', N'approved', CAST(N'2025-03-29T17:28:21.6133333' AS DateTime2), CAST(N'2025-03-29T17:54:17.9933333' AS DateTime2))
GO
INSERT [dbo].[feedback] ([id], [order_item_id], [user_id], [rating], [comment], [status], [created_at], [updated_at]) VALUES (12, 16, 6, 3, N'Chân váy denim có thiết kế đẹp, dễ phối đồ. Tuy nhiên, chất vải hơi cứng và form không ôm dáng như mong đợi. Màu sắc cũng hơi khác so với hình ảnh. Giao hàng nhanh nhưng mong shop cải thiện chất lượng vải hơn!', N'approved', CAST(N'2025-03-29T17:28:21.6200000' AS DateTime2), CAST(N'2025-03-29T17:54:15.6400000' AS DateTime2))
GO
INSERT [dbo].[feedback] ([id], [order_item_id], [user_id], [rating], [comment], [status], [created_at], [updated_at]) VALUES (13, 17, 6, 5, N'"Túi mini siêu xinh, nhỏ gọn nhưng đựng được khá nhiều đồ. Chất liệu đẹp, da mềm mịn, đường may chắc chắn. Dây đeo vừa vặn, có thể điều chỉnh linh hoạt. Phối đồ rất dễ dàng, phù hợp cho cả đi chơi và dạo phố. Giao hàng nhanh, đóng gói cẩn thận. Rất ưng ý!', N'approved', CAST(N'2025-03-29T17:28:21.6200000' AS DateTime2), CAST(N'2025-03-29T17:54:13.7066667' AS DateTime2))
GO
INSERT [dbo].[feedback] ([id], [order_item_id], [user_id], [rating], [comment], [status], [created_at], [updated_at]) VALUES (14, 39, 7, 3, N'Áo khoác bomber có thiết kế đẹp, kiểu dáng trẻ trung. Tuy nhiên, chất vải hơi mỏng hơn so với mong đợi, mặc mùa lạnh không đủ ấm. Đường may ổn nhưng khóa kéo hơi cứng. Giao hàng đúng hẹn. Mong shop cải thiện chất lượng hơn!', N'approved', CAST(N'2025-03-29T17:51:07.7933333' AS DateTime2), CAST(N'2025-03-29T17:54:11.1800000' AS DateTime2))
GO
INSERT [dbo].[feedback] ([id], [order_item_id], [user_id], [rating], [comment], [status], [created_at], [updated_at]) VALUES (15, 40, 7, 5, N'Váy công chúa siêu đẹp, bé nhà mình rất thích! Chất vải mềm mịn, không gây ngứa hay khó chịu. Thiết kế bồng bềnh, màu sắc đúng như hình, đường may chắc chắn. Mặc lên nhìn yêu lắm! Giao hàng nhanh, đóng gói cẩn thận. Rất hài lòng!', N'approved', CAST(N'2025-03-29T17:51:07.8133333' AS DateTime2), CAST(N'2025-03-29T17:54:07.0966667' AS DateTime2))
GO
INSERT [dbo].[feedback] ([id], [order_item_id], [user_id], [rating], [comment], [status], [created_at], [updated_at]) VALUES (16, 41, 7, 4, N'Đầm maxi hoa nhí rất xinh, thiết kế nhẹ nhàng, nữ tính. Chất vải mềm, thoáng mát, mặc mùa hè rất dễ chịu. Tuy nhiên, váy hơi dài hơn so với mong đợi, phải chỉnh lại một chút. Giao hàng nhanh, đóng gói cẩn thận. Nhìn chung rất hài lòng!', N'approved', CAST(N'2025-03-29T17:51:07.8133333' AS DateTime2), CAST(N'2025-03-29T17:54:09.1333333' AS DateTime2))
GO
INSERT [dbo].[feedback] ([id], [order_item_id], [user_id], [rating], [comment], [status], [created_at], [updated_at]) VALUES (17, 42, 7, 2, N'Kính mát có thiết kế đẹp nhưng chất lượng chưa tốt. Gọng kính hơi lỏng, đeo lâu không thoải mái. Tròng kính chống nắng không hiệu quả như mong đợi. Giao hàng đúng hẹn nhưng sản phẩm chưa thực sự ưng ý. Mong shop cải thiện chất lượng hơn!', N'approved', CAST(N'2025-03-29T17:51:07.8200000' AS DateTime2), CAST(N'2025-03-29T17:54:04.9000000' AS DateTime2))
GO
INSERT [dbo].[feedback] ([id], [order_item_id], [user_id], [rating], [comment], [status], [created_at], [updated_at]) VALUES (18, 43, 7, 4, N'Dây chuyền bạc đẹp, thiết kế tinh tế và sang trọng. Chất liệu sáng, đeo không bị kích ứng da. Tuy nhiên, dây hơi mỏng hơn so với tưởng tượng, cần giữ gìn cẩn thận. Giao hàng nhanh, đóng gói cẩn thận. Nhìn chung rất ưng ý!', N'approved', CAST(N'2025-03-29T17:51:07.8233333' AS DateTime2), CAST(N'2025-03-29T17:54:02.6400000' AS DateTime2))
GO
INSERT [dbo].[feedback] ([id], [order_item_id], [user_id], [rating], [comment], [status], [created_at], [updated_at]) VALUES (19, 44, 7, 5, N'Giày cao gót cực đẹp, đi rất êm chân, không bị đau dù mang cả ngày. Chất liệu tốt, đường may chắc chắn, thiết kế thanh lịch và dễ phối đồ. Giao hàng nhanh, đóng gói cẩn thận. Rất hài lòng, sẽ ủng hộ shop lần sau!', N'approved', CAST(N'2025-03-29T17:51:07.8266667' AS DateTime2), CAST(N'2025-03-29T17:54:00.9266667' AS DateTime2))
GO
SET IDENTITY_INSERT [dbo].[feedback] OFF
GO
SET IDENTITY_INSERT [dbo].[feedback_reply] ON 
GO
INSERT [dbo].[feedback_reply] ([id], [feedback_id], [user_id], [comment], [created_at], [updated_at]) VALUES (1, 19, 3, N'Cảm ơn chị đã dành thời gian đánh giá sản phẩm! 💖 Shop rất vui khi biết chị hài lòng với đôi giày cao gót – vừa đẹp, vừa êm chân! ✨ Chúng em luôn nỗ lực mang đến những sản phẩm chất lượng và trải nghiệm mua sắm tuyệt vời nhất. Hy vọng sẽ tiếp tục được phục vụ chị trong những lần mua sắm tiếp theo! Nếu cần hỗ trợ gì, đừng ngại liên hệ với shop nhé!❤️❤️', CAST(N'2025-03-29T17:58:46.1566667' AS DateTime2), CAST(N'2025-03-29T17:58:46.1566667' AS DateTime2))
GO
INSERT [dbo].[feedback_reply] ([id], [feedback_id], [user_id], [comment], [created_at], [updated_at]) VALUES (2, 18, 3, N'**Phản hồi từ Shop:**  

"Cảm ơn chị đã tin tưởng và dành những lời khen cho sản phẩm của shop! 💖 Rất vui khi chị hài lòng với thiết kế và chất lượng của dây chuyền bạc. ✨ Shop sẽ tiếp tục cải thiện để mang đến những sản phẩm ngày càng hoàn thiện hơn. Nếu cần tư vấn thêm về cách bảo quản dây chuyền để luôn sáng đẹp, chị cứ nhắn shop nhé! Hy vọng sẽ được phục vụ chị trong những lần mua sắm tiếp theo! ❤️"  
', CAST(N'2025-03-29T17:59:18.0233333' AS DateTime2), CAST(N'2025-03-29T17:59:18.0233333' AS DateTime2))
GO
INSERT [dbo].[feedback_reply] ([id], [feedback_id], [user_id], [comment], [created_at], [updated_at]) VALUES (3, 17, 3, N'Cảm ơn anh/chị đã dành thời gian chia sẻ ý kiến về sản phẩm! 🙏 Shop rất tiếc khi sản phẩm chưa đáp ứng hoàn toàn mong đợi của anh/chị. Chúng em ghi nhận góp ý về chất lượng kính và sẽ làm việc với nhà cung cấp để cải thiện tốt hơn. Nếu anh/chị cần hỗ trợ đổi trả hoặc có bất kỳ thắc mắc nào, vui lòng liên hệ với shop để được hỗ trợ nhanh nhất ạ. Rất mong có cơ hội phục vụ anh/chị tốt hơn trong lần mua sắm tiếp theo! ❤️', CAST(N'2025-03-29T17:59:34.6433333' AS DateTime2), CAST(N'2025-03-29T17:59:34.6433333' AS DateTime2))
GO
INSERT [dbo].[feedback_reply] ([id], [feedback_id], [user_id], [comment], [created_at], [updated_at]) VALUES (4, 15, 3, N'Cảm ơn chị đã tin tưởng và dành những lời khen cho sản phẩm của shop! 💖 Rất vui khi bé nhà mình yêu thích chiếc váy công chúa này! 👗✨ Shop luôn cố gắng mang đến những sản phẩm chất lượng và đáng yêu nhất cho các bé. Hy vọng sẽ tiếp tục được phục vụ chị và bé trong những lần mua sắm tiếp theo! Nếu cần tư vấn thêm, chị cứ nhắn shop nhé! ❤️', CAST(N'2025-03-29T17:59:52.5233333' AS DateTime2), CAST(N'2025-03-29T17:59:52.5233333' AS DateTime2))
GO
INSERT [dbo].[feedback_reply] ([id], [feedback_id], [user_id], [comment], [created_at], [updated_at]) VALUES (5, 16, 3, N'"Cảm ơn chị đã dành thời gian đánh giá sản phẩm! 💖 Rất vui khi chị ưng ý với thiết kế và chất liệu của đầm maxi hoa nhí. 🌸✨ Shop ghi nhận góp ý về độ dài váy và sẽ xem xét để cải thiện hơn trong những mẫu sau. Hy vọng sẽ tiếp tục được phục vụ chị trong những lần mua sắm tiếp theo. Nếu cần hỗ trợ gì thêm, chị cứ nhắn shop nhé! ❤️', CAST(N'2025-03-29T18:00:07.5200000' AS DateTime2), CAST(N'2025-03-29T18:00:07.5200000' AS DateTime2))
GO
INSERT [dbo].[feedback_reply] ([id], [feedback_id], [user_id], [comment], [created_at], [updated_at]) VALUES (6, 14, 3, N'Cảm ơn anh/chị đã dành thời gian chia sẻ đánh giá! 🙏 Rất vui khi anh/chị ưng ý với thiết kế trẻ trung của áo khoác bomber. ✨ Shop ghi nhận góp ý về chất vải và khóa kéo, và sẽ làm việc với nhà cung cấp để cải thiện chất lượng tốt hơn. Nếu cần hỗ trợ thêm, anh/chị cứ nhắn shop nhé! Hy vọng sẽ có cơ hội phục vụ anh/chị trong những lần mua sắm tiếp theo! ❤️', CAST(N'2025-03-29T18:00:26.0566667' AS DateTime2), CAST(N'2025-03-29T18:00:26.0566667' AS DateTime2))
GO
INSERT [dbo].[feedback_reply] ([id], [feedback_id], [user_id], [comment], [created_at], [updated_at]) VALUES (7, 12, 3, N'Cảm ơn anh/chị đã dành thời gian đánh giá sản phẩm! 💖 Rất vui khi anh/chị ưng ý với thiết kế của chân váy denim. Shop ghi nhận góp ý về chất vải và form dáng, và sẽ xem xét để cải thiện hơn trong những mẫu sau. ✨ Hy vọng sẽ tiếp tục được phục vụ anh/chị trong những lần mua sắm tiếp theo. Nếu cần hỗ trợ gì thêm, anh/chị cứ nhắn shop nhé! ❤️', CAST(N'2025-03-29T18:00:44.2233333' AS DateTime2), CAST(N'2025-03-29T18:00:44.2233333' AS DateTime2))
GO
INSERT [dbo].[feedback_reply] ([id], [feedback_id], [user_id], [comment], [created_at], [updated_at]) VALUES (8, 13, 3, N'Cảm ơn anh/chị đã tin tưởng và dành những lời khen cho sản phẩm của shop! 💖 Rất vui khi anh/chị hài lòng với chiếc túi mini – vừa xinh xắn, tiện lợi lại dễ phối đồ. 👜✨ Shop luôn cố gắng mang đến những sản phẩm chất lượng và trải nghiệm mua sắm tốt nhất. Hy vọng sẽ tiếp tục được phục vụ anh/chị trong những lần mua sắm tiếp theo! Nếu cần hỗ trợ gì, đừng ngại nhắn shop nhé! ❤️', CAST(N'2025-03-29T18:01:03.4733333' AS DateTime2), CAST(N'2025-03-29T18:01:03.4733333' AS DateTime2))
GO
INSERT [dbo].[feedback_reply] ([id], [feedback_id], [user_id], [comment], [created_at], [updated_at]) VALUES (9, 11, 3, N'Cảm ơn anh/chị đã dành thời gian chia sẻ đánh giá! 💖 Rất vui khi anh/chị ưng ý với thiết kế của chân váy. Shop ghi nhận góp ý về chất vải và đường may, và sẽ làm việc với nhà cung cấp để cải thiện chất lượng tốt hơn. ✨ Hy vọng sẽ tiếp tục được phục vụ anh/chị trong những lần mua sắm tiếp theo. Nếu cần hỗ trợ gì thêm, anh/chị cứ nhắn shop nhé! ❤️', CAST(N'2025-03-29T18:01:19.6366667' AS DateTime2), CAST(N'2025-03-29T18:01:19.6366667' AS DateTime2))
GO
INSERT [dbo].[feedback_reply] ([id], [feedback_id], [user_id], [comment], [created_at], [updated_at]) VALUES (10, 10, 3, N'Cảm ơn anh/chị đã tin tưởng và dành thời gian đánh giá sản phẩm! 💖 Rất vui khi anh/chị hài lòng với chất vải, form dáng và sự tư vấn nhiệt tình từ shop. 🛍️✨ Shop ghi nhận góp ý về màu sắc và sẽ cố gắng cải thiện hình ảnh sản phẩm để khách hàng có trải nghiệm mua sắm tốt hơn. Hy vọng sẽ tiếp tục được phục vụ anh/chị trong những lần mua sắm tiếp theo! Nếu cần hỗ trợ gì thêm, anh/chị cứ nhắn shop nhé! ❤️', CAST(N'2025-03-29T18:01:36.0066667' AS DateTime2), CAST(N'2025-03-29T18:01:36.0066667' AS DateTime2))
GO
INSERT [dbo].[feedback_reply] ([id], [feedback_id], [user_id], [comment], [created_at], [updated_at]) VALUES (11, 9, 3, N'Cảm ơn anh/chị đã dành thời gian đánh giá sản phẩm! 💖 Rất vui khi anh/chị hài lòng với đôi dép – vừa êm chân, bền đẹp lại thoải mái khi sử dụng. 👣✨ Shop luôn cố gắng mang đến những sản phẩm chất lượng và trải nghiệm mua sắm tốt nhất. Hy vọng sẽ tiếp tục được phục vụ anh/chị trong những lần mua sắm tiếp theo! Nếu cần hỗ trợ gì, đừng ngại nhắn shop nhé! ❤️', CAST(N'2025-03-29T18:01:53.8200000' AS DateTime2), CAST(N'2025-03-29T18:01:53.8200000' AS DateTime2))
GO
INSERT [dbo].[feedback_reply] ([id], [feedback_id], [user_id], [comment], [created_at], [updated_at]) VALUES (12, 8, 3, N'Cảm ơn anh/chị đã chia sẻ đánh giá chi tiết về sản phẩm! 💖 Rất vui khi anh/chị ưng ý với thiết kế và họa tiết của đầm hoa. 🌸✨ Shop ghi nhận góp ý về chất vải và form dáng, và sẽ làm việc với nhà cung cấp để cải thiện chất lượng tốt hơn. Hy vọng sẽ tiếp tục được phục vụ anh/chị trong những lần mua sắm tiếp theo! Nếu cần hỗ trợ gì thêm, anh/chị cứ nhắn shop nhé! ❤️', CAST(N'2025-03-29T18:02:18.8900000' AS DateTime2), CAST(N'2025-03-29T18:02:18.8900000' AS DateTime2))
GO
INSERT [dbo].[feedback_reply] ([id], [feedback_id], [user_id], [comment], [created_at], [updated_at]) VALUES (13, 7, 3, N'Cảm ơn anh/chị đã dành thời gian đánh giá sản phẩm! 💖 Rất vui khi anh/chị hài lòng với thiết kế và hình in của áo thun siêu nhân. 🦸✨ Shop ghi nhận góp ý về chất vải và độ bền màu, và sẽ làm việc với nhà cung cấp để cải thiện hơn trong những mẫu sau. Hy vọng sẽ tiếp tục được phục vụ anh/chị trong những lần mua sắm tiếp theo! Nếu cần hỗ trợ gì, anh/chị cứ nhắn shop nhé! ❤️"Cảm ơn anh/chị đã dành thời gian đánh giá sản phẩm! 💖 Rất vui khi anh/chị hài lòng với thiết kế và hình in của áo thun siê', CAST(N'2025-03-29T18:02:37.6566667' AS DateTime2), CAST(N'2025-03-29T18:02:37.6566667' AS DateTime2))
GO
INSERT [dbo].[feedback_reply] ([id], [feedback_id], [user_id], [comment], [created_at], [updated_at]) VALUES (14, 6, 3, N'Cảm ơn anh/chị đã tin tưởng và ủng hộ sản phẩm của shop! 💖 Rất vui khi bé nhà mình mặc áo thun thoải mái và ưng ý với chất lượng sản phẩm. 👕✨ Shop luôn cố gắng mang đến những mẫu áo dễ thương, chất liệu tốt nhất cho bé yêu. Hy vọng sẽ tiếp tục được phục vụ anh/chị trong những lần mua sắm tiếp theo! Nếu cần tư vấn thêm, anh/chị cứ nhắn shop nhé! ❤️', CAST(N'2025-03-29T18:02:57.6466667' AS DateTime2), CAST(N'2025-03-29T18:02:57.6466667' AS DateTime2))
GO
INSERT [dbo].[feedback_reply] ([id], [feedback_id], [user_id], [comment], [created_at], [updated_at]) VALUES (15, 5, 3, N'Cảm ơn anh/chị đã dành những lời khen tuyệt vời cho sản phẩm của shop! 💖 Rất vui khi anh/chị hài lòng với chất vải, form dáng và sự thanh lịch của áo sơ mi trắng. 👔✨ Shop luôn cố gắng mang đến những sản phẩm chất lượng và trải nghiệm mua sắm tốt nhất. Hy vọng sẽ tiếp tục được phục vụ anh/chị trong những lần mua sắm tiếp theo! Nếu cần tư vấn thêm, anh/chị cứ nhắn shop nhé! ❤️', CAST(N'2025-03-29T18:03:17.1533333' AS DateTime2), CAST(N'2025-03-29T18:03:17.1533333' AS DateTime2))
GO
INSERT [dbo].[feedback_reply] ([id], [feedback_id], [user_id], [comment], [created_at], [updated_at]) VALUES (16, 4, 3, N'Cảm ơn anh/chị đã chia sẻ đánh giá chi tiết về sản phẩm! 💖 Rất tiếc khi chân váy chưa hoàn toàn đáp ứng mong đợi của anh/chị. Shop ghi nhận góp ý về chất vải, form dáng và thời gian giao hàng để cải thiện tốt hơn trong tương lai. ✨ Nếu anh/chị cần hỗ trợ thêm về size hoặc bất kỳ vấn đề gì, đừng ngại liên hệ với shop nhé! Hy vọng sẽ có cơ hội phục vụ anh/chị tốt hơn trong lần mua sắm tiếp theo! ❤️', CAST(N'2025-03-29T18:03:40.1700000' AS DateTime2), CAST(N'2025-03-29T18:03:40.1700000' AS DateTime2))
GO
INSERT [dbo].[feedback_reply] ([id], [feedback_id], [user_id], [comment], [created_at], [updated_at]) VALUES (17, 3, 3, N'Cảm ơn anh/chị đã tin tưởng và dành lời khen cho sản phẩm của shop! 💖 Rất vui khi anh/chị hài lòng với chất vải và đường may của váy. ✨ Shop ghi nhận góp ý về form dáng để cải thiện hơn trong những mẫu sau. Hy vọng sẽ tiếp tục được phục vụ anh/chị trong những lần mua sắm tiếp theo! Nếu cần tư vấn thêm, anh/chị cứ nhắn shop nhé! ❤️', CAST(N'2025-03-29T18:03:55.8633333' AS DateTime2), CAST(N'2025-03-29T18:03:55.8633333' AS DateTime2))
GO
INSERT [dbo].[feedback_reply] ([id], [feedback_id], [user_id], [comment], [created_at], [updated_at]) VALUES (18, 2, 3, N'Cảm ơn anh/chị đã tin tưởng và đánh giá sản phẩm của shop! 💖 Rất vui khi anh/chị hài lòng với chất vải và đường may của váy. ✨ Nếu cần tư vấn kỹ hơn về size để chọn được sản phẩm phù hợp nhất, anh/chị cứ nhắn shop nhé! Hy vọng sẽ tiếp tục được phục vụ anh/chị trong những lần mua sắm tiếp theo! ❤️', CAST(N'2025-03-29T18:04:10.7900000' AS DateTime2), CAST(N'2025-03-29T18:04:10.7900000' AS DateTime2))
GO
INSERT [dbo].[feedback_reply] ([id], [feedback_id], [user_id], [comment], [created_at], [updated_at]) VALUES (19, 1, 3, N'Cảm ơn anh/chị đã tin tưởng và dành lời khen cho sản phẩm của shop! 💖 Rất vui khi anh/chị hài lòng với chất lượng vải, form dáng và sự tiện dụng của quần tây đen. 👖✨ Shop luôn cố gắng mang đến những sản phẩm tốt nhất để khách hàng có trải nghiệm mua sắm tuyệt vời. Hy vọng sẽ tiếp tục được phục vụ anh/chị trong những lần mua sắm tiếp theo! Nếu cần tư vấn thêm, anh/chị cứ nhắn shop nhé! ❤️', CAST(N'2025-03-29T18:04:27.9233333' AS DateTime2), CAST(N'2025-03-29T18:04:27.9233333' AS DateTime2))
GO
SET IDENTITY_INSERT [dbo].[feedback_reply] OFF
GO
SET IDENTITY_INSERT [dbo].[posts] ON 
GO
INSERT [dbo].[posts] ([id], [title], [thumbnail], [summary], [content], [author_id], [is_featured], [status], [created_at], [updated_at]) VALUES (1, N'Xu hướng thời trang mùa xuân 2025', N'https://mcdn.coolmate.me/image/December2022/xu-huong-thoi-trang-xuan-he-2023-805_866.jpg', N'Mùa xuân năm 2025 là thời trang màu sắc nổi bật và bền vững...', N'Mùa xuân năm 2025 là thời trang màu sắc nổi bật và bền vững. Mùa này mang đến góc nhìn mới mẻ về phong cách cổ điển với sự nhấn mạnh vào vật liệu thân thiện với môi trường và những món đồ đa năng có thể tạo kiểu theo nhiều cách. Các xu hướng chính bao gồm chủ nghĩa tối giản màu pastel, áo khoác oversize và denim bền vững.', 3, 1, N'published', CAST(N'2024-01-15T10:00:00.0000000' AS DateTime2), CAST(N'2024-01-16T10:00:00.0000000' AS DateTime2))
GO
INSERT [dbo].[posts] ([id], [title], [thumbnail], [summary], [content], [author_id], [is_featured], [status], [created_at], [updated_at]) VALUES (2, N'Làm thế nào để xây dựng một tủ quần áo con nhộng', N'https://songxanhsongkhoe.vn/wp-content/uploads/2020/11/co-gai-dung-truoc-tu-quan-an-va-sap-xep-tu-do-con-nhong-1-1024x683.jpg', N'Tủ quần áo con nhộng là giải pháp hoàn hảo cho những ai...', N'Tủ quần áo con nhộng là giải pháp hoàn hảo cho những ai muốn giảm thiểu quần áo trong khi vẫn tối đa hóa các lựa chọn về phong cách. Hướng dẫn toàn diện này sẽ hướng dẫn bạn cách lựa chọn những món đồ thiết yếu, phối hợp màu sắc và chuyển mùa.', 3, 1, N'published', CAST(N'2024-01-20T14:30:00.0000000' AS DateTime2), CAST(N'2024-01-21T14:30:00.0000000' AS DateTime2))
GO
INSERT [dbo].[posts] ([id], [title], [thumbnail], [summary], [content], [author_id], [is_featured], [status], [created_at], [updated_at]) VALUES (3, N'Thời trang bền vững: Hướng dẫn đầy đủ', N'https://tse1.mm.bing.net/th?id=OIP.jBJ4gAN070RxCwsuzGaMZAHaFF&pid=Api&P=0&h=180', N'Thời trang bền vững không chỉ là một xu hướng - mà còn...', N'Thời trang bền vững không chỉ là một xu hướng - mà còn là điều cần thiết cho tương lai của hành tinh chúng ta. Tìm hiểu về vật liệu thân thiện với môi trường, quy trình sản xuất có đạo đức và cách đưa ra những lựa chọn bền vững hơn khi mua thời trang.', 3, 0, N'published', CAST(N'2024-01-25T09:15:00.0000000' AS DateTime2), CAST(N'2024-01-26T09:15:00.0000000' AS DateTime2))
GO
INSERT [dbo].[posts] ([id], [title], [thumbnail], [summary], [content], [author_id], [is_featured], [status], [created_at], [updated_at]) VALUES (4, N'Xu hướng màu sắc cho mùa hè năm 2025', N'https://cdn.vuahanghieu.com/unsafe/1200x0/left/top/smart/filters:quality(90)/https://admin.vuahanghieu.com/upload/news/2021/10/15-xu-huong-mau-sac-thoi-trang-trend-mua-thu-dong-2021-06102021134538.jpg', N'Mùa hè năm 2025 đánh dấu sự trở lại mạnh mẽ...', N'Mùa hè năm 2025 đánh dấu sự trở lại mạnh mẽ của phong cách cổ điển trong thời trang, khi các xu hướng từ thập kỷ trước được tái hiện với những biến tấu hiện đại, tạo nên sự giao thoa độc đáo giữa quá khứ và hiện tại. Bên cạnh đó, bảng màu của mùa hè năm nay cũng vô cùng rực rỡ và đa dạng, phản ánh sự kết nối giữa con người và thiên nhiên. Những gam màu nổi bật bao gồm Future Dusk – sắc xanh lam đậm đầy bí ẩn, Transcendent Pink – hồng nhẹ nhàng thể hiện sự tinh tế, Aquatic Awe – xanh ngọc bích tươi mát như đại dương, Sunset Coral – cam san hô ấm áp như ánh hoàng hôn, và Ray Flower – vàng rực rỡ tràn đầy năng lượng. Sự kết hợp giữa phong cách cổ điển và bảng màu ấn tượng này không chỉ tạo nên những bộ trang phục vừa hoài cổ vừa hiện đại mà còn mang đến cảm giác tin cậy, ổn định trong một thế giới đang không ngừng thay đổi.', 3, 1, N'published', CAST(N'2024-02-01T11:45:00.0000000' AS DateTime2), CAST(N'2024-02-02T11:45:00.0000000' AS DateTime2))
GO
INSERT [dbo].[posts] ([id], [title], [thumbnail], [summary], [content], [author_id], [is_featured], [status], [created_at], [updated_at]) VALUES (5, N'Phụ kiện 101: Hướng dẫn đầy đủ', N'https://cf.shopee.vn/file/b849b807196691d47472df6073839200', N'Tìm hiểu các nguyên tắc cơ bản về phụ kiện, từ việc...', N'Tìm hiểu các nguyên tắc cơ bản về phụ kiện, từ việc lựa chọn đồ trang sức phù hợp đến việc lựa chọn túi xách và giày dép phù hợp với trang phục của bạn. Hướng dẫn toàn diện này bao gồm mọi thứ từ những dịp bình thường đến trang trọng.', 3, 0, N'draft', CAST(N'2024-02-05T16:20:00.0000000' AS DateTime2), CAST(N'2024-02-06T16:20:00.0000000' AS DateTime2))
GO
INSERT [dbo].[posts] ([id], [title], [thumbnail], [summary], [content], [author_id], [is_featured], [status], [created_at], [updated_at]) VALUES (6, N'Kỹ thuật xếp lớp cho mùa đông', N'https://tiki.vn/blog/wp-content/uploads/2023/03/mix-do-mua-dong-phong-cach-han-quoc.jpg', N'Tìm hiểu cách kết hợp các kết cấu và...', N'Tìm hiểu cách kết hợp các kết cấu và mảnh ghép khác nhau để tạo nên những bộ trang phục mùa đông ấm áp và thời trang. Từ lớp lót giữ nhiệt đến áo khoác nổi bật, chúng tôi sẽ chia nhỏ các kỹ thuật thiết yếu để luôn sang trọng và thoải mái.', 3, 1, N'published', CAST(N'2024-02-10T10:00:00.0000000' AS DateTime2), CAST(N'2024-02-11T10:00:00.0000000' AS DateTime2))
GO
INSERT [dbo].[posts] ([id], [title], [thumbnail], [summary], [content], [author_id], [is_featured], [status], [created_at], [updated_at]) VALUES (7, N'Những cải tiến về vải thân thiện với môi trường', N'https://dongphucthanhhung.vn/wp-content/uploads/2023/05/vai-than-thien-voi-moi-truong.jpg', N'Những cải tiến về vải thân thiện với môi trường đang...', N'Những cải tiến về vải thân thiện với môi trường đang trở thành xu hướng quan trọng trong ngành thời trang bền vững. Các chất liệu như sợi tre, vải từ tảo biển, sợi dứa Piñatex hay polyester tái chế (rPET) không chỉ giúp giảm tác động tiêu cực đến môi trường mà còn mang lại sự thoải mái và bền bỉ cho người sử dụng. Bên cạnh đó, công nghệ sản xuất hiện đại đã giúp tối ưu hóa quy trình dệt may, giảm đáng kể lượng nước, hóa chất và rác thải. Những thay đổi này không chỉ hướng tới việc bảo vệ hành tinh mà còn mở ra một tương lai bền vững hơn cho ngành công nghiệp thời trang.', 3, 0, N'published', CAST(N'2024-02-15T14:30:00.0000000' AS DateTime2), CAST(N'2024-02-16T14:30:00.0000000' AS DateTime2))
GO
INSERT [dbo].[posts] ([id], [title], [thumbnail], [summary], [content], [author_id], [is_featured], [status], [created_at], [updated_at]) VALUES (8, N'Những vật dụng thiết yếu cho tủ đồ tối giản', N'https://noithatminhkhoi.com/upload/images/xay-dung-tu-quan-ao-toi-gian-cho-nam-gioi-04.jpg', N'Một tủ đồ tối giản không cần quá nhiều...', N'Một tủ đồ tối giản không cần quá nhiều món đồ nhưng vẫn đảm bảo tính linh hoạt và phong cách. Những vật dụng thiết yếu như áo sơ mi trắng, áo thun trơn, quần jeans tối màu hay blazer giúp bạn dễ dàng phối hợp trang phục cho nhiều dịp khác nhau. Bên cạnh đó, một đôi giày thể thao thoải mái và giày da thanh lịch sẽ giúp bạn luôn sẵn sàng cho cả ngày thường lẫn sự kiện quan trọng. Kết hợp với túi xách đa năng và một vài phụ kiện tinh tế, tủ đồ tối giản không chỉ giúp tiết kiệm thời gian mà còn tạo nên vẻ ngoài hiện đại, tinh tế và không bao giờ lỗi mốt.', 3, 1, N'published', CAST(N'2024-02-20T09:15:00.0000000' AS DateTime2), CAST(N'2024-02-21T09:15:00.0000000' AS DateTime2))
GO
INSERT [dbo].[posts] ([id], [title], [thumbnail], [summary], [content], [author_id], [is_featured], [status], [created_at], [updated_at]) VALUES (9, N'Sự hồi sinh của thời trang cổ điển', N'https://www.elle.vn/wp-content/uploads/2019/07/19/Su-khac-biet-giua-thoi-trang-phong-cach-vintage-va-retro.jpg', N'Phong cách cổ điển đang quay trở lại mạnh mẽ...', N'Phong cách cổ điển đang quay trở lại mạnh mẽ trong nhiều lĩnh vực như thời trang, nội thất, thiết kế đồ họa và nghệ thuật. Xu hướng này không chỉ đơn thuần là việc tái hiện lại quá khứ mà còn là sự kết hợp giữa nét đẹp truyền thống với yếu tố hiện đại, tạo ra một phong cách tân cổ điển (Neo-Classic) đầy tinh tế.', 1, 0, N'published', CAST(N'2024-02-25T11:45:00.0000000' AS DateTime2), CAST(N'2024-02-26T11:45:00.0000000' AS DateTime2))
GO
INSERT [dbo].[posts] ([id], [title], [thumbnail], [summary], [content], [author_id], [is_featured], [status], [created_at], [updated_at]) VALUES (10, N'Quần áo tích hợp công nghệ', N'https://media-cdn-v2.laodong.vn/storage/newsportal/2022/6/14/1056388/Vr-And-Ar-For-Busine.jpg', N'Quần áo tích hợp công nghệ đang trở thành...', N'Quần áo tích hợp công nghệ đang trở thành xu hướng mới trong ngành thời trang, mang lại sự tiện lợi và trải nghiệm hiện đại cho người dùng. Từ áo khoác có khả năng tự điều chỉnh nhiệt độ, vải chống thấm nước nhưng vẫn thoáng khí, đến quần áo thể thao có cảm biến theo dõi sức khỏe, công nghệ đang thay đổi cách chúng ta mặc và sử dụng trang phục hàng ngày. Ngoài ra, các chất liệu thông minh như vải dẫn điện, vải đổi màu theo môi trường hay trang phục có thể kết nối với thiết bị di động đang mở ra một kỷ nguyên mới cho thời trang ứng dụng. Với sự kết hợp giữa thẩm mỹ và công nghệ, quần áo thông minh không chỉ đáp ứng nhu cầu tiện nghi mà còn giúp nâng cao chất lượng cuộc sống.', 3, 1, N'published', CAST(N'2024-03-01T16:20:00.0000000' AS DateTime2), CAST(N'2024-03-02T16:20:00.0000000' AS DateTime2))
GO
INSERT [dbo].[posts] ([id], [title], [thumbnail], [summary], [content], [author_id], [is_featured], [status], [created_at], [updated_at]) VALUES (11, N'Mẹo thời trang tiết kiệm', N'https://songkhoeannhien.vn/wp-content/uploads/2023/02/Lua-chon-quan-ao-vai-tot-skan-2000x1333.jpg', N'Thời trang tiết kiệm không có nghĩa...', N'Thời trang tiết kiệm không có nghĩa là phải từ bỏ phong cách, mà ngược lại, bạn có thể vẫn sành điệu mà không tốn quá nhiều chi phí. Trước tiên, hãy đầu tư vào những món đồ cơ bản và dễ phối như áo sơ mi trắng, quần jeans và blazer – những item không bao giờ lỗi mốt. Thứ hai, săn sale thông minh bằng cách theo dõi các đợt giảm giá lớn hoặc mua sắm tại các cửa hàng second-hand, nơi bạn có thể tìm được nhiều món đồ độc đáo với giá rẻ. Ngoài ra, học cách mix & match giúp bạn tận dụng tối đa tủ đồ mà không cần mua sắm liên tục. Cuối cùng, bảo quản quần áo đúng cách sẽ giúp chúng bền hơn, giúp bạn tiết kiệm chi phí thay thế. Với những mẹo này, bạn hoàn toàn có thể xây dựng phong cách riêng mà không cần tiêu tốn quá nhiều tiền.', 3, 0, N'published', CAST(N'2024-03-05T10:00:00.0000000' AS DateTime2), CAST(N'2024-03-06T10:00:00.0000000' AS DateTime2))
GO
INSERT [dbo].[posts] ([id], [title], [thumbnail], [summary], [content], [author_id], [is_featured], [status], [created_at], [updated_at]) VALUES (12, N'Ảnh hưởng của văn hóa trong thời trang', N'https://aodaivietnam.vceo.vn/images/upload/images/a8-1400520557-700x0-1400555235_680x0.jpg', N'Văn hóa ảnh hưởng sâu sắc đến thời trang,...', N'Văn hóa ảnh hưởng sâu sắc đến thời trang, từ trang phục truyền thống đến xu hướng hiện đại. Mỗi nền văn hóa mang đến những màu sắc, họa tiết và kiểu dáng đặc trưng, giúp định hình phong cách thời trang đa dạng. Bên cạnh đó, âm nhạc, nghệ thuật và phong trào xã hội cũng góp phần tạo ra những xu hướng mới. Sự giao thoa giữa các nền văn hóa trong thời đại toàn cầu hóa giúp thời trang ngày càng phong phú, kết hợp giữa truyền thống và hiện đại, góp phần lan tỏa giá trị văn hóa trên toàn thế giới.', 3, 1, N'published', CAST(N'2024-03-10T14:30:00.0000000' AS DateTime2), CAST(N'2024-03-11T14:30:00.0000000' AS DateTime2))
GO
INSERT [dbo].[posts] ([id], [title], [thumbnail], [summary], [content], [author_id], [is_featured], [status], [created_at], [updated_at]) VALUES (13, N'Thiết kế giày bền vững', N'https://static.ybox.vn/2015/08/c55b53fec37cc226e1ed8ffeb10d7f33.jpg', N'Thiết kế giày bền vững đang trở thành...', N'Thiết kế giày bền vững đang trở thành xu hướng quan trọng trong ngành thời trang, hướng đến việc giảm thiểu tác động tiêu cực đến môi trường. Các thương hiệu ngày càng chú trọng sử dụng vật liệu tái chế, hữu cơ hoặc có khả năng phân hủy sinh học như da thực vật, nhựa tái chế và cao su tự nhiên. Bên cạnh đó, quy trình sản xuất cũng được tối ưu hóa để tiết kiệm năng lượng và giảm lượng khí thải. Không chỉ thân thiện với môi trường, giày bền vững còn được thiết kế để đảm bảo độ bền cao, giúp người tiêu dùng sử dụng lâu dài và hạn chế rác thải thời trang.', 3, 0, N'published', CAST(N'2024-03-15T09:15:00.0000000' AS DateTime2), CAST(N'2024-03-16T09:15:00.0000000' AS DateTime2))
GO
INSERT [dbo].[posts] ([id], [title], [thumbnail], [summary], [content], [author_id], [is_featured], [status], [created_at], [updated_at]) VALUES (14, N'Xu hướng nhiếp ảnh thời trang', N'https://lh4.googleusercontent.com/G-N1LdssK9CFqmlFcq9e6SUDeBLlwYVhcDxZNwgDDZmtcaEkmH-xsB3jrdQqSOdjjGLNVbe7YTN9V91Ywq1CCOjUN65wl3IhQHzVp3Juzh5G9Vub7Iss4v7CWZLU17hL8eqO8Eb8', N'Xu hướng nhiếp ảnh thời trang đang...', N'Xu hướng nhiếp ảnh thời trang đang không ngừng thay đổi, phản ánh sự kết hợp giữa nghệ thuật, công nghệ và văn hóa đương đại. Những phong cách hoài cổ như film photography đang quay trở lại, mang đến cảm giác chân thực và giàu cảm xúc. Bên cạnh đó, nhiếp ảnh thời trang hiện đại còn ứng dụng AI và công nghệ CGI để tạo ra những bộ ảnh mang đậm tính sáng tạo và siêu thực. Xu hướng "street style photography" cũng tiếp tục được ưa chuộng, tập trung vào sự tự nhiên và phong cách cá nhân. Ngoài ra, việc đề cao tính bền vững trong nhiếp ảnh thời trang ngày càng phổ biến, với các chiến dịch quảng cáo ưu tiên sử dụng ánh sáng tự nhiên và hạn chế tác động đến môi trường.', 3, 1, N'published', CAST(N'2024-03-20T11:45:00.0000000' AS DateTime2), CAST(N'2024-03-21T11:45:00.0000000' AS DateTime2))
GO
INSERT [dbo].[posts] ([id], [title], [thumbnail], [summary], [content], [author_id], [is_featured], [status], [created_at], [updated_at]) VALUES (15, N'Phát triển phong cách cá nhân', N'https://ims.baoyenbai.com.vn/NewsImg/6_2023/286023_1tt.jpg', N'Phát triển phong cách cá nhân là...', N'Phát triển phong cách cá nhân là một quá trình khám phá và thể hiện bản thân thông qua thời trang. Thay vì chạy theo xu hướng, hãy tìm ra những trang phục, màu sắc và kiểu dáng phù hợp với cá tính và lối sống của bạn. Việc hiểu rõ vóc dáng, sở thích và cảm hứng từ các nền văn hóa khác nhau sẽ giúp bạn xây dựng một phong cách độc đáo. Ngoài ra, đầu tư vào những món đồ cơ bản nhưng chất lượng, kết hợp với phụ kiện tinh tế, cũng là cách để tạo dấu ấn riêng. Quan trọng nhất, phong cách cá nhân không chỉ nằm ở trang phục mà còn thể hiện qua sự tự tin và cách bạn thể hiện bản thân mỗi ngày.', 3, 0, N'published', CAST(N'2024-03-25T16:20:00.0000000' AS DateTime2), CAST(N'2024-03-26T16:20:00.0000000' AS DateTime2))
GO
INSERT [dbo].[posts] ([id], [title], [thumbnail], [summary], [content], [author_id], [is_featured], [status], [created_at], [updated_at]) VALUES (16, N'Thương hiệu thời trang đạo đức', N'https://style-republik.com/wp-content/uploads/2021/12/Viettien.png', N'Thương hiệu thời trang đạo đức đang...', N'Thương hiệu thời trang đạo đức đang ngày càng thu hút sự quan tâm khi người tiêu dùng chú trọng hơn đến tính bền vững và trách nhiệm xã hội. Các thương hiệu này cam kết sử dụng nguyên liệu thân thiện với môi trường, quy trình sản xuất công bằng và đảm bảo điều kiện làm việc tốt cho người lao động. Họ thường áp dụng mô hình sản xuất minh bạch, sử dụng chất liệu hữu cơ, tái chế hoặc công nghệ tiên tiến để giảm thiểu tác động tiêu cực đến môi trường. Việc ủng hộ các thương hiệu này không chỉ giúp bảo vệ hành tinh mà còn góp phần thúc đẩy sự công bằng trong ngành thời trang.', 3, 1, N'published', CAST(N'2024-03-30T10:00:00.0000000' AS DateTime2), CAST(N'2024-03-31T10:00:00.0000000' AS DateTime2))
GO
INSERT [dbo].[posts] ([id], [title], [thumbnail], [summary], [content], [author_id], [is_featured], [status], [created_at], [updated_at]) VALUES (17, N'Thời trang kỹ thuật số và Metaverse', N'https://bestprint.vn/wp-content/uploads/2022/07/1657921823_567_Cac-nha-ban-le-co-can-mot-chien-luoc-thoi.png', N'Thời trang kỹ thuật số và Metaverse đang...', N'Thời trang kỹ thuật số và Metaverse đang mở ra một kỷ nguyên mới, nơi quần áo không chỉ tồn tại trong thế giới thực mà còn hiện diện trong không gian ảo. Các thương hiệu lớn và nhà thiết kế đang phát triển trang phục kỹ thuật số, cho phép người dùng mua, mặc và trưng bày chúng trên các nền tảng Metaverse hoặc mạng xã hội. Công nghệ blockchain và NFT giúp xác thực quyền sở hữu của những món đồ này, tạo ra một thị trường mới đầy tiềm năng. Với sự phát triển của thực tế ảo (VR) và thực tế tăng cường (AR), thời trang không còn bị giới hạn bởi chất liệu vật lý mà có thể biến đổi linh hoạt theo môi trường số, mở ra cơ hội sáng tạo vô tận cho cả người tiêu dùng lẫn ngành công nghiệp thời trang.', 3, 0, N'published', CAST(N'2024-04-05T14:30:00.0000000' AS DateTime2), CAST(N'2024-04-06T14:30:00.0000000' AS DateTime2))
GO
INSERT [dbo].[posts] ([id], [title], [thumbnail], [summary], [content], [author_id], [is_featured], [status], [created_at], [updated_at]) VALUES (18, N'Cách mạng thời trang thích ứng', N'https://file.hstatic.net/200000775589/article/hippie-style_cd4cf3dfcf234ac7aa46653dd6b140cc.jpg', N'Cách mạng thời trang thích ứng đang...', N'Cách mạng thời trang thích ứng đang thay đổi cách chúng ta tiếp cận quần áo, tập trung vào tính linh hoạt, đa năng và bền vững. Các thiết kế ngày nay không chỉ đáp ứng nhu cầu thẩm mỹ mà còn có khả năng thích nghi với môi trường và lối sống của người mặc. Từ vải co giãn đa chiều, quần áo biến đổi theo thời tiết đến trang phục công nghệ cao giúp điều chỉnh nhiệt độ cơ thể, tất cả đều hướng đến sự tiện lợi và tối ưu hóa trải nghiệm cá nhân. Bên cạnh đó, các thương hiệu cũng đẩy mạnh sản xuất theo mô hình thời trang bền vững, sử dụng vật liệu tái chế và công nghệ thân thiện với môi trường. Đây không chỉ là một xu hướng mà còn là một cuộc cách mạng thay đổi cách chúng ta mặc và tiêu dùng thời trang.', 3, 1, N'published', CAST(N'2024-04-10T09:15:00.0000000' AS DateTime2), CAST(N'2024-04-11T09:15:00.0000000' AS DateTime2))
GO
SET IDENTITY_INSERT [dbo].[posts] OFF
GO
SET IDENTITY_INSERT [dbo].[customer_contact_history] ON 
GO
INSERT [dbo].[customer_contact_history] ([id], [user_id], [customer_type], [email], [full_name], [gender], [mobile], [total_purchases], [total_spend], [updated_at]) VALUES (1, 4, N'vip', N'user123@gmail.com', N'Nguyễn Văn A', N'male', N'0866046581', 2, CAST(1552000.00 AS Decimal(10, 2)), CAST(N'2025-03-29T16:49:21.6900000' AS DateTime2))
GO
INSERT [dbo].[customer_contact_history] ([id], [user_id], [customer_type], [email], [full_name], [gender], [mobile], [total_purchases], [total_spend], [updated_at]) VALUES (2, 4, N'normal', N'user123@gmail.com', N'Nguyễn Thi B', N'male', N'0866046585', 1, CAST(510000.00 AS Decimal(10, 2)), CAST(N'2025-03-29T16:51:17.9633333' AS DateTime2))
GO
INSERT [dbo].[customer_contact_history] ([id], [user_id], [customer_type], [email], [full_name], [gender], [mobile], [total_purchases], [total_spend], [updated_at]) VALUES (3, 4, N'vip', N'user123@gmail.com', N'Nguyễn Văn C', N'male', N'0961004959', 2, CAST(1067000.00 AS Decimal(10, 2)), CAST(N'2025-03-29T20:06:27.8700000' AS DateTime2))
GO
INSERT [dbo].[customer_contact_history] ([id], [user_id], [customer_type], [email], [full_name], [gender], [mobile], [total_purchases], [total_spend], [updated_at]) VALUES (4, 6, N'vip', N'user321@gmail.com', N'Nguyen Hanh Nhan', N'male', N'0866046598', 3, CAST(2278000.00 AS Decimal(10, 2)), CAST(N'2025-03-29T17:52:50.5100000' AS DateTime2))
GO
INSERT [dbo].[customer_contact_history] ([id], [user_id], [customer_type], [email], [full_name], [gender], [mobile], [total_purchases], [total_spend], [updated_at]) VALUES (5, 8, N'vip', N'Medusa@gmail.com', N'Nguyen Van Anh', N'female', N'0866046585', 1, CAST(1380000.00 AS Decimal(10, 2)), CAST(N'2025-03-29T17:04:09.5000000' AS DateTime2))
GO
INSERT [dbo].[customer_contact_history] ([id], [user_id], [customer_type], [email], [full_name], [gender], [mobile], [total_purchases], [total_spend], [updated_at]) VALUES (6, 12, N'vip', N'GuYuan@gmail.com', N'Nguyen Hong Hanh', N'male', N'0961004935', 2, CAST(4130000.00 AS Decimal(10, 2)), CAST(N'2025-03-29T17:10:40.6700000' AS DateTime2))
GO
INSERT [dbo].[customer_contact_history] ([id], [user_id], [customer_type], [email], [full_name], [gender], [mobile], [total_purchases], [total_spend], [updated_at]) VALUES (7, 7, N'vip', N'XiaoDing@gmail.com', N'Nguyễn Thi D', N'male', N'0866046543', 2, CAST(2348000.00 AS Decimal(10, 2)), CAST(N'2025-03-29T17:48:29.0766667' AS DateTime2))
GO
SET IDENTITY_INSERT [dbo].[customer_contact_history] OFF
GO
SET IDENTITY_INSERT [dbo].[tokenPassword] ON 
GO
INSERT [dbo].[tokenPassword] ([id], [token], [expiryTime], [isUsed], [UserID]) VALUES (2, N'dfe99b7b-3adc-4263-b819-ebca71ff6b2a', CAST(N'2025-02-09T17:41:58.857' AS DateTime), 1, 1)
GO
SET IDENTITY_INSERT [dbo].[tokenPassword] OFF
GO
SET IDENTITY_INSERT [dbo].[user_addresses] ON 
GO
INSERT [dbo].[user_addresses] ([id], [user_id], [recipient_name], [phone], [address], [is_default]) VALUES (1, 4, N'Nguyễn Văn A', N'0866046581', N'thôn 1, Xã Ngọc Hồi, Huyện Thanh Trì, Thành phố Hà Nội', 1)
GO
INSERT [dbo].[user_addresses] ([id], [user_id], [recipient_name], [phone], [address], [is_default]) VALUES (2, 4, N'Nguyễn Thi B', N'0866046585', N'thôn 4, Phường Duyệt Trung, Thành phố Cao Bằng, Tỉnh Cao Bằng', 0)
GO
INSERT [dbo].[user_addresses] ([id], [user_id], [recipient_name], [phone], [address], [is_default]) VALUES (3, 4, N'Nguyễn Văn C', N'0961004959', N'thôn 5, Xã Mông Ân, Huyện Bảo Lâm, Tỉnh Cao Bằng', 0)
GO
INSERT [dbo].[user_addresses] ([id], [user_id], [recipient_name], [phone], [address], [is_default]) VALUES (4, 6, N'Nguyen Hanh Nhan', N'0866046598', N'thôn 6, Xã Mông Ân, Huyện Bảo Lâm, Tỉnh Cao Bằng', 1)
GO
INSERT [dbo].[user_addresses] ([id], [user_id], [recipient_name], [phone], [address], [is_default]) VALUES (5, 8, N'Nguyen Van Anh', N'0866046585', N'thôn 4, Phường Trần Phú, Thành phố Hà Giang, Tỉnh Hà Giang', 1)
GO
INSERT [dbo].[user_addresses] ([id], [user_id], [recipient_name], [phone], [address], [is_default]) VALUES (6, 12, N'Nguyen Hong Hanh', N'0961004935', N'thôn 5, Xã Quảng Khê, Huyện Ba Bể, Tỉnh Bắc Kạn', 1)
GO
INSERT [dbo].[user_addresses] ([id], [user_id], [recipient_name], [phone], [address], [is_default]) VALUES (7, 7, N'Nguyễn Thi D', N'0866046543', N'thôn 3, Phường Ngọc Hà, Thành phố Hà Giang, Tỉnh Hà Giang', 1)
GO
SET IDENTITY_INSERT [dbo].[user_addresses] OFF
GO
SET IDENTITY_INSERT [dbo].[messages] ON 
GO
INSERT [dbo].[messages] ([id], [sender_id], [receiver_id], [content], [image_url], [is_read], [created_at]) VALUES (0, 4, 3, N'tôi cần tư vấn', NULL, 1, CAST(N'2025-03-29T18:05:43.8466667' AS DateTime2))
GO
INSERT [dbo].[messages] ([id], [sender_id], [receiver_id], [content], [image_url], [is_read], [created_at]) VALUES (1, 3, 4, N'Shop có thể hỗ trợ gì cho bạn', NULL, 0, CAST(N'2025-03-29T18:05:57.8233333' AS DateTime2))
GO
INSERT [dbo].[messages] ([id], [sender_id], [receiver_id], [content], [image_url], [is_read], [created_at]) VALUES (2, 7, 3, N'xin chào', NULL, 1, CAST(N'2025-03-29T18:06:16.3066667' AS DateTime2))
GO
INSERT [dbo].[messages] ([id], [sender_id], [receiver_id], [content], [image_url], [is_read], [created_at]) VALUES (3, 3, 7, N'chào bạn, bạn cần tư vấn gì ạ!', NULL, 0, CAST(N'2025-03-29T18:06:38.2633333' AS DateTime2))
GO
INSERT [dbo].[messages] ([id], [sender_id], [receiver_id], [content], [image_url], [is_read], [created_at]) VALUES (4, 6, 3, N'hi', NULL, 1, CAST(N'2025-03-29T18:06:52.4466667' AS DateTime2))
GO
INSERT [dbo].[messages] ([id], [sender_id], [receiver_id], [content], [image_url], [is_read], [created_at]) VALUES (5, 3, 6, N'Xin chào quý khách!', NULL, 0, CAST(N'2025-03-29T18:07:19.9533333' AS DateTime2))
GO
INSERT [dbo].[messages] ([id], [sender_id], [receiver_id], [content], [image_url], [is_read], [created_at]) VALUES (6, 12, 3, N'cảm ơn vì đã giao hàng kịp cho tôi', NULL, 1, CAST(N'2025-03-29T18:07:42.1200000' AS DateTime2))
GO
INSERT [dbo].[messages] ([id], [sender_id], [receiver_id], [content], [image_url], [is_read], [created_at]) VALUES (7, 3, 12, N'rất vui vì được phục vụ q', NULL, 0, CAST(N'2025-03-29T18:07:50.7433333' AS DateTime2))
GO
INSERT [dbo].[messages] ([id], [sender_id], [receiver_id], [content], [image_url], [is_read], [created_at]) VALUES (8, 4, 3, N'shop có mẫu này không', N'/fashionshop/uploads/message/d2cf9e16-8606-464d-8084-05847c22c9e5.jpg', 1, CAST(N'2025-03-29T18:08:21.5300000' AS DateTime2))
GO
INSERT [dbo].[messages] ([id], [sender_id], [receiver_id], [content], [image_url], [is_read], [created_at]) VALUES (9, 3, 4, N'shop có mẫu quần tây kaki ạ', N'/fashionshop/uploads/message/e9f600d9-a0ac-45b8-b851-0d360414883a.webp', 0, CAST(N'2025-03-29T18:09:24.5300000' AS DateTime2))
GO
SET IDENTITY_INSERT [dbo].[messages] OFF
GO
SET IDENTITY_INSERT [dbo].[order_history] ON 
GO
INSERT [dbo].[order_history] ([id], [order_id], [updated_by], [status], [notes], [updated_at]) VALUES (1, 1, 4, N'pending', N'Đơn hàng mới được tạo', CAST(N'2025-03-29T16:43:48.4400000' AS DateTime2))
GO
INSERT [dbo].[order_history] ([id], [order_id], [updated_by], [status], [notes], [updated_at]) VALUES (2, 2, 4, N'pending', N'Đơn hàng mới được tạo', CAST(N'2025-03-29T16:44:30.2666667' AS DateTime2))
GO
INSERT [dbo].[order_history] ([id], [order_id], [updated_by], [status], [notes], [updated_at]) VALUES (3, 2, 5, N'processing', N'Cập nhật trạng thái thành processing', CAST(N'2025-03-29T16:44:35.6300000' AS DateTime2))
GO
INSERT [dbo].[order_history] ([id], [order_id], [updated_by], [status], [notes], [updated_at]) VALUES (4, 2, 5, N'shipping', N'Cập nhật trạng thái thành shipping', CAST(N'2025-03-29T16:44:48.7100000' AS DateTime2))
GO
INSERT [dbo].[order_history] ([id], [order_id], [updated_by], [status], [notes], [updated_at]) VALUES (5, 3, 4, N'pending', N'Đơn hàng mới được tạo', CAST(N'2025-03-29T16:45:14.6033333' AS DateTime2))
GO
INSERT [dbo].[order_history] ([id], [order_id], [updated_by], [status], [notes], [updated_at]) VALUES (6, 3, 5, N'processing', N'Cập nhật trạng thái thành processing', CAST(N'2025-03-29T16:45:23.3066667' AS DateTime2))
GO
INSERT [dbo].[order_history] ([id], [order_id], [updated_by], [status], [notes], [updated_at]) VALUES (7, 4, 4, N'pending', N'Đơn hàng mới được tạo', CAST(N'2025-03-29T16:46:10.4000000' AS DateTime2))
GO
INSERT [dbo].[order_history] ([id], [order_id], [updated_by], [status], [notes], [updated_at]) VALUES (8, 4, 5, N'processing', N'Cập nhật trạng thái thành processing', CAST(N'2025-03-29T16:46:17.1200000' AS DateTime2))
GO
INSERT [dbo].[order_history] ([id], [order_id], [updated_by], [status], [notes], [updated_at]) VALUES (9, 4, 5, N'shipping', N'Cập nhật trạng thái thành shipping', CAST(N'2025-03-29T16:46:52.0533333' AS DateTime2))
GO
INSERT [dbo].[order_history] ([id], [order_id], [updated_by], [status], [notes], [updated_at]) VALUES (10, 4, 5, N'completed', N'Cập nhật trạng thái thành completed', CAST(N'2025-03-29T16:46:57.8166667' AS DateTime2))
GO
INSERT [dbo].[order_history] ([id], [order_id], [updated_by], [status], [notes], [updated_at]) VALUES (11, 5, 4, N'pending', N'Đơn hàng mới được tạo', CAST(N'2025-03-29T16:47:26.2700000' AS DateTime2))
GO
INSERT [dbo].[order_history] ([id], [order_id], [updated_by], [status], [notes], [updated_at]) VALUES (12, 5, 5, N'processing', N'Cập nhật trạng thái thành processing', CAST(N'2025-03-29T16:47:33.2766667' AS DateTime2))
GO
INSERT [dbo].[order_history] ([id], [order_id], [updated_by], [status], [notes], [updated_at]) VALUES (13, 5, 5, N'shipping', N'Cập nhật trạng thái thành shipping', CAST(N'2025-03-29T16:47:42.3300000' AS DateTime2))
GO
INSERT [dbo].[order_history] ([id], [order_id], [updated_by], [status], [notes], [updated_at]) VALUES (14, 5, 5, N'returned', N'Cập nhật trạng thái thành returned', CAST(N'2025-03-29T16:47:58.3800000' AS DateTime2))
GO
INSERT [dbo].[order_history] ([id], [order_id], [updated_by], [status], [notes], [updated_at]) VALUES (15, 6, 4, N'pending', N'Đơn hàng mới được tạo', CAST(N'2025-03-29T16:48:45.9633333' AS DateTime2))
GO
INSERT [dbo].[order_history] ([id], [order_id], [updated_by], [status], [notes], [updated_at]) VALUES (16, 6, 5, N'processing', N'Cập nhật trạng thái thành processing', CAST(N'2025-03-29T16:48:55.4100000' AS DateTime2))
GO
INSERT [dbo].[order_history] ([id], [order_id], [updated_by], [status], [notes], [updated_at]) VALUES (17, 6, 5, N'shipping', N'Cập nhật trạng thái thành shipping', CAST(N'2025-03-29T16:49:09.7800000' AS DateTime2))
GO
INSERT [dbo].[order_history] ([id], [order_id], [updated_by], [status], [notes], [updated_at]) VALUES (18, 6, 5, N'completed', N'Cập nhật trạng thái thành completed', CAST(N'2025-03-29T16:49:21.6833333' AS DateTime2))
GO
INSERT [dbo].[order_history] ([id], [order_id], [updated_by], [status], [notes], [updated_at]) VALUES (19, 7, 4, N'pending', N'Đơn hàng mới được tạo', CAST(N'2025-03-29T16:50:40.9633333' AS DateTime2))
GO
INSERT [dbo].[order_history] ([id], [order_id], [updated_by], [status], [notes], [updated_at]) VALUES (20, 7, 5, N'processing', N'Cập nhật trạng thái thành processing', CAST(N'2025-03-29T16:50:54.2633333' AS DateTime2))
GO
INSERT [dbo].[order_history] ([id], [order_id], [updated_by], [status], [notes], [updated_at]) VALUES (21, 7, 5, N'shipping', N'Cập nhật trạng thái thành shipping', CAST(N'2025-03-29T16:51:06.3933333' AS DateTime2))
GO
INSERT [dbo].[order_history] ([id], [order_id], [updated_by], [status], [notes], [updated_at]) VALUES (22, 7, 5, N'completed', N'Cập nhật trạng thái thành completed', CAST(N'2025-03-29T16:51:17.9600000' AS DateTime2))
GO
INSERT [dbo].[order_history] ([id], [order_id], [updated_by], [status], [notes], [updated_at]) VALUES (23, 8, 4, N'pending', N'Đơn hàng mới được tạo', CAST(N'2025-03-29T16:53:10.3966667' AS DateTime2))
GO
INSERT [dbo].[order_history] ([id], [order_id], [updated_by], [status], [notes], [updated_at]) VALUES (24, 8, 5, N'processing', N'Cập nhật trạng thái thành processing', CAST(N'2025-03-29T16:53:19.3566667' AS DateTime2))
GO
INSERT [dbo].[order_history] ([id], [order_id], [updated_by], [status], [notes], [updated_at]) VALUES (25, 8, 5, N'shipping', N'Cập nhật trạng thái thành shipping', CAST(N'2025-03-29T16:53:30.2933333' AS DateTime2))
GO
INSERT [dbo].[order_history] ([id], [order_id], [updated_by], [status], [notes], [updated_at]) VALUES (26, 8, 5, N'completed', N'Cập nhật trạng thái thành completed', CAST(N'2025-03-29T16:53:57.3466667' AS DateTime2))
GO
INSERT [dbo].[order_history] ([id], [order_id], [updated_by], [status], [notes], [updated_at]) VALUES (27, 9, 6, N'pending', N'Đơn hàng mới được tạo', CAST(N'2025-03-29T16:55:41.7633333' AS DateTime2))
GO
INSERT [dbo].[order_history] ([id], [order_id], [updated_by], [status], [notes], [updated_at]) VALUES (28, 9, 5, N'processing', N'Cập nhật trạng thái thành processing', CAST(N'2025-03-29T16:55:50.0966667' AS DateTime2))
GO
INSERT [dbo].[order_history] ([id], [order_id], [updated_by], [status], [notes], [updated_at]) VALUES (29, 9, 5, N'shipping', N'Cập nhật trạng thái thành shipping', CAST(N'2025-03-29T16:56:03.0400000' AS DateTime2))
GO
INSERT [dbo].[order_history] ([id], [order_id], [updated_by], [status], [notes], [updated_at]) VALUES (30, 9, 5, N'completed', N'Cập nhật trạng thái thành completed', CAST(N'2025-03-29T16:56:07.8433333' AS DateTime2))
GO
INSERT [dbo].[order_history] ([id], [order_id], [updated_by], [status], [notes], [updated_at]) VALUES (31, 10, 6, N'pending', N'Đơn hàng mới được tạo', CAST(N'2025-03-29T17:00:11.3066667' AS DateTime2))
GO
INSERT [dbo].[order_history] ([id], [order_id], [updated_by], [status], [notes], [updated_at]) VALUES (32, 10, 5, N'processing', N'Cập nhật trạng thái thành processing', CAST(N'2025-03-29T17:00:49.4700000' AS DateTime2))
GO
INSERT [dbo].[order_history] ([id], [order_id], [updated_by], [status], [notes], [updated_at]) VALUES (33, 10, 5, N'shipping', N'Cập nhật trạng thái thành shipping', CAST(N'2025-03-29T17:01:05.3133333' AS DateTime2))
GO
INSERT [dbo].[order_history] ([id], [order_id], [updated_by], [status], [notes], [updated_at]) VALUES (34, 10, 5, N'completed', N'Cập nhật trạng thái thành completed', CAST(N'2025-03-29T17:01:10.2266667' AS DateTime2))
GO
INSERT [dbo].[order_history] ([id], [order_id], [updated_by], [status], [notes], [updated_at]) VALUES (35, 11, 6, N'pending', N'Đơn hàng mới được tạo', CAST(N'2025-03-29T17:01:41.6500000' AS DateTime2))
GO
INSERT [dbo].[order_history] ([id], [order_id], [updated_by], [status], [notes], [updated_at]) VALUES (36, 12, 6, N'pending', N'Đơn hàng mới được tạo', CAST(N'2025-03-29T17:02:02.8800000' AS DateTime2))
GO
INSERT [dbo].[order_history] ([id], [order_id], [updated_by], [status], [notes], [updated_at]) VALUES (37, 12, 5, N'processing', N'Cập nhật trạng thái thành processing', CAST(N'2025-03-29T17:02:13.7933333' AS DateTime2))
GO
INSERT [dbo].[order_history] ([id], [order_id], [updated_by], [status], [notes], [updated_at]) VALUES (38, 13, 8, N'pending', N'Đơn hàng mới được tạo', CAST(N'2025-03-29T17:03:45.7166667' AS DateTime2))
GO
INSERT [dbo].[order_history] ([id], [order_id], [updated_by], [status], [notes], [updated_at]) VALUES (39, 13, 5, N'processing', N'Cập nhật trạng thái thành processing', CAST(N'2025-03-29T17:03:50.0400000' AS DateTime2))
GO
INSERT [dbo].[order_history] ([id], [order_id], [updated_by], [status], [notes], [updated_at]) VALUES (40, 13, 5, N'shipping', N'Cập nhật trạng thái thành shipping', CAST(N'2025-03-29T17:04:04.3433333' AS DateTime2))
GO
INSERT [dbo].[order_history] ([id], [order_id], [updated_by], [status], [notes], [updated_at]) VALUES (41, 13, 5, N'completed', N'Cập nhật trạng thái thành completed', CAST(N'2025-03-29T17:04:09.4966667' AS DateTime2))
GO
INSERT [dbo].[order_history] ([id], [order_id], [updated_by], [status], [notes], [updated_at]) VALUES (42, 14, 8, N'pending', N'Đơn hàng mới được tạo', CAST(N'2025-03-29T17:04:40.2566667' AS DateTime2))
GO
INSERT [dbo].[order_history] ([id], [order_id], [updated_by], [status], [notes], [updated_at]) VALUES (43, 14, 5, N'processing', N'Cập nhật trạng thái thành processing', CAST(N'2025-03-29T17:04:45.1566667' AS DateTime2))
GO
INSERT [dbo].[order_history] ([id], [order_id], [updated_by], [status], [notes], [updated_at]) VALUES (44, 14, 5, N'shipping', N'Cập nhật trạng thái thành shipping', CAST(N'2025-03-29T17:04:59.4300000' AS DateTime2))
GO
INSERT [dbo].[order_history] ([id], [order_id], [updated_by], [status], [notes], [updated_at]) VALUES (45, 15, 8, N'pending', N'Đơn hàng mới được tạo', CAST(N'2025-03-29T17:05:48.0266667' AS DateTime2))
GO
INSERT [dbo].[order_history] ([id], [order_id], [updated_by], [status], [notes], [updated_at]) VALUES (46, 15, 5, N'cancelled', N'Cập nhật trạng thái thành cancelled', CAST(N'2025-03-29T17:06:00.9900000' AS DateTime2))
GO
INSERT [dbo].[order_history] ([id], [order_id], [updated_by], [status], [notes], [updated_at]) VALUES (47, 16, 8, N'pending', N'Đơn hàng mới được tạo', CAST(N'2025-03-29T17:06:30.3133333' AS DateTime2))
GO
INSERT [dbo].[order_history] ([id], [order_id], [updated_by], [status], [notes], [updated_at]) VALUES (48, 16, 5, N'processing', N'Cập nhật trạng thái thành processing', CAST(N'2025-03-29T17:06:36.5400000' AS DateTime2))
GO
INSERT [dbo].[order_history] ([id], [order_id], [updated_by], [status], [notes], [updated_at]) VALUES (49, 16, 5, N'shipping', N'Cập nhật trạng thái thành shipping', CAST(N'2025-03-29T17:06:46.6666667' AS DateTime2))
GO
INSERT [dbo].[order_history] ([id], [order_id], [updated_by], [status], [notes], [updated_at]) VALUES (50, 16, 5, N'returned', N'Cập nhật trạng thái thành returned', CAST(N'2025-03-29T17:06:52.3766667' AS DateTime2))
GO
INSERT [dbo].[order_history] ([id], [order_id], [updated_by], [status], [notes], [updated_at]) VALUES (51, 17, 12, N'pending', N'Đơn hàng mới được tạo', CAST(N'2025-03-29T17:08:06.7833333' AS DateTime2))
GO
INSERT [dbo].[order_history] ([id], [order_id], [updated_by], [status], [notes], [updated_at]) VALUES (52, 17, 5, N'processing', N'Cập nhật trạng thái thành processing', CAST(N'2025-03-29T17:08:12.1266667' AS DateTime2))
GO
INSERT [dbo].[order_history] ([id], [order_id], [updated_by], [status], [notes], [updated_at]) VALUES (53, 17, 5, N'shipping', N'Cập nhật trạng thái thành shipping', CAST(N'2025-03-29T17:08:34.5966667' AS DateTime2))
GO
INSERT [dbo].[order_history] ([id], [order_id], [updated_by], [status], [notes], [updated_at]) VALUES (54, 17, 5, N'completed', N'Cập nhật trạng thái thành completed', CAST(N'2025-03-29T17:08:40.9600000' AS DateTime2))
GO
INSERT [dbo].[order_history] ([id], [order_id], [updated_by], [status], [notes], [updated_at]) VALUES (55, 18, 12, N'pending', N'Đơn hàng mới được tạo', CAST(N'2025-03-29T17:10:13.9733333' AS DateTime2))
GO
INSERT [dbo].[order_history] ([id], [order_id], [updated_by], [status], [notes], [updated_at]) VALUES (56, 18, 5, N'processing', N'Cập nhật trạng thái thành processing', CAST(N'2025-03-29T17:10:24.3600000' AS DateTime2))
GO
INSERT [dbo].[order_history] ([id], [order_id], [updated_by], [status], [notes], [updated_at]) VALUES (57, 18, 5, N'shipping', N'Cập nhật trạng thái thành shipping', CAST(N'2025-03-29T17:10:35.4966667' AS DateTime2))
GO
INSERT [dbo].[order_history] ([id], [order_id], [updated_by], [status], [notes], [updated_at]) VALUES (58, 18, 5, N'completed', N'Cập nhật trạng thái thành completed', CAST(N'2025-03-29T17:10:40.6600000' AS DateTime2))
GO
INSERT [dbo].[order_history] ([id], [order_id], [updated_by], [status], [notes], [updated_at]) VALUES (59, 19, 12, N'pending', N'Đơn hàng mới được tạo', CAST(N'2025-03-29T17:11:04.2933333' AS DateTime2))
GO
INSERT [dbo].[order_history] ([id], [order_id], [updated_by], [status], [notes], [updated_at]) VALUES (60, 19, 5, N'cancelled', N'Cập nhật trạng thái thành cancelled', CAST(N'2025-03-29T17:11:08.6933333' AS DateTime2))
GO
INSERT [dbo].[order_history] ([id], [order_id], [updated_by], [status], [notes], [updated_at]) VALUES (61, 20, 7, N'pending', N'Đơn hàng mới được tạo', CAST(N'2025-03-29T17:44:38.0933333' AS DateTime2))
GO
INSERT [dbo].[order_history] ([id], [order_id], [updated_by], [status], [notes], [updated_at]) VALUES (62, 20, 5, N'processing', N'Cập nhật trạng thái thành processing', CAST(N'2025-03-29T17:45:21.7400000' AS DateTime2))
GO
INSERT [dbo].[order_history] ([id], [order_id], [updated_by], [status], [notes], [updated_at]) VALUES (63, 20, 5, N'shipping', N'Cập nhật trạng thái thành shipping', CAST(N'2025-03-29T17:45:34.0266667' AS DateTime2))
GO
INSERT [dbo].[order_history] ([id], [order_id], [updated_by], [status], [notes], [updated_at]) VALUES (64, 20, 5, N'completed', N'Cập nhật trạng thái thành completed', CAST(N'2025-03-29T17:45:39.6200000' AS DateTime2))
GO
INSERT [dbo].[order_history] ([id], [order_id], [updated_by], [status], [notes], [updated_at]) VALUES (65, 21, 7, N'pending', N'Đơn hàng mới được tạo', CAST(N'2025-03-29T17:48:01.3533333' AS DateTime2))
GO
INSERT [dbo].[order_history] ([id], [order_id], [updated_by], [status], [notes], [updated_at]) VALUES (66, 21, 5, N'processing', N'Cập nhật trạng thái thành processing', CAST(N'2025-03-29T17:48:08.7433333' AS DateTime2))
GO
INSERT [dbo].[order_history] ([id], [order_id], [updated_by], [status], [notes], [updated_at]) VALUES (67, 21, 5, N'shipping', N'Cập nhật trạng thái thành shipping', CAST(N'2025-03-29T17:48:20.0433333' AS DateTime2))
GO
INSERT [dbo].[order_history] ([id], [order_id], [updated_by], [status], [notes], [updated_at]) VALUES (68, 21, 5, N'completed', N'Cập nhật trạng thái thành completed', CAST(N'2025-03-29T17:48:29.0633333' AS DateTime2))
GO
INSERT [dbo].[order_history] ([id], [order_id], [updated_by], [status], [notes], [updated_at]) VALUES (69, 22, 6, N'pending', N'Đơn hàng mới được tạo', CAST(N'2025-03-29T17:52:29.4133333' AS DateTime2))
GO
INSERT [dbo].[order_history] ([id], [order_id], [updated_by], [status], [notes], [updated_at]) VALUES (70, 22, 5, N'processing', N'Cập nhật trạng thái thành processing', CAST(N'2025-03-29T17:52:35.2766667' AS DateTime2))
GO
INSERT [dbo].[order_history] ([id], [order_id], [updated_by], [status], [notes], [updated_at]) VALUES (71, 22, 5, N'shipping', N'Cập nhật trạng thái thành shipping', CAST(N'2025-03-29T17:52:44.9300000' AS DateTime2))
GO
INSERT [dbo].[order_history] ([id], [order_id], [updated_by], [status], [notes], [updated_at]) VALUES (72, 22, 5, N'completed', N'Cập nhật trạng thái thành completed', CAST(N'2025-03-29T17:52:50.5066667' AS DateTime2))
GO
INSERT [dbo].[order_history] ([id], [order_id], [updated_by], [status], [notes], [updated_at]) VALUES (73, 23, 4, N'pending', N'Đơn hàng mới được tạo', CAST(N'2025-03-29T20:03:29.4500000' AS DateTime2))
GO
INSERT [dbo].[order_history] ([id], [order_id], [updated_by], [status], [notes], [updated_at]) VALUES (74, 23, 1, N'pending_pay', N'Đang chờ thanh toán', CAST(N'2025-03-29T20:03:29.4733333' AS DateTime2))
GO
INSERT [dbo].[order_history] ([id], [order_id], [updated_by], [status], [notes], [updated_at]) VALUES (75, 23, 4, N'pending_pay', NULL, CAST(N'2025-03-29T20:03:29.4766667' AS DateTime2))
GO
INSERT [dbo].[order_history] ([id], [order_id], [updated_by], [status], [notes], [updated_at]) VALUES (76, 24, 4, N'pending', N'Đơn hàng mới được tạo', CAST(N'2025-03-29T20:04:49.0066667' AS DateTime2))
GO
INSERT [dbo].[order_history] ([id], [order_id], [updated_by], [status], [notes], [updated_at]) VALUES (77, 24, 1, N'pending_pay', N'Đã thanh toán thành công', CAST(N'2025-03-29T20:04:49.0233333' AS DateTime2))
GO
INSERT [dbo].[order_history] ([id], [order_id], [updated_by], [status], [notes], [updated_at]) VALUES (78, 24, 4, N'processing', NULL, CAST(N'2025-03-29T20:04:49.0233333' AS DateTime2))
GO
INSERT [dbo].[order_history] ([id], [order_id], [updated_by], [status], [notes], [updated_at]) VALUES (79, 25, 4, N'pending', N'Đơn hàng mới được tạo', CAST(N'2025-03-29T20:06:00.3500000' AS DateTime2))
GO
INSERT [dbo].[order_history] ([id], [order_id], [updated_by], [status], [notes], [updated_at]) VALUES (80, 25, 1, N'pending_pay', N'Đã thanh toán thành công', CAST(N'2025-03-29T20:06:00.3633333' AS DateTime2))
GO
INSERT [dbo].[order_history] ([id], [order_id], [updated_by], [status], [notes], [updated_at]) VALUES (81, 25, 4, N'processing', NULL, CAST(N'2025-03-29T20:06:00.3633333' AS DateTime2))
GO
INSERT [dbo].[order_history] ([id], [order_id], [updated_by], [status], [notes], [updated_at]) VALUES (82, 25, 1, N'shipping', N'Cập nhật trạng thái thành shipping', CAST(N'2025-03-29T20:06:22.0566667' AS DateTime2))
GO
INSERT [dbo].[order_history] ([id], [order_id], [updated_by], [status], [notes], [updated_at]) VALUES (83, 25, 1, N'completed', N'Cập nhật trạng thái thành completed', CAST(N'2025-03-29T20:06:27.8533333' AS DateTime2))
GO
INSERT [dbo].[order_history] ([id], [order_id], [updated_by], [status], [notes], [updated_at]) VALUES (84, 26, 4, N'pending', N'Đơn hàng mới được tạo', CAST(N'2025-03-29T20:07:59.0366667' AS DateTime2))
GO
INSERT [dbo].[order_history] ([id], [order_id], [updated_by], [status], [notes], [updated_at]) VALUES (85, 26, 1, N'pending_pay', N'Đã thanh toán thành công', CAST(N'2025-03-29T20:07:59.0500000' AS DateTime2))
GO
INSERT [dbo].[order_history] ([id], [order_id], [updated_by], [status], [notes], [updated_at]) VALUES (86, 26, 4, N'processing', NULL, CAST(N'2025-03-29T20:07:59.0500000' AS DateTime2))
GO
INSERT [dbo].[order_history] ([id], [order_id], [updated_by], [status], [notes], [updated_at]) VALUES (87, 26, 1, N'shipping', N'Cập nhật trạng thái thành shipping', CAST(N'2025-03-29T20:08:20.0000000' AS DateTime2))
GO
INSERT [dbo].[order_history] ([id], [order_id], [updated_by], [status], [notes], [updated_at]) VALUES (88, 26, 1, N'returned', N'Cập nhật trạng thái thành returned', CAST(N'2025-03-29T20:08:25.3466667' AS DateTime2))
GO
INSERT [dbo].[order_history] ([id], [order_id], [updated_by], [status], [notes], [updated_at]) VALUES (89, 23, 1, N'pending_pay', N'Đang chờ thanh toán', CAST(N'2025-03-29T20:16:52.6333333' AS DateTime2))
GO
SET IDENTITY_INSERT [dbo].[order_history] OFF
GO
SET IDENTITY_INSERT [dbo].[payments] ON 
GO
INSERT [dbo].[payments] ([id], [order_id], [payment_method], [payment_status], [transaction_id], [created_at]) VALUES (1, 1, N'cod', N'pending', NULL, CAST(N'2025-03-29T16:43:48.4300000' AS DateTime2))
GO
INSERT [dbo].[payments] ([id], [order_id], [payment_method], [payment_status], [transaction_id], [created_at]) VALUES (2, 2, N'cod', N'pending', NULL, CAST(N'2025-03-29T16:44:30.2633333' AS DateTime2))
GO
INSERT [dbo].[payments] ([id], [order_id], [payment_method], [payment_status], [transaction_id], [created_at]) VALUES (3, 3, N'cod', N'pending', NULL, CAST(N'2025-03-29T16:45:14.6000000' AS DateTime2))
GO
INSERT [dbo].[payments] ([id], [order_id], [payment_method], [payment_status], [transaction_id], [created_at]) VALUES (4, 4, N'cod', N'completed', NULL, CAST(N'2025-03-29T16:46:57.8200000' AS DateTime2))
GO
INSERT [dbo].[payments] ([id], [order_id], [payment_method], [payment_status], [transaction_id], [created_at]) VALUES (5, 5, N'cod', N'refunded', NULL, CAST(N'2025-03-29T16:47:58.3800000' AS DateTime2))
GO
INSERT [dbo].[payments] ([id], [order_id], [payment_method], [payment_status], [transaction_id], [created_at]) VALUES (6, 6, N'cod', N'completed', NULL, CAST(N'2025-03-29T16:49:21.6833333' AS DateTime2))
GO
INSERT [dbo].[payments] ([id], [order_id], [payment_method], [payment_status], [transaction_id], [created_at]) VALUES (7, 7, N'cod', N'completed', NULL, CAST(N'2025-03-29T16:51:17.9600000' AS DateTime2))
GO
INSERT [dbo].[payments] ([id], [order_id], [payment_method], [payment_status], [transaction_id], [created_at]) VALUES (8, 8, N'cod', N'completed', NULL, CAST(N'2025-03-29T16:53:57.3500000' AS DateTime2))
GO
INSERT [dbo].[payments] ([id], [order_id], [payment_method], [payment_status], [transaction_id], [created_at]) VALUES (9, 9, N'cod', N'completed', NULL, CAST(N'2025-03-29T16:56:07.8433333' AS DateTime2))
GO
INSERT [dbo].[payments] ([id], [order_id], [payment_method], [payment_status], [transaction_id], [created_at]) VALUES (10, 10, N'cod', N'completed', NULL, CAST(N'2025-03-29T17:01:10.2300000' AS DateTime2))
GO
INSERT [dbo].[payments] ([id], [order_id], [payment_method], [payment_status], [transaction_id], [created_at]) VALUES (11, 11, N'cod', N'pending', NULL, CAST(N'2025-03-29T17:01:41.6500000' AS DateTime2))
GO
INSERT [dbo].[payments] ([id], [order_id], [payment_method], [payment_status], [transaction_id], [created_at]) VALUES (12, 12, N'cod', N'pending', NULL, CAST(N'2025-03-29T17:02:02.8800000' AS DateTime2))
GO
INSERT [dbo].[payments] ([id], [order_id], [payment_method], [payment_status], [transaction_id], [created_at]) VALUES (13, 13, N'cod', N'completed', NULL, CAST(N'2025-03-29T17:04:09.4966667' AS DateTime2))
GO
INSERT [dbo].[payments] ([id], [order_id], [payment_method], [payment_status], [transaction_id], [created_at]) VALUES (14, 14, N'cod', N'pending', NULL, CAST(N'2025-03-29T17:04:40.2500000' AS DateTime2))
GO
INSERT [dbo].[payments] ([id], [order_id], [payment_method], [payment_status], [transaction_id], [created_at]) VALUES (15, 15, N'cod', N'pending', NULL, CAST(N'2025-03-29T17:05:48.0233333' AS DateTime2))
GO
INSERT [dbo].[payments] ([id], [order_id], [payment_method], [payment_status], [transaction_id], [created_at]) VALUES (16, 16, N'cod', N'refunded', NULL, CAST(N'2025-03-29T17:06:52.3766667' AS DateTime2))
GO
INSERT [dbo].[payments] ([id], [order_id], [payment_method], [payment_status], [transaction_id], [created_at]) VALUES (17, 17, N'cod', N'completed', NULL, CAST(N'2025-03-29T17:08:40.9600000' AS DateTime2))
GO
INSERT [dbo].[payments] ([id], [order_id], [payment_method], [payment_status], [transaction_id], [created_at]) VALUES (18, 18, N'cod', N'completed', NULL, CAST(N'2025-03-29T17:10:40.6600000' AS DateTime2))
GO
INSERT [dbo].[payments] ([id], [order_id], [payment_method], [payment_status], [transaction_id], [created_at]) VALUES (19, 19, N'cod', N'pending', NULL, CAST(N'2025-03-29T17:11:04.2900000' AS DateTime2))
GO
INSERT [dbo].[payments] ([id], [order_id], [payment_method], [payment_status], [transaction_id], [created_at]) VALUES (20, 20, N'cod', N'completed', NULL, CAST(N'2025-03-29T17:45:39.6233333' AS DateTime2))
GO
INSERT [dbo].[payments] ([id], [order_id], [payment_method], [payment_status], [transaction_id], [created_at]) VALUES (21, 21, N'cod', N'completed', NULL, CAST(N'2025-03-29T17:48:29.0666667' AS DateTime2))
GO
INSERT [dbo].[payments] ([id], [order_id], [payment_method], [payment_status], [transaction_id], [created_at]) VALUES (22, 22, N'cod', N'completed', NULL, CAST(N'2025-03-29T17:52:50.5066667' AS DateTime2))
GO
INSERT [dbo].[payments] ([id], [order_id], [payment_method], [payment_status], [transaction_id], [created_at]) VALUES (23, 23, N'bank_transfer', N'pending', NULL, CAST(N'2025-03-29T20:03:29.4366667' AS DateTime2))
GO
INSERT [dbo].[payments] ([id], [order_id], [payment_method], [payment_status], [transaction_id], [created_at]) VALUES (24, 24, N'bank_transfer', N'completed', NULL, CAST(N'2025-03-29T20:04:49.0066667' AS DateTime2))
GO
INSERT [dbo].[payments] ([id], [order_id], [payment_method], [payment_status], [transaction_id], [created_at]) VALUES (25, 25, N'bank_transfer', N'completed', NULL, CAST(N'2025-03-29T20:06:27.8533333' AS DateTime2))
GO
INSERT [dbo].[payments] ([id], [order_id], [payment_method], [payment_status], [transaction_id], [created_at]) VALUES (26, 26, N'bank_transfer', N'refunded', NULL, CAST(N'2025-03-29T20:08:25.3500000' AS DateTime2))
GO
SET IDENTITY_INSERT [dbo].[payments] OFF
GO
SET IDENTITY_INSERT [dbo].[shipping] ON 
GO
INSERT [dbo].[shipping] ([id], [order_id], [shipping_provider], [tracking_number], [estimated_delivery], [delivered_at]) VALUES (1, 1, N'Standard Delivery', N'TEMP-1-1743241428436', CAST(N'2025-04-03' AS Date), NULL)
GO
INSERT [dbo].[shipping] ([id], [order_id], [shipping_provider], [tracking_number], [estimated_delivery], [delivered_at]) VALUES (2, 2, N'J&T Express', N'ExpSUP1234', CAST(N'2025-03-31' AS Date), NULL)
GO
INSERT [dbo].[shipping] ([id], [order_id], [shipping_provider], [tracking_number], [estimated_delivery], [delivered_at]) VALUES (3, 3, N'Standard Delivery', N'TEMP-3-1743241514603', CAST(N'2025-04-03' AS Date), NULL)
GO
INSERT [dbo].[shipping] ([id], [order_id], [shipping_provider], [tracking_number], [estimated_delivery], [delivered_at]) VALUES (4, 4, N'J&T Express', N'ExpSUP1243', CAST(N'2025-03-31' AS Date), NULL)
GO
INSERT [dbo].[shipping] ([id], [order_id], [shipping_provider], [tracking_number], [estimated_delivery], [delivered_at]) VALUES (5, 5, N'J&T Express', N'ExpSUP5823', CAST(N'2025-03-31' AS Date), NULL)
GO
INSERT [dbo].[shipping] ([id], [order_id], [shipping_provider], [tracking_number], [estimated_delivery], [delivered_at]) VALUES (6, 6, N'J&T Express', N'ExpSUP5443', CAST(N'2025-03-31' AS Date), NULL)
GO
INSERT [dbo].[shipping] ([id], [order_id], [shipping_provider], [tracking_number], [estimated_delivery], [delivered_at]) VALUES (7, 7, N'J&T Express', N'ExpSUP5334', CAST(N'2025-03-31' AS Date), NULL)
GO
INSERT [dbo].[shipping] ([id], [order_id], [shipping_provider], [tracking_number], [estimated_delivery], [delivered_at]) VALUES (8, 8, N'J&T Express', N'ExpSUP7765', CAST(N'2025-03-31' AS Date), NULL)
GO
INSERT [dbo].[shipping] ([id], [order_id], [shipping_provider], [tracking_number], [estimated_delivery], [delivered_at]) VALUES (9, 9, N'J&T Express', N'ExpSUP1786', CAST(N'2025-03-31' AS Date), NULL)
GO
INSERT [dbo].[shipping] ([id], [order_id], [shipping_provider], [tracking_number], [estimated_delivery], [delivered_at]) VALUES (10, 10, N'J&T Express', N'ExpSUP5765', CAST(N'2025-04-03' AS Date), NULL)
GO
INSERT [dbo].[shipping] ([id], [order_id], [shipping_provider], [tracking_number], [estimated_delivery], [delivered_at]) VALUES (11, 11, N'Standard Delivery', N'TEMP-11-1743242501651', CAST(N'2025-04-03' AS Date), NULL)
GO
INSERT [dbo].[shipping] ([id], [order_id], [shipping_provider], [tracking_number], [estimated_delivery], [delivered_at]) VALUES (12, 12, N'Standard Delivery', N'TEMP-12-1743242522883', CAST(N'2025-04-03' AS Date), NULL)
GO
INSERT [dbo].[shipping] ([id], [order_id], [shipping_provider], [tracking_number], [estimated_delivery], [delivered_at]) VALUES (13, 13, N'J&T Express', N'ExpSUP5086', CAST(N'2025-03-31' AS Date), NULL)
GO
INSERT [dbo].[shipping] ([id], [order_id], [shipping_provider], [tracking_number], [estimated_delivery], [delivered_at]) VALUES (14, 14, N'J&T Express', N'ExpSUP1654', CAST(N'2025-03-31' AS Date), NULL)
GO
INSERT [dbo].[shipping] ([id], [order_id], [shipping_provider], [tracking_number], [estimated_delivery], [delivered_at]) VALUES (15, 15, N'Express Delivery', N'TEMP-15-1743242748027', CAST(N'2025-03-31' AS Date), NULL)
GO
INSERT [dbo].[shipping] ([id], [order_id], [shipping_provider], [tracking_number], [estimated_delivery], [delivered_at]) VALUES (16, 16, N'J&T Express', N'ExpSUP5555', CAST(N'2025-03-31' AS Date), NULL)
GO
INSERT [dbo].[shipping] ([id], [order_id], [shipping_provider], [tracking_number], [estimated_delivery], [delivered_at]) VALUES (17, 17, N'J&T Express', N'ExpSUP5355', CAST(N'2025-03-31' AS Date), NULL)
GO
INSERT [dbo].[shipping] ([id], [order_id], [shipping_provider], [tracking_number], [estimated_delivery], [delivered_at]) VALUES (18, 18, N'J&T Express', N'ExpSUP3563', CAST(N'2025-03-31' AS Date), NULL)
GO
INSERT [dbo].[shipping] ([id], [order_id], [shipping_provider], [tracking_number], [estimated_delivery], [delivered_at]) VALUES (19, 19, N'Standard Delivery', N'TEMP-19-1743243064292', CAST(N'2025-04-03' AS Date), NULL)
GO
INSERT [dbo].[shipping] ([id], [order_id], [shipping_provider], [tracking_number], [estimated_delivery], [delivered_at]) VALUES (20, 20, N'J&T Express', N'ExpSUP5344', CAST(N'2025-03-31' AS Date), NULL)
GO
INSERT [dbo].[shipping] ([id], [order_id], [shipping_provider], [tracking_number], [estimated_delivery], [delivered_at]) VALUES (21, 21, N'J&T Express', N'ExpSUP3456', CAST(N'2025-03-31' AS Date), NULL)
GO
INSERT [dbo].[shipping] ([id], [order_id], [shipping_provider], [tracking_number], [estimated_delivery], [delivered_at]) VALUES (22, 22, N'J&T Express', N'ExpSUP5435', CAST(N'2025-04-03' AS Date), NULL)
GO
INSERT [dbo].[shipping] ([id], [order_id], [shipping_provider], [tracking_number], [estimated_delivery], [delivered_at]) VALUES (23, 23, N'Standard Delivery', N'TEMP-23-1743253409442', CAST(N'2025-04-03' AS Date), NULL)
GO
INSERT [dbo].[shipping] ([id], [order_id], [shipping_provider], [tracking_number], [estimated_delivery], [delivered_at]) VALUES (24, 24, N'Express Delivery', N'TEMP-24-1743253489007', CAST(N'2025-03-31' AS Date), NULL)
GO
INSERT [dbo].[shipping] ([id], [order_id], [shipping_provider], [tracking_number], [estimated_delivery], [delivered_at]) VALUES (25, 25, N'VNExpress', N'VNE1532289965255', CAST(N'2025-04-03' AS Date), NULL)
GO
INSERT [dbo].[shipping] ([id], [order_id], [shipping_provider], [tracking_number], [estimated_delivery], [delivered_at]) VALUES (26, 26, N'VNExpress', N'VNE153228996524', CAST(N'2025-04-03' AS Date), NULL)
GO
SET IDENTITY_INSERT [dbo].[shipping] OFF
GO
SET IDENTITY_INSERT [dbo].[coupons] ON 
GO
INSERT [dbo].[coupons] ([id], [code], [discount_type], [discount_value], [min_order_amount], [max_discount], [usage_limit], [used_count], [expiry_date], [activation_date], [created_at], [coupon_type], [status]) VALUES (1, N'ABC123XYZ', N'percentage', CAST(10.00 AS Decimal(10, 2)), CAST(50000.00 AS Decimal(10, 2)), CAST(100000.00 AS Decimal(10, 2)), 50, 4, CAST(N'2025-06-30T23:59:59.0000000' AS DateTime2), CAST(N'2025-02-19T13:42:03.3666667' AS DateTime2), CAST(N'2025-02-19T13:42:03.3666667' AS DateTime2), N'normal', N'active')
GO
INSERT [dbo].[coupons] ([id], [code], [discount_type], [discount_value], [min_order_amount], [max_discount], [usage_limit], [used_count], [expiry_date], [activation_date], [created_at], [coupon_type], [status]) VALUES (2, N'DEF456UVW', N'fixed', CAST(20000.00 AS Decimal(10, 2)), CAST(100000.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), 100, 1, CAST(N'2025-07-31T23:59:59.0000000' AS DateTime2), CAST(N'2025-02-19T13:42:03.3666667' AS DateTime2), CAST(N'2025-02-19T13:42:03.3666667' AS DateTime2), N'normal', N'active')
GO
INSERT [dbo].[coupons] ([id], [code], [discount_type], [discount_value], [min_order_amount], [max_discount], [usage_limit], [used_count], [expiry_date], [activation_date], [created_at], [coupon_type], [status]) VALUES (3, N'GHI789RST', N'percentage', CAST(15.00 AS Decimal(10, 2)), CAST(75000.00 AS Decimal(10, 2)), CAST(150000.00 AS Decimal(10, 2)), 75, 3, CAST(N'2025-08-31T23:59:59.0000000' AS DateTime2), CAST(N'2025-02-19T13:42:03.3666667' AS DateTime2), CAST(N'2025-02-19T13:42:03.3666667' AS DateTime2), N'normal', N'active')
GO
INSERT [dbo].[coupons] ([id], [code], [discount_type], [discount_value], [min_order_amount], [max_discount], [usage_limit], [used_count], [expiry_date], [activation_date], [created_at], [coupon_type], [status]) VALUES (4, N'JKL012PQR', N'fixed', CAST(30000.00 AS Decimal(10, 2)), CAST(150000.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), 200, 1, CAST(N'2025-09-30T23:59:59.0000000' AS DateTime2), CAST(N'2025-02-19T13:42:03.3666667' AS DateTime2), CAST(N'2025-02-19T13:42:03.3666667' AS DateTime2), N'normal', N'active')
GO
INSERT [dbo].[coupons] ([id], [code], [discount_type], [discount_value], [min_order_amount], [max_discount], [usage_limit], [used_count], [expiry_date], [activation_date], [created_at], [coupon_type], [status]) VALUES (5, N'MNO345NOP', N'percentage', CAST(20.00 AS Decimal(10, 2)), CAST(200000.00 AS Decimal(10, 2)), CAST(200000.00 AS Decimal(10, 2)), 50, 0, CAST(N'2025-10-31T23:59:59.0000000' AS DateTime2), CAST(N'2025-02-19T13:42:03.3666667' AS DateTime2), CAST(N'2025-02-19T13:42:03.3666667' AS DateTime2), N'normal', N'active')
GO
INSERT [dbo].[coupons] ([id], [code], [discount_type], [discount_value], [min_order_amount], [max_discount], [usage_limit], [used_count], [expiry_date], [activation_date], [created_at], [coupon_type], [status]) VALUES (6, N'STU678KLM', N'fixed', CAST(50000.00 AS Decimal(10, 2)), CAST(250000.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), 25, 2, CAST(N'2025-11-30T23:59:59.0000000' AS DateTime2), CAST(N'2025-02-19T13:42:03.3666667' AS DateTime2), CAST(N'2025-02-19T13:42:03.3666667' AS DateTime2), N'normal', N'active')
GO
INSERT [dbo].[coupons] ([id], [code], [discount_type], [discount_value], [min_order_amount], [max_discount], [usage_limit], [used_count], [expiry_date], [activation_date], [created_at], [coupon_type], [status]) VALUES (7, N'VWX901HIJ', N'percentage', CAST(25.00 AS Decimal(10, 2)), CAST(300000.00 AS Decimal(10, 2)), CAST(250000.00 AS Decimal(10, 2)), 100, 2, CAST(N'2025-12-31T23:59:59.0000000' AS DateTime2), CAST(N'2025-02-19T13:42:03.3666667' AS DateTime2), CAST(N'2025-02-19T13:42:03.3666667' AS DateTime2), N'normal', N'active')
GO
INSERT [dbo].[coupons] ([id], [code], [discount_type], [discount_value], [min_order_amount], [max_discount], [usage_limit], [used_count], [expiry_date], [activation_date], [created_at], [coupon_type], [status]) VALUES (8, N'YZA234EFG', N'fixed', CAST(15000.00 AS Decimal(10, 2)), CAST(80000.00 AS Decimal(10, 2)), NULL, 150, 0, CAST(N'2026-01-31T23:59:59.0000000' AS DateTime2), CAST(N'2025-04-01T00:00:00.0000000' AS DateTime2), CAST(N'2025-02-19T13:42:03.3666667' AS DateTime2), N'normal', N'inactive')
GO
INSERT [dbo].[coupons] ([id], [code], [discount_type], [discount_value], [min_order_amount], [max_discount], [usage_limit], [used_count], [expiry_date], [activation_date], [created_at], [coupon_type], [status]) VALUES (9, N'BCD567BCD', N'percentage', CAST(30.00 AS Decimal(10, 2)), CAST(400000.00 AS Decimal(10, 2)), CAST(300000.00 AS Decimal(10, 2)), 30, 0, CAST(N'2026-02-28T23:59:59.0000000' AS DateTime2), CAST(N'2025-05-01T00:00:00.0000000' AS DateTime2), CAST(N'2025-02-19T13:42:03.3666667' AS DateTime2), N'normal', N'inactive')
GO
INSERT [dbo].[coupons] ([id], [code], [discount_type], [discount_value], [min_order_amount], [max_discount], [usage_limit], [used_count], [expiry_date], [activation_date], [created_at], [coupon_type], [status]) VALUES (10, N'EFG890YZA', N'fixed', CAST(25000.00 AS Decimal(10, 2)), CAST(120000.00 AS Decimal(10, 2)), NULL, 75, 0, CAST(N'2026-03-31T23:59:59.0000000' AS DateTime2), CAST(N'2025-06-01T00:00:00.0000000' AS DateTime2), CAST(N'2025-02-19T13:42:03.3666667' AS DateTime2), N'normal', N'inactive')
GO
INSERT [dbo].[coupons] ([id], [code], [discount_type], [discount_value], [min_order_amount], [max_discount], [usage_limit], [used_count], [expiry_date], [activation_date], [created_at], [coupon_type], [status]) VALUES (11, N'HIJ123VWX', N'percentage', CAST(5.00 AS Decimal(10, 2)), CAST(25000.00 AS Decimal(10, 2)), CAST(50000.00 AS Decimal(10, 2)), 500, 0, CAST(N'2026-04-30T23:59:59.0000000' AS DateTime2), CAST(N'2025-07-01T00:00:00.0000000' AS DateTime2), CAST(N'2025-02-19T13:42:03.3666667' AS DateTime2), N'normal', N'inactive')
GO
INSERT [dbo].[coupons] ([id], [code], [discount_type], [discount_value], [min_order_amount], [max_discount], [usage_limit], [used_count], [expiry_date], [activation_date], [created_at], [coupon_type], [status]) VALUES (12, N'KLM456STU', N'fixed', CAST(10000.00 AS Decimal(10, 2)), CAST(50000.00 AS Decimal(10, 2)), NULL, NULL, 0, CAST(N'2026-05-31T23:59:59.0000000' AS DateTime2), CAST(N'2025-08-01T00:00:00.0000000' AS DateTime2), CAST(N'2025-02-19T13:42:03.3666667' AS DateTime2), N'normal', N'inactive')
GO
INSERT [dbo].[coupons] ([id], [code], [discount_type], [discount_value], [min_order_amount], [max_discount], [usage_limit], [used_count], [expiry_date], [activation_date], [created_at], [coupon_type], [status]) VALUES (13, N'NOP789MNO', N'percentage', CAST(12.50 AS Decimal(10, 2)), CAST(60000.00 AS Decimal(10, 2)), CAST(125000.00 AS Decimal(10, 2)), 250, 0, CAST(N'2026-06-30T23:59:59.0000000' AS DateTime2), CAST(N'2025-09-01T00:00:00.0000000' AS DateTime2), CAST(N'2025-02-19T13:42:03.3666667' AS DateTime2), N'normal', N'inactive')
GO
INSERT [dbo].[coupons] ([id], [code], [discount_type], [discount_value], [min_order_amount], [max_discount], [usage_limit], [used_count], [expiry_date], [activation_date], [created_at], [coupon_type], [status]) VALUES (14, N'QRS012JKL', N'fixed', CAST(40000.00 AS Decimal(10, 2)), CAST(200000.00 AS Decimal(10, 2)), NULL, 40, 0, CAST(N'2025-01-31T23:59:59.0000000' AS DateTime2), CAST(N'2024-12-01T00:00:00.0000000' AS DateTime2), CAST(N'2025-02-19T13:42:03.3666667' AS DateTime2), N'normal', N'expired')
GO
INSERT [dbo].[coupons] ([id], [code], [discount_type], [discount_value], [min_order_amount], [max_discount], [usage_limit], [used_count], [expiry_date], [activation_date], [created_at], [coupon_type], [status]) VALUES (15, N'TUV345GHI', N'percentage', CAST(35.00 AS Decimal(10, 2)), CAST(500000.00 AS Decimal(10, 2)), CAST(350000.00 AS Decimal(10, 2)), 20, 0, CAST(N'2025-01-28T23:59:59.0000000' AS DateTime2), CAST(N'2024-11-01T00:00:00.0000000' AS DateTime2), CAST(N'2025-02-19T13:42:03.3666667' AS DateTime2), N'normal', N'expired')
GO
SET IDENTITY_INSERT [dbo].[coupons] OFF
GO
SET IDENTITY_INSERT [dbo].[order_coupons] ON 
GO
INSERT [dbo].[order_coupons] ([id], [order_id], [coupon_id], [user_email], [discount_applied], [created_at]) VALUES (1, 1, 3, N'user123@gmail.com', CAST(150000.00 AS Decimal(10, 2)), CAST(N'2025-03-29T16:43:48.4300000' AS DateTime2))
GO
INSERT [dbo].[order_coupons] ([id], [order_id], [coupon_id], [user_email], [discount_applied], [created_at]) VALUES (2, 2, 1, N'user123@gmail.com', CAST(79000.00 AS Decimal(10, 2)), CAST(N'2025-03-29T16:44:30.2666667' AS DateTime2))
GO
INSERT [dbo].[order_coupons] ([id], [order_id], [coupon_id], [user_email], [discount_applied], [created_at]) VALUES (3, 6, 1, N'user123@gmail.com', CAST(23000.00 AS Decimal(10, 2)), CAST(N'2025-03-29T16:48:45.9633333' AS DateTime2))
GO
INSERT [dbo].[order_coupons] ([id], [order_id], [coupon_id], [user_email], [discount_applied], [created_at]) VALUES (4, 7, 6, N'user123@gmail.com', CAST(50000.00 AS Decimal(10, 2)), CAST(N'2025-03-29T16:50:40.9633333' AS DateTime2))
GO
INSERT [dbo].[order_coupons] ([id], [order_id], [coupon_id], [user_email], [discount_applied], [created_at]) VALUES (5, 8, 7, N'user123@gmail.com', CAST(250000.00 AS Decimal(10, 2)), CAST(N'2025-03-29T16:53:10.3933333' AS DateTime2))
GO
INSERT [dbo].[order_coupons] ([id], [order_id], [coupon_id], [user_email], [discount_applied], [created_at]) VALUES (6, 9, 6, N'user321@gmail.com', CAST(50000.00 AS Decimal(10, 2)), CAST(N'2025-03-29T16:55:41.7566667' AS DateTime2))
GO
INSERT [dbo].[order_coupons] ([id], [order_id], [coupon_id], [user_email], [discount_applied], [created_at]) VALUES (7, 14, 1, N'Medusa@gmail.com', CAST(15000.00 AS Decimal(10, 2)), CAST(N'2025-03-29T17:04:40.2533333' AS DateTime2))
GO
INSERT [dbo].[order_coupons] ([id], [order_id], [coupon_id], [user_email], [discount_applied], [created_at]) VALUES (8, 15, 2, N'Medusa@gmail.com', CAST(20000.00 AS Decimal(10, 2)), CAST(N'2025-03-29T17:05:48.0233333' AS DateTime2))
GO
INSERT [dbo].[order_coupons] ([id], [order_id], [coupon_id], [user_email], [discount_applied], [created_at]) VALUES (9, 20, 3, N'XiaoDing@gmail.com', CAST(102000.00 AS Decimal(10, 2)), CAST(N'2025-03-29T17:44:38.0833333' AS DateTime2))
GO
INSERT [dbo].[order_coupons] ([id], [order_id], [coupon_id], [user_email], [discount_applied], [created_at]) VALUES (10, 21, 7, N'XiaoDing@gmail.com', CAST(250000.00 AS Decimal(10, 2)), CAST(N'2025-03-29T17:48:01.3500000' AS DateTime2))
GO
INSERT [dbo].[order_coupons] ([id], [order_id], [coupon_id], [user_email], [discount_applied], [created_at]) VALUES (11, 22, 3, N'user321@gmail.com', CAST(42000.00 AS Decimal(10, 2)), CAST(N'2025-03-29T17:52:29.4133333' AS DateTime2))
GO
INSERT [dbo].[order_coupons] ([id], [order_id], [coupon_id], [user_email], [discount_applied], [created_at]) VALUES (12, 23, 4, N'user123@gmail.com', CAST(30000.00 AS Decimal(10, 2)), CAST(N'2025-03-29T20:03:29.4400000' AS DateTime2))
GO
INSERT [dbo].[order_coupons] ([id], [order_id], [coupon_id], [user_email], [discount_applied], [created_at]) VALUES (13, 25, 1, N'user123@gmail.com', CAST(23000.00 AS Decimal(10, 2)), CAST(N'2025-03-29T20:06:00.3500000' AS DateTime2))
GO
SET IDENTITY_INSERT [dbo].[order_coupons] OFF
GO
SET IDENTITY_INSERT [dbo].[feedback_images] ON 
GO
INSERT [dbo].[feedback_images] ([id], [feedback_id], [image_url], [created_at]) VALUES (1, 1, N'uploads/feedbackImages/070ce861-9c8a-4478-8fb6-df993dee99ab_de69784b858a7264233a5e6033892006.jpg', CAST(N'2025-03-29T17:22:11.5400000' AS DateTime2))
GO
INSERT [dbo].[feedback_images] ([id], [feedback_id], [image_url], [created_at]) VALUES (2, 2, N'uploads/feedbackImages/ed390b42-fc2b-449e-8136-38ada3a16fdf_tải xuống (1).jpg', CAST(N'2025-03-29T17:22:11.5466667' AS DateTime2))
GO
INSERT [dbo].[feedback_images] ([id], [feedback_id], [image_url], [created_at]) VALUES (3, 2, N'uploads/feedbackImages/eb6d60d9-e9c0-436c-9c9b-884341745188_tải xuống.jpg', CAST(N'2025-03-29T17:22:11.5500000' AS DateTime2))
GO
INSERT [dbo].[feedback_images] ([id], [feedback_id], [image_url], [created_at]) VALUES (4, 3, N'uploads/feedbackImages/0b0b1228-ef80-4ae5-bac3-3304d198fd2a_6c290dbf7934111c4a28b3a34853a34d.jpg', CAST(N'2025-03-29T17:22:11.5533333' AS DateTime2))
GO
INSERT [dbo].[feedback_images] ([id], [feedback_id], [image_url], [created_at]) VALUES (5, 4, N'uploads/feedbackImages/83b34c1c-830f-43a9-9cbf-0c29e652917a_tải xuống (2).jpg', CAST(N'2025-03-29T17:22:11.5600000' AS DateTime2))
GO
INSERT [dbo].[feedback_images] ([id], [feedback_id], [image_url], [created_at]) VALUES (6, 5, N'uploads/feedbackImages/2261b7a7-9384-4b7a-bde7-a02119d427f0_tải xuống (3).jpg', CAST(N'2025-03-29T17:22:11.5633333' AS DateTime2))
GO
INSERT [dbo].[feedback_images] ([id], [feedback_id], [image_url], [created_at]) VALUES (7, 5, N'uploads/feedbackImages/34b5ef7f-77a2-423c-81d2-cdaa2290a143_tải xuống (4).jpg', CAST(N'2025-03-29T17:22:11.5666667' AS DateTime2))
GO
INSERT [dbo].[feedback_images] ([id], [feedback_id], [image_url], [created_at]) VALUES (8, 6, N'uploads/feedbackImages/3c0ea5ae-f270-498a-9d1f-f40811b3c20f_tải xuống (5).jpg', CAST(N'2025-03-29T17:23:29.9733333' AS DateTime2))
GO
INSERT [dbo].[feedback_images] ([id], [feedback_id], [image_url], [created_at]) VALUES (9, 9, N'uploads/feedbackImages/97183adf-ecd9-40a5-b94c-39feb5227dae_tải xuống (6).jpg', CAST(N'2025-03-29T17:26:23.8600000' AS DateTime2))
GO
INSERT [dbo].[feedback_images] ([id], [feedback_id], [image_url], [created_at]) VALUES (10, 9, N'uploads/feedbackImages/2761dff5-388e-4314-af82-cb8624f3696b_tải xuống (7).jpg', CAST(N'2025-03-29T17:26:23.8633333' AS DateTime2))
GO
INSERT [dbo].[feedback_images] ([id], [feedback_id], [image_url], [created_at]) VALUES (11, 10, N'uploads/feedbackImages/397ab628-aa76-4200-8e06-d4848067a053_hma00117_85eaac1325cf492ca3953a7f1efed089_master.webp', CAST(N'2025-03-29T17:28:21.6133333' AS DateTime2))
GO
INSERT [dbo].[feedback_images] ([id], [feedback_id], [image_url], [created_at]) VALUES (12, 11, N'uploads/feedbackImages/62cc50bf-a1a1-46b2-929d-0c5775c3e00c_tải xuống (8).jpg', CAST(N'2025-03-29T17:28:21.6166667' AS DateTime2))
GO
INSERT [dbo].[feedback_images] ([id], [feedback_id], [image_url], [created_at]) VALUES (13, 11, N'uploads/feedbackImages/a41331fe-4e67-4f31-949b-26fe0bb88b87_tải xuống (9).jpg', CAST(N'2025-03-29T17:28:21.6200000' AS DateTime2))
GO
INSERT [dbo].[feedback_images] ([id], [feedback_id], [image_url], [created_at]) VALUES (14, 14, N'uploads/feedbackImages/3b289aa8-bf10-4fac-8533-a4e2765251be_tải xuống (10).jpg', CAST(N'2025-03-29T17:51:07.8100000' AS DateTime2))
GO
INSERT [dbo].[feedback_images] ([id], [feedback_id], [image_url], [created_at]) VALUES (15, 16, N'uploads/feedbackImages/690995c2-dc59-4117-80e1-5025a9fcb10e_tải xuống (11).jpg', CAST(N'2025-03-29T17:51:07.8166667' AS DateTime2))
GO
INSERT [dbo].[feedback_images] ([id], [feedback_id], [image_url], [created_at]) VALUES (16, 16, N'uploads/feedbackImages/3c7742c3-b361-44d7-81f4-6bcb61df6025_tải xuống (12).jpg', CAST(N'2025-03-29T17:51:07.8200000' AS DateTime2))
GO
SET IDENTITY_INSERT [dbo].[feedback_images] OFF
GO
SET IDENTITY_INSERT [dbo].[footer_settings] ON 
GO
INSERT [dbo].[footer_settings] ([id], [type], [field_name], [value], [image], [status]) VALUES (1, N'info', N'Tên cửa hàng', N'Fashion Store', NULL, N'active')
GO
INSERT [dbo].[footer_settings] ([id], [type], [field_name], [value], [image], [status]) VALUES (2, N'info', N'Giới thiệu', N'Chuyên bán quần áo thời trang', NULL, N'active')
GO
INSERT [dbo].[footer_settings] ([id], [type], [field_name], [value], [image], [status]) VALUES (3, N'contact', N'Email', N'support@fashionstore.com', NULL, N'active')
GO
INSERT [dbo].[footer_settings] ([id], [type], [field_name], [value], [image], [status]) VALUES (4, N'contact', N'Địa chỉ', N'thôn 4, xã Thạch Hòa, huyện Thạch Thất, Hà Nội', NULL, N'active')
GO
INSERT [dbo].[footer_settings] ([id], [type], [field_name], [value], [image], [status]) VALUES (5, N'contact', N'Tổng đài hỗ trợ', N'+84 123 456 789', NULL, N'active')
GO
INSERT [dbo].[footer_settings] ([id], [type], [field_name], [value], [image], [status]) VALUES (6, N'social', N'Facebook', N'https://facebook.com/fashion', N'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT83dd8_4WZCT-LsYC477q2WKocjms9OHCg0g&s', N'active')
GO
INSERT [dbo].[footer_settings] ([id], [type], [field_name], [value], [image], [status]) VALUES (7, N'social', N'Instagram', N'https://instagram.com/fashion', N'https://cdn-icons-png.freepik.com/256/15707/15707869.png?semt=ais_hybrid', N'active')
GO
SET IDENTITY_INSERT [dbo].[footer_settings] OFF
GO
SET IDENTITY_INSERT [dbo].[sliders] ON 
GO
INSERT [dbo].[sliders] ([id], [title], [image_url], [link], [status], [display_order], [notes]) VALUES (1, N'Cách mạng thời trang thích ứng 2025', N'https://res.cloudinary.com/agnesb-group/image/upload/dpr_auto,f_auto,q_auto/v1/CMC/Content/D%C3%A9fil%C3%A9s/Collection%20Homme%20%C3%A9t%C3%A9%2025/videocolle25_1', N'http://localhost:9999/fashionshop/post?id=18', N'active', 1, N'Khám phá xu hướng đột phá với thiết kế linh hoạt, chất liệu hiện đại và phong cách đa năng')
GO
INSERT [dbo].[sliders] ([id], [title], [image_url], [link], [status], [display_order], [notes]) VALUES (2, N'Thời trang Kỹ thuật số & Metaverse', N'https://luvinus.com/wp-content/uploads/2019/08/y-tuong-thiet-ke-thoi-trang-4.jpg', N'http://localhost:9999/fashionshop/post?id=17', N'active', 2, N'Khám phá sự kết hợp giữa phong cách & công nghệ, mở ra kỷ nguyên thời trang ảo')
GO
INSERT [dbo].[sliders] ([id], [title], [image_url], [link], [status], [display_order], [notes]) VALUES (3, N'Hàng mới về – Thời trang bền vững', N'https://img6.thuthuatphanmem.vn/uploads/2022/03/04/background-thoi-trang-hien-dai-dep_025701441.jpg', N'http://localhost:9999/fashionshop/post?id=16', N'active', 3, N'Diện mạo xuân mới với phong cách thời trang đạo đức, thân thiện với môi trường')
GO
INSERT [dbo].[sliders] ([id], [title], [image_url], [link], [status], [display_order], [notes]) VALUES (4, N'Khám phá phong cách riêng', N'https://img6.thuthuatphanmem.vn/uploads/2022/03/04/background-quang-cao-thoi-trang-quan-ao_025656570.jpg', N'http://localhost:9999/fashionshop/post?id=15', N'active', 4, N'Trang phục thiết kế giúp bạn thể hiện cá tính và dấu ấn độc đáo của riêng mình')
GO
INSERT [dbo].[sliders] ([id], [title], [image_url], [link], [status], [display_order], [notes]) VALUES (5, N'Nhiếp ảnh thời trang & phong cách năng động', N'https://sakurafashion.vn/upload/images_294/photo-5-15585905145021448956672.jpg', N'http://localhost:9999/fashionshop/post?id=14', N'active', 5, N'Ghi lại khoảnh khắc ấn tượng với trang phục thể thao thời thượng trong từng khung hình')
GO
INSERT [dbo].[sliders] ([id], [title], [image_url], [link], [status], [display_order], [notes]) VALUES (6, N'Bước đi bền vững', N'https://dvauthentic.vn/wp-content/uploads/2020/12/06-03.jpg', N'http://localhost:9999/fashionshop/post?id=13', N'active', 6, N'Giày thiết kế thanh lịch, thoải mái và thân thiện với môi trường cho ngày trọng đại')
GO
INSERT [dbo].[sliders] ([id], [title], [image_url], [link], [status], [display_order], [notes]) VALUES (7, N'Tuần lễ thời trang áo dài', N'https://lamia.com.vn/storage/ao-dai-cach-tan-phoi-hoa-tiet-1.jpg', N'http://localhost:9999/fashionshop/post?id=12', N'inactive', 7, N'Áo dài duyên dáng và thoải mái cho mọi lứa tuổi')
GO
INSERT [dbo].[sliders] ([id], [title], [image_url], [link], [status], [display_order], [notes]) VALUES (8, N'Mẹo thời trang tiết kiệm', N'https://chaubui.net/wp-content/uploads/2023/07/tdg4.jpg', N'http://localhost:9999/fashionshop/post?id=11', N'active', 8, N'Tỏa sáng với phong cách ấn tượng mà không cần chi tiêu quá nhiều')
GO
INSERT [dbo].[sliders] ([id], [title], [image_url], [link], [status], [display_order], [notes]) VALUES (9, N'Thời trang công nghệ cao', N'https://media.vneconomy.vn/w800/images/upload/2022/09/15/avaa.png', N'http://localhost:9999/fashionshop/post?id=10', N'active', 9, N'Trang phục thông minh, tích hợp công nghệ cho phong cách đột phá')
GO
INSERT [dbo].[sliders] ([id], [title], [image_url], [link], [status], [display_order], [notes]) VALUES (10, N'Hướng dẫn quà tặng ngày lễ', N'https://bazaarvietnam.vn/wp-content/uploads/2020/07/iris-van-herpen-haute-couture-xuan-2020-0-thumb.jpg', N'http://localhost:9999/fashionshop/post?id=9', N'inactive', 10, N'Ý tưởng quà tặng hoàn hảo cho những người thân yêu của bạn')
GO
INSERT [dbo].[sliders] ([id], [title], [image_url], [link], [status], [display_order], [notes]) VALUES (11, N'Phong cách & thoải mái – Quần hoàn hảo', N'https://bizweb.dktcdn.net/thumb/1024x1024/100/350/935/articles/phoi-do-voi-ao-so-mi-trang-nam.jpg?v=1567229232163', N'http://localhost:9999/fashionshop/productdetail?id=32', N'active', 11, N'Nâng cấp tủ quần áo – Quần thanh lịch, ấm áp & linh hoạt')
GO
INSERT [dbo].[sliders] ([id], [title], [image_url], [link], [status], [display_order], [notes]) VALUES (12, N'Duyên dáng & thanh lịch – Váy hoàn hảo', N'https://cdn.vistyle.vn/sites/11/2023/04/cach-phoi-do-voi-chan-vay-jean-dai-thumb.jpeg', N'http://localhost:9999/fashionshop/productdetail?id=31', N'active', 12, N'Tôn vinh thanh lịch – Váy sang trọng, thoải mái & đa năng nâng tầm phong cách')
GO
INSERT [dbo].[sliders] ([id], [title], [image_url], [link], [status], [display_order], [notes]) VALUES (13, N'Thanh lịch vượt thời gian – Nhẫn hoàn hảo', N'https://toigingiuvedep.vn/wp-content/uploads/2021/10/hinh-anh-nhan-cuoi-dep-gan-ket-yeu-thuong-giua-vo-va-chong-1.jpg', N'http://localhost:9999/fashionshop/productdetail?id=30', N'active', 13, N'Kỷ niệm mọi dịp – Nhẫn thanh lịch, ý nghĩa & rực rỡ')
GO
INSERT [dbo].[sliders] ([id], [title], [image_url], [link], [status], [display_order], [notes]) VALUES (14, N'Dễ thương & thoải mái – Áo phông cho bé', N'https://sadesign.vn/wp-content/uploads/2021/04/cach-chup-anh-quan-ao-tre-em-dep.jpg', N'http://localhost:9999/fashionshop/productdetail?id=29', N'active', 14, N'Dễ thương & ấm áp – Áo sơ mi trẻ em mềm mại, thời trang & vui tươi')
GO
INSERT [dbo].[sliders] ([id], [title], [image_url], [link], [status], [display_order], [notes]) VALUES (15, N'Thoải mái mỗi bước – Đôi dép hoàn hảo', N'https://img5.thuthuatphanmem.vn/uploads/2022/01/17/anh-doi-dep-cao-su-huyen-thoai-thoi-chien-tranh_022810339.jpg', N'http://localhost:9999/fashionshop/productdetail?id=28', N'active', 15, N'Thư giãn phong cách – Dép nhẹ, êm ái & thời trang mỗi ngày')
GO
SET IDENTITY_INSERT [dbo].[sliders] OFF
GO
