--상품 테이블
create table product_list(
	p_no number(38) primary key		--상품 번호
	,p_name varchar2(50) not null	--상품 이름
	,p_before_price number(38) not null --할인 전 가격
	,p_price number(38) not null	--상품 가격
	,p_amount number(38) not null	--상품 수량
	,p_sold number(38) default 0	--결제 수량
	,p_img1 varchar2(150) not null	--상품 이미지
	,p_img2 varchar2(150) not null	--상품 이미지(마우스 오버)
	,p_choice number(38) default 0	--상품 추천유무 (0,1) 0은 추천x, 1은 추천 o
	,p_class varchar2(30) not null	--상위 카테고리 (ex: Bed)
	,p_category varchar2(30) not null--하위 카테고리 (ex: Single)
	,p_date date					--상품 등록 날짜
	,p_info varchar2(4000) not null --상품 정보
	,p_color varchar2(1000) not null--상품 색
	,p_size varchar2(2000) not null --상품 사이즈
);

update  product_list set p_choice = 0;

commit;

Insert into PRODUCT_LIST (P_NO,P_NAME,P_BEFORE_PRICE,P_PRICE,P_AMOUNT,P_SOLD,P_IMG1,P_IMG2,P_CHOICE,P_CLASS,P_CATEGORY,P_DATE,P_INFO,P_COLOR,P_SIZE) values (6,'싱글침대 01',329000,219000,5,0,'/2023-4-19/product202341936059252.png','/2023-4-19/product202341936059252_on.png',1,'bed','single',to_date('23/04/19','RR/MM/DD'),'극강의 포근함
이것이 모빌리아의 싱글침대!','기본','1000x2000x200mm');
Insert into PRODUCT_LIST (P_NO,P_NAME,P_BEFORE_PRICE,P_PRICE,P_AMOUNT,P_SOLD,P_IMG1,P_IMG2,P_CHOICE,P_CLASS,P_CATEGORY,P_DATE,P_INFO,P_COLOR,P_SIZE) values (26,'슈퍼 싱글침대02',329000,229000,5,0,'/2023-4-19/product202341912874108.jpg','/2023-4-19/product202341912874108_on.jpg',0,'bed','super single',to_date('23/04/19','RR/MM/DD'),'무난한 색상
모빌리아 슈퍼 싱글침대','기본','1100x2000x200mm');
Insert into PRODUCT_LIST (P_NO,P_NAME,P_BEFORE_PRICE,P_PRICE,P_AMOUNT,P_SOLD,P_IMG1,P_IMG2,P_CHOICE,P_CLASS,P_CATEGORY,P_DATE,P_INFO,P_COLOR,P_SIZE) values (13,'가죽 흙침대',886000,529000,5,0,'/2023-4-19/product20234195981923.jpg','/2023-4-19/product20234195981923_on.jpg',1,'bed','double',to_date('23/04/19','RR/MM/DD'),'평범한 침대가 지겹다면
모빌리아만의 기술로 만든
흙침대 어떠세요?','베이지,블랙','1400x2000x200mm');
Insert into PRODUCT_LIST (P_NO,P_NAME,P_BEFORE_PRICE,P_PRICE,P_AMOUNT,P_SOLD,P_IMG1,P_IMG2,P_CHOICE,P_CLASS,P_CATEGORY,P_DATE,P_INFO,P_COLOR,P_SIZE) values (19,'푹신한 구름침대',436000,259000,5,0,'/2023-4-19/product202341935594962.jpg','/2023-4-19/product202341935594962_on.jpg',1,'bed','double',to_date('23/04/19','RR/MM/DD'),'일상생활에 지쳐있는 당신에게
모빌리아가 추천드립니다!
푹~신한 구름침대','화이트,그레이','1400x2000x200mm');
Insert into PRODUCT_LIST (P_NO,P_NAME,P_BEFORE_PRICE,P_PRICE,P_AMOUNT,P_SOLD,P_IMG1,P_IMG2,P_CHOICE,P_CLASS,P_CATEGORY,P_DATE,P_INFO,P_COLOR,P_SIZE) values (35,'모빌리아 라텍스 침대',740000,465000,5,0,'/2023-4-19/product202341960220218.jpg','/2023-4-19/product202341960220218_on.jpg',0,'bed','queen',to_date('23/04/19','RR/MM/DD'),'너무 푹신한 침대가 싫다면
모빌리아 라텍스 침대!','베이지,다크그레이','1500x2000x200mm');
Insert into PRODUCT_LIST (P_NO,P_NAME,P_BEFORE_PRICE,P_PRICE,P_AMOUNT,P_SOLD,P_IMG1,P_IMG2,P_CHOICE,P_CLASS,P_CATEGORY,P_DATE,P_INFO,P_COLOR,P_SIZE) values (18,'기본침대',240000,135000,5,0,'/2023-4-19/product202341927617856.jpg','/2023-4-19/product202341927617856_on.jpg',0,'bed','single',to_date('23/04/19','RR/MM/DD'),'심플하게 자연 그대로의 
느낌을 적용한
모빌리아 기본 나무침대','기본','1000x2000x200mm');
Insert into PRODUCT_LIST (P_NO,P_NAME,P_BEFORE_PRICE,P_PRICE,P_AMOUNT,P_SOLD,P_IMG1,P_IMG2,P_CHOICE,P_CLASS,P_CATEGORY,P_DATE,P_INFO,P_COLOR,P_SIZE) values (33,'킹사이즈 침대',1390000,999000,5,0,'/2023-4-19/product20234194728523.jpg','/2023-4-19/product20234194728523_on.jpg',1,'bed','king',to_date('23/04/19','RR/MM/DD'),'킹중의 킹!!
모빌리아만의 사이즈로
넓은 침대를 사용하실 수 있습니다.','화이트,그레이','1800x2000x200');
Insert into PRODUCT_LIST (P_NO,P_NAME,P_BEFORE_PRICE,P_PRICE,P_AMOUNT,P_SOLD,P_IMG1,P_IMG2,P_CHOICE,P_CLASS,P_CATEGORY,P_DATE,P_INFO,P_COLOR,P_SIZE) values (23,'종합침대',289000,189000,5,0,'/2023-4-19/product202341972417599.jpg','/2023-4-19/product202341972417599_on.jpg',1,'bed','single',to_date('23/04/19','RR/MM/DD'),'고객의 취향에 맞춰
여러가지의 색상과
원하는 사이즈를 고른다!
모빌리아 종합침대!!!','브라운,라이트 그레이,민트,딥 그레이','1000x2000x200mm,1100x2000x200mm,1400x2000x200mm,1500x2000x200mm,1800x2000x200m');
Insert into PRODUCT_LIST (P_NO,P_NAME,P_BEFORE_PRICE,P_PRICE,P_AMOUNT,P_SOLD,P_IMG1,P_IMG2,P_CHOICE,P_CLASS,P_CATEGORY,P_DATE,P_INFO,P_COLOR,P_SIZE) values (4,'리클라이너 소파01',250000,211300,5,0,'/2023-4-19/product202341985486803.jpg','/2023-4-19/product202341985486803_on.jpg',0,'sofa','리클라이너 소파',to_date('23/04/19','RR/MM/DD'),'바이안 아슬란 1인용 리클라이너 소파','기본','1100x450mm');
Insert into PRODUCT_LIST (P_NO,P_NAME,P_BEFORE_PRICE,P_PRICE,P_AMOUNT,P_SOLD,P_IMG1,P_IMG2,P_CHOICE,P_CLASS,P_CATEGORY,P_DATE,P_INFO,P_COLOR,P_SIZE) values (38,'4인 리클라이너 소파',1720000,1123600,5,0,'/2023-4-19/product202341965300180.jpg','/2023-4-19/product202341965300180_on.jpg',0,'sofa','리클라이너 소파',to_date('23/04/19','RR/MM/DD'),'리클라이너 소파','그레이,네이비','큼');
Insert into PRODUCT_LIST (P_NO,P_NAME,P_BEFORE_PRICE,P_PRICE,P_AMOUNT,P_SOLD,P_IMG1,P_IMG2,P_CHOICE,P_CLASS,P_CATEGORY,P_DATE,P_INFO,P_COLOR,P_SIZE) values (21,'천연가죽 4인 소파',1043000,653000,5,0,'/2023-4-19/product202341930297523.jpg','/2023-4-19/product202341930297523_on.jpg',1,'sofa','카우치형 소파',to_date('23/04/19','RR/MM/DD'),'엘비나 천연가죽 4인소파 + 
카우치 스툴','그레이,베이지 ,초코브라운','2700x960x860mm,930x680x540mm');
Insert into PRODUCT_LIST (P_NO,P_NAME,P_BEFORE_PRICE,P_PRICE,P_AMOUNT,P_SOLD,P_IMG1,P_IMG2,P_CHOICE,P_CLASS,P_CATEGORY,P_DATE,P_INFO,P_COLOR,P_SIZE) values (12,'발수 패브릭 소파',976000,694000,5,0,'/2023-4-19/product20234195501782.jpg','/2023-4-19/product20234195501782_on.jpg',1,'sofa','카우치형 소파',to_date('23/04/19','RR/MM/DD'),'루시 모듈 발수패브릭 소파','민트,라이트핑크,그레이,오트밀','3040x1230x710');
Insert into PRODUCT_LIST (P_NO,P_NAME,P_BEFORE_PRICE,P_PRICE,P_AMOUNT,P_SOLD,P_IMG1,P_IMG2,P_CHOICE,P_CLASS,P_CATEGORY,P_DATE,P_INFO,P_COLOR,P_SIZE) values (22,'이지클린 3인 소파(쿠션포함)',830000,550600,5,0,'/2023-4-19/product202341955375598.jpg','/2023-4-19/product202341955375598_on.jpg',1,'sofa','2~3인용 소파',to_date('23/04/19','RR/MM/DD'),'소티디자인 모아 조야원단
이지클린 3인소파','베이지,그레이','1950x920x1000mm');
Insert into PRODUCT_LIST (P_NO,P_NAME,P_BEFORE_PRICE,P_PRICE,P_AMOUNT,P_SOLD,P_IMG1,P_IMG2,P_CHOICE,P_CLASS,P_CATEGORY,P_DATE,P_INFO,P_COLOR,P_SIZE) values (28,'등받이 조절 2인소파',1340000,893000,5,0,'/2023-4-19/product202341914458978.jpg','/2023-4-19/product202341914458978_on.jpg',0,'sofa','2~3인용 소파',to_date('23/04/19','RR/MM/DD'),'소티디자인 엠마 이지클린
조야원단 등받이조절 소파','그레이베이지,핑크베이지','2300x1150x1030,2800x1150x1030');
Insert into PRODUCT_LIST (P_NO,P_NAME,P_BEFORE_PRICE,P_PRICE,P_AMOUNT,P_SOLD,P_IMG1,P_IMG2,P_CHOICE,P_CLASS,P_CATEGORY,P_DATE,P_INFO,P_COLOR,P_SIZE) values (16,'패브릭 1인소파',184000,84000,5,0,'/2023-4-19/product202341942315089.jpg','/2023-4-19/product202341942315089_on.jpg',0,'sofa','1인용 소파',to_date('23/04/19','RR/MM/DD'),'마니또 아쿠아 패브릭 1인소파','아이보리,스카이블루','730x660x660');
Insert into PRODUCT_LIST (P_NO,P_NAME,P_BEFORE_PRICE,P_PRICE,P_AMOUNT,P_SOLD,P_IMG1,P_IMG2,P_CHOICE,P_CLASS,P_CATEGORY,P_DATE,P_INFO,P_COLOR,P_SIZE) values (36,'조야 패브릭 1인소파',459000,199000,5,0,'/2023-4-19/product202341939553271.jpg','/2023-4-19/product202341939553271_on.jpg',1,'sofa','1인용 소파',to_date('23/04/19','RR/MM/DD'),'바오트 레포스 조야 패브릭 1인 소파','핑크,연그레이,네이비','880x800x680mm');
Insert into PRODUCT_LIST (P_NO,P_NAME,P_BEFORE_PRICE,P_PRICE,P_AMOUNT,P_SOLD,P_IMG1,P_IMG2,P_CHOICE,P_CLASS,P_CATEGORY,P_DATE,P_INFO,P_COLOR,P_SIZE) values (1,'원목 6인 식탁',319000,219000,5,0,'/2023-4-19/product202341944501798.jpg','/2023-4-19/product202341944501798_on.jpg',1,'table','주방용 테이블',to_date('23/04/19','RR/MM/DD'),'오솔레 포세린세라믹 원목 6인 식탁','화이트,라이트브라운','1600x800x730mm');
Insert into PRODUCT_LIST (P_NO,P_NAME,P_BEFORE_PRICE,P_PRICE,P_AMOUNT,P_SOLD,P_IMG1,P_IMG2,P_CHOICE,P_CLASS,P_CATEGORY,P_DATE,P_INFO,P_COLOR,P_SIZE) values (5,'4인 원목 식탁세트',1000000,520200,5,0,'/2023-4-19/product202341972477106.jpg','/2023-4-19/product202341972477106_on.jpg',1,'table','주방용 테이블',to_date('23/04/19','RR/MM/DD'),'러버우드 4인 원목 식탁세트','네추럴,월넛','1300x800x750mm');
Insert into PRODUCT_LIST (P_NO,P_NAME,P_BEFORE_PRICE,P_PRICE,P_AMOUNT,P_SOLD,P_IMG1,P_IMG2,P_CHOICE,P_CLASS,P_CATEGORY,P_DATE,P_INFO,P_COLOR,P_SIZE) values (31,'정면 책상 SET',263000,199000,5,0,'/2023-4-19/product202341927730109.jpg','/2023-4-19/product202341927730109_on.jpg',0,'table','사무용 테이블',to_date('23/04/19','RR/MM/DD'),'제이미 1200 정면 책상','그레이,브라운 ,크림화이트','1200x350x1970mm');
Insert into PRODUCT_LIST (P_NO,P_NAME,P_BEFORE_PRICE,P_PRICE,P_AMOUNT,P_SOLD,P_IMG1,P_IMG2,P_CHOICE,P_CLASS,P_CATEGORY,P_DATE,P_INFO,P_COLOR,P_SIZE) values (41,'LED 정면책상',251000,155000,5,0,'/2023-4-19/product202341960199335.jpg','/2023-4-19/product202341960199335_on.jpg',1,'table','사무용 테이블',to_date('23/04/19','RR/MM/DD'),'켈리 1200 LED 정면책상','그레이화이트,메이플화이트,을화이트','1200x280x2000');
Insert into PRODUCT_LIST (P_NO,P_NAME,P_BEFORE_PRICE,P_PRICE,P_AMOUNT,P_SOLD,P_IMG1,P_IMG2,P_CHOICE,P_CLASS,P_CATEGORY,P_DATE,P_INFO,P_COLOR,P_SIZE) values (44,'인테리어 거실장',187000,122000,5,0,'/2023-4-19/product202341993308068.jpg','/2023-4-19/product202341993308068_on.jpg',1,'table','거실용 테이블',to_date('23/04/19','RR/MM/DD'),'킨더하임 확장형 인테리어 거실장','메이플,메이프그레이콤비,메이플화이트콤비,메이플블랙콤비','2050x400x332mm');
Insert into PRODUCT_LIST (P_NO,P_NAME,P_BEFORE_PRICE,P_PRICE,P_AMOUNT,P_SOLD,P_IMG1,P_IMG2,P_CHOICE,P_CLASS,P_CATEGORY,P_DATE,P_INFO,P_COLOR,P_SIZE) values (2,'3140 거실장',1042500,542000,5,0,'/2023-4-19/product20234197322150.jpg','/2023-4-19/product20234197322150_on.jpg',1,'table','거실용 테이블',to_date('23/04/19','RR/MM/DD'),'루밀라 3140 거실장 세트','그레이,화이트','3140x420x2005');
Insert into PRODUCT_LIST (P_NO,P_NAME,P_BEFORE_PRICE,P_PRICE,P_AMOUNT,P_SOLD,P_IMG1,P_IMG2,P_CHOICE,P_CLASS,P_CATEGORY,P_DATE,P_INFO,P_COLOR,P_SIZE) values (24,'모던 H형 책상',191000,119000,5,0,'/2023-4-19/product202341917447574.jpg','/2023-4-19/product202341917447574_on.jpg',1,'table','H형 책상',to_date('23/04/19','RR/MM/DD'),'클레어 12000 모던 H형책상
책장세트','화이트,아카시아','600x235x1925,480x340x723');
Insert into PRODUCT_LIST (P_NO,P_NAME,P_BEFORE_PRICE,P_PRICE,P_AMOUNT,P_SOLD,P_IMG1,P_IMG2,P_CHOICE,P_CLASS,P_CATEGORY,P_DATE,P_INFO,P_COLOR,P_SIZE) values (34,'원목 H형 책상',586000,371000,5,0,'/2023-4-19/product202341924647211.jpg','/2023-4-19/product202341924647211_on.jpg',0,'table','H형 책상',to_date('23/04/19','RR/MM/DD'),'삼나무 원목 H형 책상 책장 세트','네추럴','880x263x2000mm,1600m,600x580x735+22mm');
Insert into PRODUCT_LIST (P_NO,P_NAME,P_BEFORE_PRICE,P_PRICE,P_AMOUNT,P_SOLD,P_IMG1,P_IMG2,P_CHOICE,P_CLASS,P_CATEGORY,P_DATE,P_INFO,P_COLOR,P_SIZE) values (43,'원목 좌식 1000데스크',330000,205000,5,0,'/2023-4-19/product202341917737731.jpg','/2023-4-19/product202341917737731_on.jpg',0,'table','좌식 책상',to_date('23/04/19','RR/MM/DD'),'편백나무 히노끼원목
좌식 1000데스크','네추럴','1000x600x320mm');
Insert into PRODUCT_LIST (P_NO,P_NAME,P_BEFORE_PRICE,P_PRICE,P_AMOUNT,P_SOLD,P_IMG1,P_IMG2,P_CHOICE,P_CLASS,P_CATEGORY,P_DATE,P_INFO,P_COLOR,P_SIZE) values (8,'거실 낮은 테이블',321000,160200,5,0,'/2023-4-19/product202341938025422.jpg','/2023-4-19/product202341938025422_on.jpg',1,'table','좌식 책상',to_date('23/04/19','RR/MM/DD'),'돌체 1200 서랍 수납 쇼파
커피 거실 낮은 테이블','화이트,그레이,네이비 ,옐로우','1200x600x340mm');
Insert into PRODUCT_LIST (P_NO,P_NAME,P_BEFORE_PRICE,P_PRICE,P_AMOUNT,P_SOLD,P_IMG1,P_IMG2,P_CHOICE,P_CLASS,P_CATEGORY,P_DATE,P_INFO,P_COLOR,P_SIZE) values (40,'옷장01',292000,179000,5,0,'/2023-4-19/product202341912313439.jpg','/2023-4-19/product202341912313439_on.jpg',0,'cabinet','옷장',to_date('23/04/19','RR/MM/DD'),'공간을 넓히는 마법
수납만으로 일상의 많은 것들을
변화시킬 수 있도록 하였습니다.','우드,화이트','1800x200,1200x200');
Insert into PRODUCT_LIST (P_NO,P_NAME,P_BEFORE_PRICE,P_PRICE,P_AMOUNT,P_SOLD,P_IMG1,P_IMG2,P_CHOICE,P_CLASS,P_CATEGORY,P_DATE,P_INFO,P_COLOR,P_SIZE) values (29,'옷장02',237600,182700,5,0,'/2023-4-19/product202341966230744.jpg','/2023-4-19/product202341966230744_on.jpg',0,'cabinet','옷장',to_date('23/04/19','RR/MM/DD'),'편백나무와 견고함을 배가시키는
미송의 콜라보레이션으로 완성한
리얼트리,편백갤러리 장롱','우드','2400x625x1945');
Insert into PRODUCT_LIST (P_NO,P_NAME,P_BEFORE_PRICE,P_PRICE,P_AMOUNT,P_SOLD,P_IMG1,P_IMG2,P_CHOICE,P_CLASS,P_CATEGORY,P_DATE,P_INFO,P_COLOR,P_SIZE) values (11,'드레스룸01',141000,70000,5,0,'/2023-4-19/product20234196941137.jpg','/2023-4-19/product20234196941137_on.jpg',1,'cabinet','드레스룸',to_date('23/04/19','RR/MM/DD'),'다양한 모듈
완벽한 수납
세련된 색상','블랙,화이트,그린','800x350x2100,400x350x2100');
Insert into PRODUCT_LIST (P_NO,P_NAME,P_BEFORE_PRICE,P_PRICE,P_AMOUNT,P_SOLD,P_IMG1,P_IMG2,P_CHOICE,P_CLASS,P_CATEGORY,P_DATE,P_INFO,P_COLOR,P_SIZE) values (7,'드레스룸02',130000,89000,5,0,'/2023-4-19/product202341982579187.jpg','/2023-4-19/product202341982579187_on.jpg',0,'cabinet','드레스룸',to_date('23/04/19','RR/MM/DD'),'내가 꿈꾸던 드레스룸
한번쯤 꿈꿔왔던 드레스룸','블랙,화이트,그레이','600x390x2100');
Insert into PRODUCT_LIST (P_NO,P_NAME,P_BEFORE_PRICE,P_PRICE,P_AMOUNT,P_SOLD,P_IMG1,P_IMG2,P_CHOICE,P_CLASS,P_CATEGORY,P_DATE,P_INFO,P_COLOR,P_SIZE) values (10,'수납장01',169000,119000,5,0,'/2023-4-19/product202341951448632.jpg','/2023-4-19/product202341951448632_on.jpg',1,'cabinet','수납장',to_date('23/04/19','RR/MM/DD'),'다용도 주방 수납장
어느 공간,어느 인테리어에도 
모두 어울리는 수납장','화이트','1000x400x910');
Insert into PRODUCT_LIST (P_NO,P_NAME,P_BEFORE_PRICE,P_PRICE,P_AMOUNT,P_SOLD,P_IMG1,P_IMG2,P_CHOICE,P_CLASS,P_CATEGORY,P_DATE,P_INFO,P_COLOR,P_SIZE) values (9,'수납장02',165000,94000,5,0,'/2023-4-19/product202341945606749.jpg','/2023-4-19/product202341945606749_on.jpg',0,'cabinet','수납장',to_date('23/04/19','RR/MM/DD'),'문라이트 슬라이딩 전신거울 수납장
모던하고 세련되 디자인
공간을 밝고 화사하게','오크,아이보리','600x300x1660');
Insert into PRODUCT_LIST (P_NO,P_NAME,P_BEFORE_PRICE,P_PRICE,P_AMOUNT,P_SOLD,P_IMG1,P_IMG2,P_CHOICE,P_CLASS,P_CATEGORY,P_DATE,P_INFO,P_COLOR,P_SIZE) values (20,'붙박이장01',319000,159000,5,0,'/2023-4-19/product202341985847616.jpg','/2023-4-19/product202341985847616_on.jpg',1,'cabinet','붙박이장',to_date('23/04/19','RR/MM/DD'),'깔끔한 디자인
열기 쉬운 슬라이드형 붙박이장','화이트,아이보리','2700x600x2250');
Insert into PRODUCT_LIST (P_NO,P_NAME,P_BEFORE_PRICE,P_PRICE,P_AMOUNT,P_SOLD,P_IMG1,P_IMG2,P_CHOICE,P_CLASS,P_CATEGORY,P_DATE,P_INFO,P_COLOR,P_SIZE) values (32,'붙박이장02',325000,159000,5,0,'/2023-4-19/product202341925795864.jpg','/2023-4-19/product202341925795864_on.jpg',0,'cabinet','붙박이장',to_date('23/04/19','RR/MM/DD'),'맞춤형 붙박이장은 
일반 옷장과 다릅니다!!','아이보리','2700x600x2250');
Insert into PRODUCT_LIST (P_NO,P_NAME,P_BEFORE_PRICE,P_PRICE,P_AMOUNT,P_SOLD,P_IMG1,P_IMG2,P_CHOICE,P_CLASS,P_CATEGORY,P_DATE,P_INFO,P_COLOR,P_SIZE) values (14,'신발장01',150000,74800,5,0,'/2023-4-19/product202341935079953.jpg','/2023-4-19/product202341935079953_on.jpg',1,'cabinet','신발장',to_date('23/04/19','RR/MM/DD'),'공간의 특별함을 더하다
키큰 신발장','화이트,오크','600x310x1780');
Insert into PRODUCT_LIST (P_NO,P_NAME,P_BEFORE_PRICE,P_PRICE,P_AMOUNT,P_SOLD,P_IMG1,P_IMG2,P_CHOICE,P_CLASS,P_CATEGORY,P_DATE,P_INFO,P_COLOR,P_SIZE) values (27,'신발장02',133000,68800,5,0,'/2023-4-19/product202341985946124.jpg','/2023-4-19/product202341985946124_on.jpg',1,'cabinet','신발장',to_date('23/04/19','RR/MM/DD'),'공간의 특별함을 더하다
낮은 신발장','화이트,오크','600x310x1190');
Insert into PRODUCT_LIST (P_NO,P_NAME,P_BEFORE_PRICE,P_PRICE,P_AMOUNT,P_SOLD,P_IMG1,P_IMG2,P_CHOICE,P_CLASS,P_CATEGORY,P_DATE,P_INFO,P_COLOR,P_SIZE) values (3,'책상의자01',80000,66000,5,0,'/2023-4-19/product202341970022072.jpg','/2023-4-19/product202341970022072_on.jpg',0,'chair','책상 의자',to_date('23/04/19','RR/MM/DD'),'기능성과 실용성을 
겸비한 책상의자','그린,블루,블랙,레드','590x480x1120~220');
Insert into PRODUCT_LIST (P_NO,P_NAME,P_BEFORE_PRICE,P_PRICE,P_AMOUNT,P_SOLD,P_IMG1,P_IMG2,P_CHOICE,P_CLASS,P_CATEGORY,P_DATE,P_INFO,P_COLOR,P_SIZE) values (42,'책상의자02',180000,89000,5,0,'/2023-4-19/product202341934378359.jpg','/2023-4-19/product202341934378359_on.jpg',0,'chair','책상 의자',to_date('23/04/19','RR/MM/DD'),'인체공학적인 디자인 설계로
기능성과 실용성을 겸비한 의자','블랙,레드','610x580x830~900');
Insert into PRODUCT_LIST (P_NO,P_NAME,P_BEFORE_PRICE,P_PRICE,P_AMOUNT,P_SOLD,P_IMG1,P_IMG2,P_CHOICE,P_CLASS,P_CATEGORY,P_DATE,P_INFO,P_COLOR,P_SIZE) values (17,'서재/사무용의자01',318000,145000,5,0,'/2023-4-19/product202341937539232.jpg','/2023-4-19/product202341937539232_on.jpg',1,'chair','서재/사무용 의자',to_date('23/04/19','RR/MM/DD'),'품격있는 디자인과 색상
차원이 다른 고급스러운 푹신함!','브라운,블랙','640x520x1230');
Insert into PRODUCT_LIST (P_NO,P_NAME,P_BEFORE_PRICE,P_PRICE,P_AMOUNT,P_SOLD,P_IMG1,P_IMG2,P_CHOICE,P_CLASS,P_CATEGORY,P_DATE,P_INFO,P_COLOR,P_SIZE) values (15,'게이밍체어01',198000,124000,5,0,'/2023-4-19/product202341982135719.jpg','/2023-4-19/product202341982135719_on.jpg',0,'chair','게이밍 체어',to_date('23/04/19','RR/MM/DD'),'부드럽고 포근한 최고급 소재
안락하고 세련된 디자인!','화이트,블랙','670x520x1190~1270');
Insert into PRODUCT_LIST (P_NO,P_NAME,P_BEFORE_PRICE,P_PRICE,P_AMOUNT,P_SOLD,P_IMG1,P_IMG2,P_CHOICE,P_CLASS,P_CATEGORY,P_DATE,P_INFO,P_COLOR,P_SIZE) values (25,'게이밍체어02',250000,215000,5,0,'/2023-4-19/product202341924423072.jpg','/2023-4-19/product202341924423072_on.jpg',1,'chair','게이밍 체어',to_date('23/04/19','RR/MM/DD'),'극강의 편안함
리모콘을 통해 색을 바꾸는 즐거움!','블랙','690x470x1300~1380');
Insert into PRODUCT_LIST (P_NO,P_NAME,P_BEFORE_PRICE,P_PRICE,P_AMOUNT,P_SOLD,P_IMG1,P_IMG2,P_CHOICE,P_CLASS,P_CATEGORY,P_DATE,P_INFO,P_COLOR,P_SIZE) values (30,'식탁의자01',79800,39800,5,0,'/2023-4-19/product202341949051758.jpg','/2023-4-19/product202341949051758_on.jpg',1,'chair','식탁 의자',to_date('23/04/19','RR/MM/DD'),'컬러의 즐거움!
고혹적인 매력의 디자인!','크림,핑크,그레이','450x520x800');
Insert into PRODUCT_LIST (P_NO,P_NAME,P_BEFORE_PRICE,P_PRICE,P_AMOUNT,P_SOLD,P_IMG1,P_IMG2,P_CHOICE,P_CLASS,P_CATEGORY,P_DATE,P_INFO,P_COLOR,P_SIZE) values (39,'식탁의자02',110000,69000,5,0,'/2023-4-19/product202341934089554.jpg','/2023-4-19/product202341934089554_on.jpg',1,'chair','식탁 의자',to_date('23/04/19','RR/MM/DD'),'가죽 의자를 써보세요
편안함!감각적인 디자인!
모드 느낄수 있습니다!
','브라운,카키,블랙','340x390x800');
Insert into PRODUCT_LIST (P_NO,P_NAME,P_BEFORE_PRICE,P_PRICE,P_AMOUNT,P_SOLD,P_IMG1,P_IMG2,P_CHOICE,P_CLASS,P_CATEGORY,P_DATE,P_INFO,P_COLOR,P_SIZE) values (37,'침대형 의자01',390000,218400,5,0,'/2023-4-19/product202341950159304.jpg','/2023-4-19/product202341950159304_on.jpg',1,'chair','침대형 의자',to_date('23/04/19','RR/MM/DD'),'1인용 리클라이너 눕는의자
최고의 편안함을 느껴보세요.','브라운','680x530x1090~1170');

create sequence product_no_seq
start with 45 -- 1부터 시작
increment by 1 --1씩 증가
nocache; --임시 메모리 사용하지 않겠다는 뜻

----------------------------------------------------------------------------------

select * from product_list order by p_no desc;

select * from (select * from product_list where p_choice=1 order by p_no desc) where ROWNUM <= 8;

select * from PRODUCT_list where p_choice=1 order by p_no desc;

select * from PRODUCT_list;

delete product_list where p_no=54;

delete product_list;
commit;

drop table product_list;

select * from product_list where p_name like '%테%';
select count(p_no) from product_list;
drop sequence product_no_seq;

commit;

update product_list set p_name='수정', p_before_price=1000, p_price=100
			,p_amount=10 where p_no=55;