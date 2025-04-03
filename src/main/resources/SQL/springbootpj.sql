## DATABASE 생성 및 선택
DROP DATABASE IF EXISTS springbootpj;
CREATE DATABASE IF NOT EXISTS springbootpj;
use springbootpj;

-- Table : 게시판, 게시글, 댓글 

# 게시판 테이블 생성
-- 게시판 번호, 게시판 제목
-- board_no, post_no
DROP TABLE IF EXISTS board;
CREATE TABLE IF NOT EXISTS board(
	board_no INTEGER(5) PRIMARY KEY,
	board_title VARCHAR(20) NOT NULL
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

# Board Table에 게시글 추가
INSERT INTO board (board_no, board_title) VALUES (1000, '아시아');
INSERT INTO board (board_no, board_title) VALUES (2000, '유럽');
INSERT INTO board (board_no, board_title) VALUES (3000, '오세아니아');
INSERT INTO board (board_no, board_title) VALUES (4000, '북아메리카');
INSERT INTO board (board_no, board_title) VALUES (5000, '남아메리카');
INSERT INTO board (board_no, board_title) VALUES (6000, '아프리카');
INSERT INTO board (board_no, board_title) VALUES (7000, '공지사항');

# 게시글 테이블 생성
-- 게시판 번호, 게시글 번호, 게시글 제목, 작성자, 게시글 내용, 게시 날짜, 조회수, 파일, (추천, 좋아요)
-- board_no, post_no, post_title, writer, post_content, post_date, view_count, file1
DROP TABLE IF EXISTS post;
CREATE TABLE IF NOT EXISTS post(
	board_no INTEGER(5) NOT NULL,
	post_no INTEGER AUTO_INCREMENT PRIMARY KEY,
	post_title VARCHAR(50) NOT NULL,
	writer VARCHAR(20) NOT NULL,
	post_content VARCHAR(1000) NOT NULL,
	post_date TIMESTAMP NOT NULL,
	view_count INTEGER(10),
	file1 VARCHAR(100),
	good INTEGER DEFAULT 0,
  	bad INTEGER DEFAULT 0,
	
	CONSTRAINT post_fk FOREIGN KEY(board_no) REFERENCES board(board_no)
	) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
	
# Post Table에 게시글 추가
-- 아시아 --
INSERT INTO post (board_no, post_title, writer, post_content, post_date, view_count) VALUES (1000, '한국에서 일본 엔화 환율', 'Kyle', '한국에서 일본 엔화 환율은 매일 변동되던데.. \r\n 은행이나 환전소에서 제공하는 환율에 차이가 있을 수 있어서 어디를 가야 할지 고민이네요 \r\n 수수료도 고려해야 하고 어지럽노', SYSDATE(), 3);
INSERT INTO post (board_no, post_title, writer, post_content, post_date, view_count) VALUES (1000, '대만에서 사용할 수 있는 대중교통 패스 찾으시는 분', 'Kale', '대만에서는 EasyCard나 iPASS를 사용해 MRT와 버스를 편리하게 이용할 수 있더라구요\r\n 또한 관광객을 위한 Taipei Fun Pass는 일정 기간 동안 무제한 대중교통을 이용할 수 있어 인기래요\r\n 다들 걱정 말고 다녀오세요 사소핑~', SYSDATE(), 7);
INSERT INTO post (board_no, post_title, writer, post_content, post_date, view_count) VALUES (1000, '방콕 길거리 음식 진짜 별론데요?', 'Thomas', '아니 위생 너무 더러워요 \r\n 대마 냄새도 장난아니고 그냥 어지럽던데요? \r\n 미식의 나라라면서 맛도 별로 없고 좀 아쉬운데영?', SYSDATE(), 31);
INSERT INTO post (board_no, post_title, writer, post_content, post_date, view_count) VALUES (1000, '3박 4일 OKINAWA 여행 - 아메이로 식당', 'Julia', '언니는 고등어! 나는 돼지고기!\r\n어떤 게 시즌 메뉴였는데.. 그건 기억 안 나고 돼지고기는 생강 맛이 좀 났지만 맛잇었다!!\r\n분위기 좋고 직원분들 매~우 친절하고 맛도 괜찮앗던!!\r\n여기 또 가야겠당..', SYSDATE(), 101);
INSERT INTO post (board_no, post_title, writer, post_content, post_date, view_count) VALUES (1000, '싱가포르에서 택시 요금 다들 명심해~', 'Thomas', '싱가포르의 택시 요금은 기본 요금에 주행 거리와 시간에 따라 추가 요금 붙더라구요.\r\n 밤 시간대, 공항 출발, 혼잡 시간에는 할증이 적용됩니다.\r\n 그랩(Grab) 앱을 이용해 요금을 미리 확인하고 예약할 수 있길래 사용했는데 괜찮더라구요', SYSDATE(), 32);
INSERT INTO post (board_no, post_title, writer, post_content, post_date, view_count) VALUES (1000, '베트남에서 환전할 때 가장 유리한 방법', 'Kale', '베트남에서는 은행, 환전소, 공항 등에서 환전할 수 있지만, \r\n은행이 가장 안전하고 신뢰도가 높습니다. \r\n현지에서 환전할 때는 환율 변동이 크기 때문에 미리 확인하는 것이 좋습니다.', SYSDATE(), 86);
INSERT INTO post (board_no, post_title, writer, post_content, post_date, view_count) VALUES (1000, '홍콩 공항에서 시내로 가는 방법은 무엇이 있나요?', 'Kyle', '홍콩 공항에서 시내로 이동할 때 가장 빠른 방법은 공항 익스프레스(Airport Express)입니다.\r\n버스와 택시도 이용 가능하며, 택시 요금은 거리에 따라 다르고 \r\n 교통 상황에 영향을 받을 수 있으니까 내 아라서 하꼐 !!', SYSDATE(), 9);
INSERT INTO post (board_no, post_title, writer, post_content, post_date, view_count) VALUES (1000, '인도 여행은 별로 안 가고 싶긴 해요', 'Julia', '내가 인도 여행을 간다?\r\n그건 쫌 아니지 않나.. 적어도 주변 환경이 정돈된 그런 나라를 여행하고 싶은데..\r\n막상 여행하면 생각보다 재재밌을지도?!/n근데 전 안 갈래요', SYSDATE(), 23);
INSERT INTO post (board_no, post_title, writer, post_content, post_date, view_count) VALUES (1000, '말레이시아 쿠알라룸푸르에서 꼭 가봐야 할 맛집이 있다??!?', 'Kyle', '이 세상에 맛없는 건 없다고 생각하긴 하는데요 \r\n 쿠알라룸푸르에서는 Jalan Alor 푸드 스트리트가 유명합니다. \r\n다양한 말레이시아 음식과 길거리 음식을 맛볼 수 있는 곳으로, \r\n현지인과 관광객 모두에게 인기가 많습니다.', SYSDATE(), 54);
INSERT INTO post (board_no, post_title, writer, post_content, post_date, view_count) VALUES (1000, 'Kyle과 함께하는 필리핀 세부 여행', 'Kale', '둘이 함께 가는 첫 해외여행지로 필리빈 세부에 가려고 합니다. \r\n 스쿠버 다이빙을 할 예정인데 어디 좋은 곳 있을까요?\r\n라고 물어보고 싶지만 사실 제가 이미 찾아왔어요\r\n 바로 모알보알과 말라파스쿠아라는 곳이랍니다. \r\n 이 여행.. 많이 두근핑~', SYSDATE(), 1);
INSERT INTO post (board_no, post_title, writer, post_content, post_date, view_count) VALUES (1000, '태국 치앙마이에서 방문할 만한 사원은 어디인가요?', 'bokbok', '치앙마이에서 유명한 사원은 왓 프라탓 도이수텝(Wat Phra That Doi Suthep)입니다. \r\n 이 사원은 산 정상에 위치해 있어 치앙마이 시내가 한눈에 보이는 절경을 자랑하며,\r\n 현지 불교 문화도 체험할 수 있습니다.\r\n 오 여기 괜찮은데?', SYSDATE(), 365);
INSERT INTO post (board_no, post_title, writer, post_content, post_date, view_count) VALUES (1000, '베트남 하노이에서 아침 식사로 인기 있는 음식은 무엇인가요?', 'Hyuni', '하노이의 아침 식사로는 쌀국수인 Phở가 가장 인기 있습니다. \r\n현지 식당에서 따뜻한 국물과 신선한 재료로 만든 퍼를 맛볼 수 있으며, 가격도 저렴합니다. \r\n바게트인 Banh Mi도 아침 식사로 많이 먹어서 좀.. 괜찮더라고', SYSDATE(), 46);
INSERT INTO post (board_no, post_title, writer, post_content, post_date, view_count) VALUES (1000, '일본 오사카 여행 시작 !', 'Julia', '오사카가 저의 첫 일본 여행지였는데요\r\n제가 갔을 땐, 생각보다 많이 춥더라구요.. 왜냐하면 오사카에 눈이 왔었거든요,, 오사카에.. 오사카에ㅔㅔㅔ\r\n한국인들도 너무 많고 도톤보리는 정신없고 ㅎ\r\n하지만 재밌었어용', SYSDATE(), 439);
INSERT INTO post (board_no, post_title, writer, post_content, post_date, view_count) VALUES (1000, '대만 타이베이에서 야경을 즐기기 좋은 장소는 어디인가요?', 'Thomas', '타이베이 101 빌딩의 전망대는 대만 타이베이에서 가장 인기 있는 야경 명소 중 하나입니다. \r\n 또한, 코끼리 산(Elephant Mountain) 등산로는 타이베이 시내를 한눈에 내려다볼 수 있는 곳으로 야경 사진 촬영에 좋긴 한데 그거 착각이에요', SYSDATE(), 98);
INSERT INTO post (board_no, post_title, writer, post_content, post_date, view_count) VALUES (1000, '홍콩에서 즐길 수 있는 야시장 추천은?', 'bokbok', '홍콩에서 유명한 야시장으로는 템플 스트리트 야시장(Temple Street Night Market)이 있습니다. \r\n다양한 길거리 음식, 의류, 기념품 등을 저렴하게 구매할 수 있으며,\r\n현지 문화를 체험할 수 있는 즐거운 장소입니다.', SYSDATE(), 35);
INSERT INTO post (board_no, post_title, writer, post_content, post_date, view_count) VALUES (1000, '베트남 다낭에서 가볼 만한 자연 명소는 어디인가요?', 'Hyuni', '다낭의 유명한 자연 명소로는 바나힐(Ba Na Hills)과 마블 마운틴(Marble Mountains)이 있습니다. \r\n 바나힐에서는 케이블카를 타고 높은 곳에서 아름다운 풍경을 즐길 수 있으며, \r\n 마블 마운틴은 신비로운 동굴과 사원이 있는 명소입니다.', SYSDATE(), 72);
INSERT INTO post (board_no, post_title, writer, post_content, post_date, view_count) VALUES (1000, '싱가포르에서 추천할 만한 무료 관광지는 어디인가요?', 'bokbok', '싱가포르의 가든스 바이 더 베이(Gardens by the Bay)와 마리나 베이 샌즈 주변의 야경은 무료로 즐길 수 있는 인기 명소입니다. \r\n 또한 머라이언 파크(Merlion Park)에서 상징적인 머라이언 동상을 볼 수 있습니다..', SYSDATE(), 64);
INSERT INTO post (board_no, post_title, writer, post_content, post_date, view_count) VALUES (1000, '방콕에서 방문할 만한 박물관은 어디인가요?', 'Hyuni', '방콕의 대표적인 박물관으로는 방콕 국립 박물관(Bangkok National Museum)과 짐 톰슨 하우스(Jim Thompson House)가 있습니다. \r\n이곳에서 태국의 역사, 예술, 건축을 경험할 수 있으며,\r\n 현지 문화에 대한 깊은 이해를 얻을 수 있습니다.', SYSDATE(), 4);
INSERT INTO post (board_no, post_title, writer, post_content, post_date, view_count) VALUES (1000, '대만 여행갈까 고민 중', 'Julia', '대만 말고 홍카오를 갈지 갑자기 고민이네\r\n제마카오만 갔다 올까.. 그것도 고민이고\r\n대만 여행 나쁘지 않을 것 같긴 한데\r\n모르게따', SYSDATE(), 54);
INSERT INTO post (board_no, post_title, writer, post_content, post_date, view_count) VALUES (1000, '일본 교토에서 전통 문화를 경험할 수 있는 방법은 무엇인가요?', 'Thomas', '교토에서는 기모노를 대여해 전통 의상을 입고 시내를 산책하거나, \r\n 전통 다도(茶道) 체험을 통해 일본 차 문화를 배울 수 있습니다. \r\n 또한 교토의 사찰과 정원에서 조용한 명상과 자연의 아름다움을 느낄 수 있습니다.', SYSDATE(), 98);

-- 유럽 -- 
INSERT INTO post (board_no, post_title, writer, post_content, post_date, view_count) VALUES (2000, '파리에서의 멋진 시간!', '여행러버95', '안녕하세요~ 파리에서 멋진 시간을 보냈어요! 에펠탑의 야경이 정말 잊히지 않네요. 저녁이 되면 불빛이 켜진 에펠탑은 그 자체로 하나의 예술 작품 같았어요. 세느강을 따라 산책하며 도시의 낭만을 즐길 수 있었고, 파리의 거리에서 맛본 크루아상도 정말 별미였답니다.', '2024-10-10 11:00:00', 120);
INSERT INTO post (board_no, post_title, writer, post_content, post_date, view_count) VALUES (2000, '유럽 여행 팁 - 로마편', '여행러버', '콜로세움과 바티칸은 정말 웅장했습니다! 고대 로마의 역사를 느낄 수 있는 도시의 모든 곳이 마치 영화 속 장면 같았어요. 특히 예산을 잘 계획하여 로마의 유명한 명소들을 충분히 즐길 수 있었고, 작은 골목에 숨겨진 이탈리아 맛집들도 훌륭했습니다.', '2024-10-12 15:30:00', 85);
INSERT INTO post (board_no, post_title, writer, post_content, post_date, view_count) VALUES (2000, '베네치아에서의 하루', '여행러버', '수상버스를 타고 운하를 따라 도는 것은 정말 색다른 경험이었어요. 물 위의 도시 베네치아는 사진보다 훨씬 아름다웠고, 작은 카페에서 마신 커피와 젤라또도 특별했어요. 여행 중 만난 사람들과의 대화도 정말 좋은 추억이 되었답니다.', '2024-10-13 09:45:00', 70);
INSERT INTO post (board_no, post_title, writer, post_content, post_date, view_count) VALUES (2000, '스위스 자연경관 후기', '여행러버', '스위스의 인터라켄은 정말 자연경관이 최고였어요. 눈부신 알프스 산맥과 푸른 호수는 평화롭고 경이로웠습니다. 하이킹을 하며 마주한 자연은 사진으로 담기에 아쉬울 정도였고, 그 순간을 오래도록 간직하고 싶었어요.', '2024-10-14 10:15:00', 100);
INSERT INTO post (board_no, post_title, writer, post_content, post_date, view_count) VALUES (2000, '런던 여행기 - 해리포터 스튜디오 방문', '해덕여행러버호', '해리포터 스튜디오는 해덕이라면 꼭 방문해야 하는 곳입니다! 스튜디오 투어에서 실제 촬영 세트를 보고 나니 마법 세계에 직접 온 것 같은 기분이었어요. 캐릭터들의 의상과 소품들을 보며 영화 속 장면들이 떠올라 정말 신기했어요.', '2024-10-15 12:00:00', 95);
INSERT INTO post (board_no, post_title, writer, post_content, post_date, view_count) VALUES (2000, '유럽 기차여행 팁', '유레일러', '유레일패스를 활용하여 유럽의 다양한 도시를 기차로 이동했어요! 기차 창밖으로 보이는 풍경을 감상하며 편하게 여행할 수 있었고, 각 나라의 특색을 경험하는 것도 즐거웠습니다. 장거리 이동에도 피로감이 덜해서 좋았어요.', '2024-10-16 14:30:00', 80);
INSERT INTO post (board_no, post_title, writer, post_content, post_date, view_count) VALUES (2000, '스페인 바르셀로나 여행', '유레일러', '바르셀로나는 정말 예술과 낭만이 가득한 도시였어요. 특히 가우디의 작품들, 사그라다 파밀리아 대성당은 정말 인상 깊었고 그 아름다움에 감탄을 멈출 수 없었어요. 거리 곳곳에 자리한 건축물들은 각각 개성이 넘쳤답니다.', '2024-10-17 18:20:00', 110);
INSERT INTO post (board_no, post_title, writer, post_content, post_date, view_count) VALUES (2000, '파리 디즈니랜드 다녀왔어요', '유레일러', '파리 디즈니랜드는 한국과 다른 매력이 있어서 좋았어요! 디즈니 캐릭터들과의 만남은 물론이고, 각 테마별 놀이기구도 정말 재미있었습니다. 다양한 나라에서 온 사람들과 함께 즐기는 디즈니랜드는 더욱 특별했어요.', '2024-10-18 19:00:00', 150);
INSERT INTO post (board_no, post_title, writer, post_content, post_date, view_count) VALUES (2000, '잊지 못할 피렌체의 밤', '유레일러', '피렌체의 밤은 정말 로맨틱했어요. 도시의 석양과 거리의 음악가들이 연주하는 음악이 어우러져 잊을 수 없는 분위기를 만들어 주었습니다. 작은 광장에서 와인을 즐기며 평화로운 시간을 보냈답니다.', '2024-10-19 16:10:00', 60);
INSERT INTO post (board_no, post_title, writer, post_content, post_date, view_count) VALUES (2000, '베를린에서 찾은 역사', '유레일러', '베를린 장벽과 홀로코스트 기념관을 보며 많은 생각을 했습니다. 그들의 역사를 통해 현재를 돌아보는 귀중한 시간이었고, 잊지 말아야 할 가치들에 대해 깊이 생각해볼 수 있었어요.', '2024-10-20 11:50:00', 75);
INSERT INTO post (board_no, post_title, writer, post_content, post_date, view_count) VALUES (2000, '암스테르담의 자유로운 분위기', '자전거여행자', '암스테르담의 자전거 도로는 정말 잘 되어 있어서 자유롭게 도시를 둘러볼 수 있었습니다. 강가를 따라 자전거를 타고 암스테르담의 독특한 건축물을 감상하는 것이 참 인상 깊었어요.', '2024-10-21 13:35:00', 105);
INSERT INTO post (board_no, post_title, writer, post_content, post_date, view_count) VALUES (2000, '여름에 가본 프라하', '자전거여행자', '프라하의 여름은 정말 아름다웠어요. 찰스 다리에서 내려다본 구시가지의 야경은 마치 한 폭의 그림 같았고, 그곳에서 느껴지는 낭만은 잊을 수 없습니다.', '2024-10-22 20:00:00', 65);
INSERT INTO post (board_no, post_title, writer, post_content, post_date, view_count) VALUES (2000, '파리 카페에서의 여유로운 시간', '자전거여행자', '파리의 유명한 카페에서 커피 한 잔의 여유를 즐기며 주변 사람들을 관찰하는 것도 재미있었어요. 파리 사람들의 여유로운 모습과 도시의 아름다움이 어우러져 특별한 하루를 보냈습니다.', '2024-10-22 21:30:00', 88);
INSERT INTO post (board_no, post_title, writer, post_content, post_date, view_count) VALUES (2000, '스위스 알프스 하이킹', '자전거여행자', '스위스 알프스에서 하이킹을 하며 마주한 경치는 정말 장관이었어요. 자연의 위대함을 온몸으로 느낄 수 있었고, 잠시나마 일상의 스트레스를 잊을 수 있었습니다.', '2024-10-22 17:15:00', 78);
INSERT INTO post (board_no, post_title, writer, post_content, post_date, view_count) VALUES (2000, '빈에서의 클래식 콘서트 경험', '자전거여행자', '오스트리아 빈에서 모차르트와 베토벤의 곡을 라이브로 감상할 수 있었던 경험은 평생 잊을 수 없을 것 같아요. 클래식 음악을 사랑하는 사람들에게는 최고의 장소였습니다.', '2024-10-23 09:30:00', 130);
INSERT INTO post (board_no, post_title, writer, post_content, post_date, view_count) VALUES (2000, '부다페스트의 야경, 정말 최고!', 'NightOwl', '다뉴브 강을 따라 유람선을 타고 부다페스트의 야경을 감상하는 것은 정말 환상적이었어요. 도시 전체가 불빛으로 가득 찬 모습은 잊을 수 없는 장면이었습니다.', '2024-10-23 11:45:00', 98);
INSERT INTO post (board_no, post_title, writer, post_content, post_date, view_count) VALUES (2000, '포르투에서 마신 와인 이야기', 'NightOwl', '포르투의 와이너리에서 즐긴 포트 와인은 정말 특별했어요. 깊은 풍미와 독특한 향이 어우러져 여행 중 최고의 경험 중 하나로 기억될 것 같습니다.', '2024-10-23 13:00:00', 65);
INSERT INTO post (board_no, post_title, writer, post_content, post_date, view_count) VALUES (2000, '코펜하겐에서의 자전거 여행', 'NightOwl', '코펜하겐은 자전거 도시로 유명한데, 실제로 자전거를 타고 돌아보니 정말 편하고 즐거웠어요. 도시 곳곳에서 볼 수 있는 독특한 건축물과 분위기도 좋았고, 편안하게 여행할 수 있었습니다.', '2024-10-23 14:30:00', 120);
INSERT INTO post (board_no, post_title, writer, post_content, post_date, view_count) VALUES (2000, '암스테르담의 미술관 탐방', 'NightOwl', '반 고흐 미술관과 국립 미술관을 둘러보는 것은 정말 멋진 경험이었어요. 세계적인 예술가들의 작품을 직접 볼 수 있어 감동적이었고, 예술에 대한 새로운 영감을 얻었습니다.', '2024-10-23 16:00:00', 78);
INSERT INTO post (board_no, post_title, writer, post_content, post_date, view_count) VALUES (2000, '프라하 구시가지의 매력', 'NightOwl', '프라하 구시가의 좁은 골목길과 특유의 분위기는 정말 매력적이었어요. 시간 여행을 하는 기분으로 구석구석을 걸으며 도시의 매력을 흠뻑 느낄 수 있었습니다.', '2024-10-24 10:00:00', 90);
INSERT INTO post (board_no, post_title, writer, post_content, post_date, view_count) VALUES (2000, '체코 맥주 투어', 'BeerLover', '체코는 맥주로 유명한 나라답게 다양한 종류의 맥주를 즐길 수 있었어요. 특히 현지에서 직접 마셔보니 맛이 훨씬 더 특별하게 느껴졌습니다.', '2024-10-24 12:00:00', 150);
 
-- 오세아니아 --
INSERT INTO post (board_no, post_title, writer, post_content, post_date, view_count) VALUES (3000, '호주 퍼스에서 일몰을 감상하기 좋은 장소는 어디인가요?', 'Thomas', '퍼스의 코테슬로 비치(Cottesloe Beach)는 아름다운 일몰을 감상하기 좋은 장소로 유명합니다. \r\n 해변에서 여유롭게 시간을 보내며 태평양 위로 지는 해를 볼 수 있습니다.', SYSDATE(), 8);
INSERT INTO post (board_no, post_title, writer, post_content, post_date, view_count) VALUES (3000, '뉴질랜드에서 전통 마오리 문화를 체험할 수 있는 곳은 어디인가요?', 'bokbok', '뉴질랜드 로토루아는 마오리 문화 체험지로 유명합니다. \r\n 마오리 전통 공연을 관람하고, \r\n 마오리 마을을 방문해 그들의 전통 생활 방식을 경험할 수 있습니다.', SYSDATE(), 1);
INSERT INTO post (board_no, post_title, writer, post_content, post_date, view_count) VALUES (3000, '피지에서 즐길 수 있는 전통 문화 체험은 무엇인가요?', 'Hyuni', '피지에서는 전통적인 카바(Kava) 음료 체험을 할 수 있습니다. \r\n 피지의 마을을 방문해 주민들과 함께 전통 의식을 경험하며 현지 문화를 배울 수 있습니다.', SYSDATE(), 72);
INSERT INTO post (board_no, post_title, writer, post_content, post_date, view_count) VALUES (3000, '호주 태즈매니아에서 가볼 만한 자연 보호구역은 어디인가요?', 'bokbok', '호주 태즈매니아의 프레시넷 국립공원(Freycinet National Park)은 아름다운 해안선과 깨끗한 자연으로 유명한 보호구역입니다. \r\n 와인글라스 베이는 하이킹 코스로도 인기가 있습니다.', SYSDATE(), 90);
INSERT INTO post (board_no, post_title, writer, post_content, post_date, view_count) VALUES (3000, '뉴질랜드에서 자전거 투어를 즐길 수 있는 도시는 어디인가요?', 'Hyuni', '뉴질랜드 퀸스타운(Queenstown)은 자전거 투어로 유명한 도시입니다. \r\n 산악 자전거 코스와 도심을 연결하는 다양한 자전거 도로가 있어 여행객에게 인기가 많습니다.', SYSDATE(), 4);
INSERT INTO post (board_no, post_title, writer, post_content, post_date, view_count) VALUES (3000, '호주 애들레이드에서 꼭 방문해야 할 동물원은 어디인가요?', 'Julia', '사실 저는 동물원을 별로 안 좋아해요\r\n똥 냄새가 너무 많이 나거든요\r\n근데 애들레이드 가는 김에 한 번 가보려구요', SYSDATE(), 48);
INSERT INTO post (board_no, post_title, writer, post_content, post_date, view_count) VALUES (3000, '뉴질랜드에서 와이토모 동굴 투어는 어떤 경험을 할 수 있나요?', 'Thomas', '와이토모 동굴(Waitomo Caves)에서는 반딧불이 투어가 유명합니다. \r\n 동굴 천장에 빛나는 반딧불이를 감상하며 카약이나 보트로 동굴을 탐험하는 특별한 경험을 할 수 있습니다.', SYSDATE(), 98);
INSERT INTO post (board_no, post_title, writer, post_content, post_date, view_count) VALUES (3000, '호주 골드코스트에서 인기 있는 놀이공원은 어디인가요?', 'Kyle', '호주의 골드코스트에는 드림월드(Dreamworld)와 무비월드(Movie World)가 인기 있는 놀이공원입니다. \r\n 다양한 놀이기구와 테마로 가족 단위 여행객에게 인기가 많습니다.', SYSDATE(), 3);
INSERT INTO post (board_no, post_title, writer, post_content, post_date, view_count) VALUES (3000, '뉴질랜드에서 별을 관측할 수 있는 명소는 어디인가요?', 'Kale', '뉴질랜드 남섬의 테카포 호수(Lake Tekapo)는 별 관측지로 유명합니다. \r\n 이 지역은 맑은 하늘과 적은 빛 공해 덕분에 밤하늘의 별을 선명하게 볼 수 있습니다.', SYSDATE(), 7);
INSERT INTO post (board_no, post_title, writer, post_content, post_date, view_count) VALUES (3000, '피지에서 리조트 추천을 받을 수 있을까요?', 'Thomas', '피지의 인터컨티넨탈 피지 골프 리조트 & 스파(Intercontinental Fiji Golf Resort & Spa)는 고급 리조트로 유명합니다. \r\n 프라이빗 비치와 다양한 액티비티를 제공해 휴양을 즐기기에 좋습니다.', SYSDATE(), 29);
INSERT INTO post (board_no, post_title, writer, post_content, post_date, view_count) VALUES (3000, '호주 브리즈번에서 크루즈 투어', 'Julia', '해보신 분?\r\n크루즈라면 또 말이 달라지는데\r\n날씨 좋을 때 가면 하늘도 예뻐서 크루즈 탈 맛 나겠다 긋쵸\r\n호주를 가야하나..', SYSDATE(), 10);
INSERT INTO post (board_no, post_title, writer, post_content, post_date, view_count) VALUES (3000, '뉴질랜드 북섬에서 온천을 즐길 수 있는 곳은 어디인가요?', 'Thomas', '뉴질랜드 북섬에서는 로토루아(Rotorua)가 온천 명소로 유명합니다. \r\n 이곳에서는 천연 온천수에 몸을 담그고, 화산 활동으로 형성된 지열 지대를 탐험할 수 있습니다.', SYSDATE(), 32);
INSERT INTO post (board_no, post_title, writer, post_content, post_date, view_count) VALUES (3000, '호주에서 가장 유명한 와이너리 지역은 어디인가요?', 'Kale', '호주에서 유명한 와이너리 지역은 바로 바로사 밸리(Barossa Valley)입니다. \r\n 이곳에서는 다양한 포도주를 시음할 수 있으며, 와이너리 투어도 즐길 수 있습니다.', SYSDATE(), 86);
INSERT INTO post (board_no, post_title, writer, post_content, post_date, view_count) VALUES (3000, '뉴질랜드에서 카약 투어를 즐길 수 있는 장소는 어디인가요?', 'Kyle', '뉴질랜드에서는 아벨 태즈먼 국립공원(Abel Tasman National Park)에서 카약 투어를 즐길 수 있습니다. \r\n맑은 바다와 고요한 해안선을 따라 카약을 타며 자연을 만끽할 수 있습니다.', SYSDATE(), 65);
INSERT INTO post (board_no, post_title, writer, post_content, post_date, view_count) VALUES (3000, '호주 벌레가 그렇게 크다면서요?', 'Julia', '호주 벌레가 손바닥만 하다던데 진짜 그런가요?\r\n저 벌레 못 잡아서 안 되는데.. 곤란한데..\r\n근데 호주? 가보고 싶긴 하다,,', SYSDATE(), 82);
INSERT INTO post (board_no, post_title, writer, post_content, post_date, view_count) VALUES (3000, '피지에서 스노클링을 즐길 수 있는 지역은 어디인가요?', 'Kyle', '피지의 야사와 군도(Yasawa Islands)는 스노클링 명소로 유명합니다. 맑은 바닷물과 아름다운 산호초, 다양한 해양 생물을 관찰할 수 있습니다.', SYSDATE(), 54);
INSERT INTO post (board_no, post_title, writer, post_content, post_date, view_count) VALUES (3000, '뉴질랜드 남섬에서 가볼 만한 자연 명소', 'Kale', '뉴질랜드 남섬에서는 밀포드 사운드(Milford Sound)가 유명합니다.\r\n 피오르드 지형을 따라 크루즈를 타고 경이로운 자연 경관을 감상할 수 있는 곳입니다.', SYSDATE(), 1);
INSERT INTO post (board_no, post_title, writer, post_content, post_date, view_count) VALUES (3000, '호주에서 캠핑을 하려면 어디가 좋은가요?', 'bokbok', '호주에서 캠핑하기 좋은 곳으로는 울루루(Uluru)와 그레이트 오션 로드(Great Ocean Road) 주변이 추천됩니다. \r\n 이곳에서 자연을 만끽하며 야외 활동을 즐길 수 있습니다.', SYSDATE(), 365);
INSERT INTO post (board_no, post_title, writer, post_content, post_date, view_count) VALUES (3000, '뉴질랜드에서 가장 인기 있는 트레킹 코스는 무엇인가요?', 'Hyuni', '뉴질랜드에서 가장 인기 있는 트레킹 코스 중 하나는 통가리로 알파인 크로싱(Tongariro Alpine Crossing)입니다. \r\n화산 지형을 탐험하며 멋진 자연 경관을 감상할 수 있습니다.', SYSDATE(), 45);
INSERT INTO post (board_no, post_title, writer, post_content, post_date, view_count) VALUES (3000, '친구가 호주 퍼스로 어학연수 간대요', 'Julia', '퍼스가 호주 서부에 위치하고 있더라구요? \r\n저는 호주에 한 번도 가본 적 없긴 해요\r\n근데 친구가 호주로 어학연수 간다니까 그 친구 보러 호주 여행갈까 고민이 되네요\r\n근데 안 갈 거긴 해요 왜냐하면 별로 안 친하거든요', SYSDATE(), 561);

-- 북아메리카 --
INSERT INTO post (board_no, post_title, writer, post_content, post_date, view_count) VALUES (4000, '미국 뉴욕에서 자유의 여신상까지 가는 방법은 무엇인가요?', 'Kyle', '뉴욕에서 자유의 여신상을 보려면 배터리 파크에서 페리를 타고 리버티 아일랜드로 이동할 수 있습니다.\r\n 페리는 미리 예약하는 것이 좋으며, 크라운까지 올라가는 옵션도 있습니다.', SYSDATE(), 54);
INSERT INTO post (board_no, post_title, writer, post_content, post_date, view_count) VALUES (4000, '캐나다 벤쿠버에서 추천할 만한 자연 경관은 어디인가요?', 'Kale', '벤쿠버에서는 스탠리 파크(Stanley Park)가 유명한 자연 명소입니다. \r\n 해안선을 따라 산책하거나 자전거를 타며 도시와 바다를 동시에 즐길 수 있습니다.', SYSDATE(), 1);
INSERT INTO post (board_no, post_title, writer, post_content, post_date, view_count) VALUES (4000, '미국 라스베이거스에서 무료로 볼 수 있는 명소는 어디인가요?', 'bokbok', '라스베이거스에서 무료로 즐길 수 있는 명소로는 벨라지오 분수 쇼(Bellagio Fountain Show)가 있습니다. \r\n 화려한 물줄기가 음악에 맞춰 춤을 추며 밤에는 조명이 더해져 환상적입니다.', SYSDATE(), 365);
INSERT INTO post (board_no, post_title, writer, post_content, post_date, view_count) VALUES (4000, '멕시코 칸쿤에서 가볼 만한 해변은 어디인가요?', 'Hyuni', '칸쿤의 플라야 델피네스(Playa Delfines)는 깨끗한 백사장과 맑은 바다로 유명한 해변입니다.\r\n 비교적 조용한 분위기로, 여유롭게 휴식을 취하며 바다를 즐길 수 있습니다.', SYSDATE(), 45);
INSERT INTO post (board_no, post_title, writer, post_content, post_date, view_count) VALUES (4000, '캐나다 많이 추울까요?', 'Julia', '제가 추운 걸 진짜 싫어하거든요? 근데 벌써 11월이에요\r\n이떄 캐나다가면 얼어죽는 건 아니겠죠? 한국도 이렇게 추운데..\r\n캐나가 진짜 가보고 싶은뎅,, 추우면 곤란핑 ㅜ', SYSDATE(), 561);
INSERT INTO post (board_no, post_title, writer, post_content, post_date, view_count) VALUES (4000, '미국 시카고 방문하기', 'Julia', '뮤지컬 시카고를 보고 미국에 가고 싶어졌어요/n시카고 가보신 분 계세요?\r\n아니면 뮤지컬 시카고 봐보신 분?/n어디 출신? 미시시피~ 부모님은? 완전 부자~ 어디 계셔? 나도 몰라~', SYSDATE(), 10);
INSERT INTO post (board_no, post_title, writer, post_content, post_date, view_count) VALUES (4000, '캐나다 퀘벡시티에서 추천할 만한 역사적인 장소는 어디인가요?', 'Thomas', '뉴퀘벡시티의 올드 타운(Old Quebec)은 유네스코 세계문화유산으로 지정된 역사적인 지역입니다.\r\n 코블스톤 거리를 따라 중세 유럽풍 건축물과 성곽을 감상할 수 있습니다.', SYSDATE(), 32);
INSERT INTO post (board_no, post_title, writer, post_content, post_date, view_count) VALUES (4000, '미국 로스앤젤레스에서 헐리우드 사인을 보려면 어디가 좋은가요?', 'Kale', '헐리우드 사인을 가까이서 보려면 그리피스 천문대(Griffith Observatory)가 좋습니다. 천문대에서 사인을 배경으로 사진을 찍거나 트레일을 따라 하이킹할 수 있습니다.', SYSDATE(), 86);
INSERT INTO post (board_no, post_title, writer, post_content, post_date, view_count) VALUES (4000, '멕시코 멕시코시티에서 가장 유명한 박물관은 어디인가요?', 'Kyle', '멕시코시티의 소칼로 근처에 위치한 국립 인류학 박물관(Museo Nacional de Antropología)은 아즈텍 문명과 마야 문명의 유물을 전시하고 있는 세계적인 박물관입니다.', SYSDATE(), 65);
INSERT INTO post (board_no, post_title, writer, post_content, post_date, view_count) VALUES (4000, '할리우드가서 슈퍼스타 카케일 봄', 'Julia', '아니 글쎄 제가 미국 할리우드에 볼 일이 있어서 잠시 머물렀거든요?\r\n근데 마침 같은 숙소에 카케일이 머물고 있더라구요!!\r\n마침 기회가 돼서 사진 요청 했는데 너무 불친절하게 사진 찍어주시고 ㅜㅜ \r\n 싸인도 뒤죽박죽 해주시고 ㅜㅜ 진짜 너무 감동이었잖아요..', SYSDATE(), 9384);
INSERT INTO post (board_no, post_title, writer, post_content, post_date, view_count) VALUES (4000, '미국에서 카케일 봤다는 사람인데', 'Julia', '미국에서 카케일 봤다는 사람인데 캐나다에서 토마스 봄 ㄷㄷ\r\n북아메리카가 저랑 잘 맞나봐요 한국에서도 못 만났던 유명한 사람들을 다 만나고..\r\n토마스는 자꾸 뭐만 하면 그거 착각이라던데 좀 아쉽더라구요?', SYSDATE(), 30758);
INSERT INTO post (board_no, post_title, writer, post_content, post_date, view_count) VALUES (4000, '미국 워싱턴 D.C.에서 무료로 갈 수 있는 박물관은 어디인가요?', 'Thomas', '워싱턴 D.C.의 스미소니언 박물관(Smithsonian Museums)은 무료로 입장할 수 있습니다.\r\n 자연사 박물관, 항공 우주 박물관 등 다양한 주제의 박물관들이 위치해 있어 하루 종일 관람할 수 있습니다.', SYSDATE(), 98);
INSERT INTO post (board_no, post_title, writer, post_content, post_date, view_count) VALUES (4000, '미국 시카고에서 윌리스 타워의 스카이덱 체험은 어떤가요?', 'Kyle', '시카고의 윌리스 타워(Skydeck)에서는 도시를 360도로 감상할 수 있습니다. \r\n 특히 유리 바닥으로 된 스카이덱은 마치 공중에 떠 있는 듯한 느낌을 주어 스릴 넘치는 경험을 선사합니다.', SYSDATE(), 3);
INSERT INTO post (board_no, post_title, writer, post_content, post_date, view_count) VALUES (4000, '팀 카케일 미국 할리우드에 가다', 'Kale', '할리우드에 계약할 게 있어서 잠시 카일과 다녀왔어요. \r\n 아직 저희 인기가 하늘을 찌르더라구요 ㅋ 좋은 경험하고 한국으로 돌아가네요 사한진핑', SYSDATE(), 9999);
INSERT INTO post (board_no, post_title, writer, post_content, post_date, view_count) VALUES (4000, '캐나다 날씨 좋더군요', 'Thomas', '여러분 저는 잠시 캐나다로 여행을 왔답니다. \r\n 저를 보면 모른 척 해주세요 잠시 혼자만의 시간을 갖고 싶어서 온 여행이거든요..', SYSDATE(), 9998);
INSERT INTO post (board_no, post_title, writer, post_content, post_date, view_count) VALUES (4000, '미국 뉴올리언스에서 재즈 음악을 즐길 수 있는 곳은 어디인가요?', 'Thomas', '뉴올리언스의 프렌치 쿼터는 재즈 음악의 중심지입니다. \r\n 특히 프레츨 스트리트(Précious Street)에 있는 재즈 클럽들이 유명하며, 거리 공연도 활발하게 이루어집니다.', SYSDATE(), 8);
INSERT INTO post (board_no, post_title, writer, post_content, post_date, view_count) VALUES (4000, '미국 그랜드 캐니언을 방문할 때 추천하는 트레일은 무엇인가요?', 'bokbok', '그랜드 캐니언에서는 브라이트 앤젤 트레일(Bright Angel Trail)이 인기 있는 하이킹 코스입니다. \r\n 이 트레일을 따라 협곡을 내려가며 경이로운 자연 경관을 감상할 수 있습니다..', SYSDATE(), 1);
INSERT INTO post (board_no, post_title, writer, post_content, post_date, view_count) VALUES (4000, '미국 플로리다 키웨스트에서 볼 수 있는 명소는 무엇인가요??', 'Hyuni', '키웨스트의 서던모스트 포인트(Southernmost Point)는 미국 최남단 지점으로 유명한 관광지입니다. \r\n 이곳에서 바다를 바라보며 사진을 찍는 관광객들이 많습니다.', SYSDATE(), 72);
INSERT INTO post (board_no, post_title, writer, post_content, post_date, view_count) VALUES (4000, '멕시코 과달라하라에서 추천할 만한 전통 음식은 무엇인가요?', 'bokbok', '과달라하라의 비리야(Birria)는 지역을 대표하는 전통 음식으로, 양고기나 소고기를 양념해 장시간 끓인 스튜입니다. \r\n비리야 타코는 특히 인기 있는 거리 음식입니다!', SYSDATE(), 90);
INSERT INTO post (board_no, post_title, writer, post_content, post_date, view_count) VALUES (4000, '캐나다 오타와에서 국회의사당 투어는 어떻게 진행되나요?', 'Hyuni', '오타와의 국회의사당 투어는 무료로 제공되며, 사전 예약이 필요합니다. \r\n 투어를 통해 캐나다 정치의 중심지인 국회의사당 내부를 관람할 수 있으며, 역사와 건축에 대한 해설도 들을 수 있습니다.', SYSDATE(), 4);

-- 남아메리카 --
INSERT INTO post (board_no, post_title, writer, post_content, post_date, view_count) VALUES (5000, '페루, 잃어버린 도시에서의 시간 여행', 'ruins', '고대 잉카 문명의 유적지인 마추픽추는 안데스 산맥의 정점에 위치해 있어 주변의 자연과 어우러져 장관을 이룹니다.', SYSDATE(), 0); 	
INSERT INTO post (board_no, post_title, writer, post_content, post_date, view_count) VALUES (5000, '브라질, 자연의 힘을 느끼다', 'nature', '세계에서 가장 큰 폭포 중 하나인 이과수 폭포는 그 규모와 아름다움에 압도되는 느낌이었어요.', SYSDATE(), 0); 	
INSERT INTO post (board_no, post_title, writer, post_content, post_date, view_count) VALUES (5000, '칠레, 끝없이 펼쳐진 대자연', 'adventure', '빙하와 호수, 웅장한 산맥이 어우러진 파타고니아는 하이킹과 탐험을 즐기는 저에게는 최적의 장소였습니다.', SYSDATE(), 0); 	
INSERT INTO post (board_no, post_title, writer, post_content, post_date, view_count) VALUES (5000, '브라질, 아름다운 해변과 문화의 도시', 'lovesouth', '리우데자네이루는 코르코바두 산의 거대 예수상과 아름다운 해변으로 유명하죠.\n특히 리우 카니발은 잊지 못할정도로 인상적이었습니다.', SYSDATE(), 0); 	
INSERT INTO post (board_no, post_title, writer, post_content, post_date, view_count) VALUES (5000, '칠레, 안데스 산맥의 품 안에 있는 도시', 'citynfood', '현대적인 도시와 역사적인 건물이 조화를 이루는 산티아고에서는 다양한 음식과 문화 체험이 가능합니다.', SYSDATE(), 0); 	
INSERT INTO post (board_no, post_title, writer, post_content, post_date, view_count) VALUES (5000, '에콰도르, 진화의 섬 갈라파고스', 'outsider', '독특한 생태계를 가진 갈라파고스 제도는 다양한 동물들과 자연을 아주 가까이에서 관찰할 수 있는 곳입니다.', SYSDATE(), 0); 	
INSERT INTO post (board_no, post_title, writer, post_content, post_date, view_count) VALUES (5000, '콜롬비아, 남미 문화의 중심지', 'lovesouth', '콜롬비아의 수도 보고타는 남미의 아테네라 불릴만큼 남미대륙의 특징들을 모두 품은 곳입니다.\n엘도라도의 전설을 지닌만큼 금 박물관을 보는 시간이 즐거웠습니다.', SYSDATE(), 0); 	
INSERT INTO post (board_no, post_title, writer, post_content, post_date, view_count) VALUES (5000, '칠레, 별이 쏟아지는 밤하늘', 'outsider', '세계에서 가장 건조한 사막 중 하나인 아타카마에서 쏟아질듯안 별들의 세계에 빠져들었습니다.', SYSDATE(), 0); 	
INSERT INTO post (board_no, post_title, writer, post_content, post_date, view_count) VALUES (5000, '페루, 잉카 문명의 중심지', 'ruins', '잉카 제국의 수도였던 쿠스코는 유서 깊은 건축물과 아름다운 광장이 있는 곳입니다./n태양의 신전이라는 코리칸차 신전은 돌을 끼워맞추는 건축방식으로 지어졌다고하여 더욱 신기했습니다.', SYSDATE(), 0); 	
INSERT INTO post (board_no, post_title, writer, post_content, post_date, view_count) VALUES (5000, '볼리비아, 환상적인 거대한 거울 같은 풍경', 'outsider', '우유니 소금사막은 특히 일출과 일몰에 장관을 이루며 우기에는 마치 거대한 거울과 같은 풍경을 보여주죠.', SYSDATE(), 0); 	
INSERT INTO post (board_no, post_title, writer, post_content, post_date, view_count) VALUES (5000, '브라질, 아마존의 관문', 'adventure', '마나우스는 아마존 우림의 중심지로, 다양한 생태계를 경험할 수 있는 곳입니다.', SYSDATE(), 0); 	
INSERT INTO post (board_no, post_title, writer, post_content, post_date, view_count) VALUES (5000, '볼리비아, 오루로에서의 독특한 경험', 'lovesouth', '오루로는 과거 광산 도시였던만큼 광산이었던 곳을 박물관으로 만들기도 했습니다./n이곳에서는 남미 3대축제인 오루로 축제도 열려 생동감 넘치는 경험이었습니다.', SYSDATE(), 0); 
INSERT INTO post (board_no, post_title, writer, post_content, post_date, view_count) VALUES (5000, '페루, 자연의 팔레트', 'nature', '무지개처럼 형형색색의 빛깔로 이루어진 레인보우 마운틴에서 경치가 아름다워 사진을 많이 찍으며 자연의 신비함에 감탄할 수밖에 없었습니다.', SYSDATE(), 0); 	
INSERT INTO post (board_no, post_title, writer, post_content, post_date, view_count) VALUES (5000, '페루, 신비로운 해양 생물의 고향', 'adventure', '파라카스 국립공원은 아름다운 해안선과 다양한 해양 생물이 서식하는 곳입니다./n보트를 타고 섬을 탐험하며 자연의 아름다움을 만끽할 수 있었습니다.', SYSDATE(), 0); 	
INSERT INTO post (board_no, post_title, writer, post_content, post_date, view_count) VALUES (5000, '아르헨티나, 탱고의 도시 열정적인 밤', 'citynfood', '부에노스 아이레스는 탱고의 본고장으로, 활기찬 거리와 예술적인 분위기가 매력적입니다./n현지 식당에서의 저녁 식사와 탱고 공연은 잊지 못할 경험이었습니다.', SYSDATE(), 0); 	
INSERT INTO post (board_no, post_title, writer, post_content, post_date, view_count) VALUES (5000, '페루, 백색의 도시', 'nature', '하얀 화산암으로 만든 건물들과 주변을 둘러싼 만년설이 쌓여있는 산들 때문에 백색 도시라는 별명을 가진 아레키파의 광장과 성당은 특히 인상적이었습니다.', SYSDATE(), 0); 	
INSERT INTO post (board_no, post_title, writer, post_content, post_date, view_count) VALUES (5000, '우루과이, 문화와 바다가 어우러진 곳', 'lovesouth', '몬테비데오는 해변과 문화가 어우러진 도시로 다사다난했던 역사의 산물을 볼수있는 곳입니다.', SYSDATE(), 0); 	
INSERT INTO post (board_no, post_title, writer, post_content, post_date, view_count) VALUES (5000, '아르헨티나, 푸른 호수와 빙하의 조화', 'nature', '나우엘 우아피는 푸른 호수와 웅장한 빙하가 어우러진 자연의 아름다움을 자랑합니다.', SYSDATE(), 0); 	
INSERT INTO post (board_no, post_title, writer, post_content, post_date, view_count) VALUES (5000, '아르헨티나, 해양 도시 여행기', 'citynfood', '바이아 블랑카는 아르헨티나의 남부에 위치한 항구 도시로, 환상적인 해변과 풍부한 해양 생태계가 특징입니다./n지역 식당에서는 신선한 해산물 요리를 맛볼 수 있어 미식가들에게도 인기 있는 장소입니다.', SYSDATE(), 0); 	
INSERT INTO post (board_no, post_title, writer, post_content, post_date, view_count) VALUES (5000, '쿠바, 타임머신을 탄 듯한 거리', 'ruins', '고풍스러운 건축물과 다채로운 문화로 가득한 하바나에선 클래식한 자동차와 거리 공연, 그리고 흥미로운 역사적 유적지를 탐방하며 과거와 현재가 어우러진 하바나의 매력을 느낄 수 있었습니다.', SYSDATE(), 0);

-- 아프리카 --
INSERT INTO post (board_no, post_title, writer, post_content, post_date, view_count) VALUES (6000, '탄자니아, 야생의 세계 세렝게티', 'animallove', '끝 없는 초원위 야생동물들과 아름다운 석양, 그리고 누떼의 대이동은 잊지 못할 광경이었어요.', SYSDATE(), 0); 	
INSERT INTO post (board_no, post_title, writer, post_content, post_date, view_count) VALUES (6000, '짐바브웨, 자연의 경이로움', 'nature', '폭포 끝자락 악마의 수영장은 정말 아찔한 경험이었습니다./n헬리콥터를 이용해 하늘에서 봤을때는 또 다시 자연의 위대함을 느끼게 됐어요.', SYSDATE(), 0); 	
INSERT INTO post (board_no, post_title, writer, post_content, post_date, view_count) VALUES (6000, '탄자니아, 고된 행군 끝에 정상에 서다', 'outsider', '정상까지 가는 동안 다양한 식생들이 분포해있어서 신기했고 오랜 등반끝에 정상에 도착해 빙하까지 봤을땐 큰 성취감을 느꼈습니다.', SYSDATE(), 0); 	
INSERT INTO post (board_no, post_title, writer, post_content, post_date, view_count) VALUES (6000, '남아공, 구름 위에서 내려다본 케이프타운', 'nature', '다행히 날이 좋아 테이블마운틴에 올라가보니 산이라고 느끼기 힘들정도로 평평한 땅같았습니다./n반면에 아래를 내려보면 케이프타운이 한눈에 보일정도였어요.', SYSDATE(), 0); 	
INSERT INTO post (board_no, post_title, writer, post_content, post_date, view_count) VALUES (6000, '모로코, 황금빛 모래 언덕과 낙타', 'outsider', '낙타를 타고 사하라 사막을 가로지르며 본 황금빛 모래언덕은 굉장히 인상적이에요./n밤에 도착한 캠핑장에서 본 밤하늘은 아주 아름다웠어요.', SYSDATE(), 0); 	
INSERT INTO post (board_no, post_title, writer, post_content, post_date, view_count) VALUES (6000, '이집트, 역사의 무게', 'ruins', '이집트 여행에서 빼놓을 수 없는 명소라면 당연히 기자 피라미드죠./n수천 년 전의 고대 문명은 직접 눈으로 보면서도 믿기 힘들정도였네요.', SYSDATE(), 0); 	
INSERT INTO post (board_no, post_title, writer, post_content, post_date, view_count) VALUES (6000, '이집트, 고대의 아름다움', 'ruins', '고대 유적과 강변의 아름다움이 어우러진 곳입니다./n섬에 있는 필레 신전과 미완성한 오벨리스크는 보면 볼수록 신기했습니다.', SYSDATE(), 0); 	
INSERT INTO post (board_no, post_title, writer, post_content, post_date, view_count) VALUES (6000, '튀니지, 지중해가 내려다보이는 파란 마을', 'shorter', '작지만 아름다운 이 마을은 마치 유럽에 있는 듯한 착각을 하게 된다.', SYSDATE(), 0); 	
INSERT INTO post (board_no, post_title, writer, post_content, post_date, view_count) VALUES (6000, '탄자니아, 인도양의 흑진주', 'nature', '탄자니아의 작은섬으로 에메랄드 빛의 바다를 볼수있어요./n잔지바르의 고유 문양들이 새겨진 문양들도 거리곳곳에서 볼수있습니다.', SYSDATE(), 0); 	
INSERT INTO post (board_no, post_title, writer, post_content, post_date, view_count) VALUES (6000, '남아공, 호화로운 기차 여행', 'shorter', '케이프타운과 남아공의 수도를 잇는 블루트레인은 비싸지만 그만한 값을 합니다./n기차를 타고 보는 바깥의 풍경은 시간이 지날때마다 다르게 느껴집니다.', SYSDATE(), 0); 	
INSERT INTO post (board_no, post_title, writer, post_content, post_date, view_count) VALUES (6000, '모로코, 파란 마을 속으로의 여행', 'shorter', '이 작은 마을은 모든 건물이 파란색으로 칠해져 있어 마치 동화 속에 있는 듯한 기분이 듭니다.', SYSDATE(), 0); 	
INSERT INTO post (board_no, post_title, writer, post_content, post_date, view_count) VALUES (6000, '코모로, 해변의 매력을 만끽한 하루', 'citynfood', '아름다운 해변과 독특한 문화가 어우러진 곳입니다./n모로니의 해변에서 즐긴 일몰은 장관이었고, 석양을 배경으로 한 해변가에서의 저녁 식사는 평생 잊지 못할 경험이었습니다.', SYSDATE(), 0); 
INSERT INTO post (board_no, post_title, writer, post_content, post_date, view_count) VALUES (6000, '마다가스카르, 석회암 숲에서의 모험', 'outsider', '뾰족한 석림이 펼쳐진 이곳은 다른 곳에선 볼수없는 진풍경입니다./n그리고 이곳에서 볼수있는 동식물 또한 다른곳에서 볼수없는게 대부분이죠.', SYSDATE(), 0); 	
INSERT INTO post (board_no, post_title, writer, post_content, post_date, view_count) VALUES (6000, '에티오피아, 신비로운 돌교회', 'history', '무슬림의 박해를 피하기위해 만든 암굴 교회들로 유명한 곳입니다.', SYSDATE(), 0); 	
INSERT INTO post (board_no, post_title, writer, post_content, post_date, view_count) VALUES (6000, '남아공, 사파리 체험기', 'animallove', '아프리카 최대 국립공원으로 빅5를 볼수있는 사파리 명소입니다./n빅5를 다 볼순없었지만 많은 종류의 동물들을 눈으로 확인할 수 있었어요.', SYSDATE(), 0); 	
INSERT INTO post (board_no, post_title, writer, post_content, post_date, view_count) VALUES (6000, '가봉, 해변과 숲이 공존하는 곳', 'animallove', '해변을 산책하는 코끼리와 정글의 고릴라를 두눈으로 볼수 있었어요.', SYSDATE(), 0); 	
INSERT INTO post (board_no, post_title, writer, post_content, post_date, view_count) VALUES (6000, '이집트, 거대한 야외 박물관', 'ruins', '워낙 많은 유적지로 인해 도시 자체가 박물관이나 다름없는 이곳 룩소르는 열기구를 통해 하늘에서 보는 유적들은 또다른 감동이 있네요.', SYSDATE(), 0); 	
INSERT INTO post (board_no, post_title, writer, post_content, post_date, view_count) VALUES (6000, '모로코, 바다의 도시 에사우이라', 'history', '세계유산으로 지정된 아름다운 항구 도시인 이곳에선 중세의 분위기가 물씬 풍기는 좁은 골목길을 걷다 보면 다양한 상점과 예술가들을 만날 수 있습니다.', SYSDATE(), 0); 	
INSERT INTO post (board_no, post_title, writer, post_content, post_date, view_count) VALUES (6000, '말라위, 맑고 푸른 말라위 호수', 'outsider', '안에 살고있는 물고기들 수백종들 중에 대다수가 고유종인 이 말라위 호수는 속이 보일정도로 맑은 물을 자랑합니다.', SYSDATE(), 0); 	
INSERT INTO post (board_no, post_title, writer, post_content, post_date, view_count) VALUES (6000, '가나, 성에서 마주한 역사', 'history', '아름답고 평화로워 보이는 해변이면서 노예 무역 역사를 상징하는 유적지예요.', SYSDATE(), 0);

-- 공지사항 -- 
INSERT INTO post (board_no, post_title, writer, post_content, post_date, view_count) VALUES (7000, '여행 카페 이용 가이드', '관리자', '회원 여러분께 여행 카페의 이용 가이드를 안내드립니다. 커뮤니티 규칙을 준수하여 더 나은 경험을 즐기시길 바랍니다.', SYSDATE(), 12);
INSERT INTO post (board_no, post_title, writer, post_content, post_date, view_count) VALUES (7000, '신규 회원 환영 이벤트', '관리자', '신규 가입 회원을 위한 환영 이벤트를 진행 중입니다. 참여 방법과 혜택을 확인해보세요.', SYSDATE(), 18);
INSERT INTO post (board_no, post_title, writer, post_content, post_date, view_count) VALUES (7000, '여름 휴가철 인기 여행지 TOP 5', '관리자', '다가오는 여름, 인기 여행지 TOP 5를 소개합니다. 여행 계획에 참고하시길 바랍니다.', SYSDATE(), 25);
INSERT INTO post (board_no, post_title, writer, post_content, post_date, view_count) VALUES (7000, '포인트 시스템 안내', '관리자', '포인트 시스템이 업데이트되었습니다. 포인트 적립 및 사용법을 확인해주세요.', SYSDATE(), 30);
INSERT INTO post (board_no, post_title, writer, post_content, post_date, view_count) VALUES (7000, '커뮤니티 규칙 변경 사항 안내', '관리자', '커뮤니티 규칙이 일부 변경되었습니다. 회원분들은 꼭 확인하시기 바랍니다.', SYSDATE(), 15);
INSERT INTO post (board_no, post_title, writer, post_content, post_date, view_count) VALUES (7000, '여행 포럼 활성화 이벤트', '관리자', '여행 포럼에서 활성 참여자를 위한 특별 이벤트를 진행합니다.', SYSDATE(), 20);
INSERT INTO post (board_no, post_title, writer, post_content, post_date, view_count) VALUES (7000, '안전한 여행을 위한 팁', '관리자', '여행 시 안전을 위한 유용한 팁과 정보를 공유합니다.', SYSDATE(), 40);
INSERT INTO post (board_no, post_title, writer, post_content, post_date, view_count) VALUES (7000, '최신 여행 정보 업데이트', '관리자', '최근 업데이트된 여행 관련 뉴스를 확인하세요.', SYSDATE(), 22);
INSERT INTO post (board_no, post_title, writer, post_content, post_date, view_count) VALUES (7000, '할인 항공권 정보 공유', '관리자', '현재 제공되는 할인 항공권 정보를 안내드립니다.', SYSDATE(), 35);
INSERT INTO post (board_no, post_title, writer, post_content, post_date, view_count) VALUES (7000, '여행 사진 콘테스트 개최', '관리자', '멋진 여행 사진을 공유하고 경품을 받을 수 있는 콘테스트에 참여하세요.', SYSDATE(), 28);
INSERT INTO post (board_no, post_title, writer, post_content, post_date, view_count) VALUES (7000, '해외 여행 시 필수 준비물', '관리자', '해외 여행 시 반드시 챙겨야 할 준비물 리스트를 소개합니다.', SYSDATE(), 32);
INSERT INTO post (board_no, post_title, writer, post_content, post_date, view_count) VALUES (7000, '회원 등급 시스템 안내', '관리자', '회원 등급 시스템에 대한 설명 및 혜택을 확인해보세요.', SYSDATE(), 27);
INSERT INTO post (board_no, post_title, writer, post_content, post_date, view_count) VALUES (7000, '비행기 탑승 시 유의사항', '관리자', '비행기 탑승 전에 알아두어야 할 중요한 유의사항을 알려드립니다.', SYSDATE(), 31);
INSERT INTO post (board_no, post_title, writer, post_content, post_date, view_count) VALUES (7000, '여행 리뷰 이벤트 공지', '관리자', '여행 리뷰를 작성하고 포인트를 획득할 수 있는 이벤트를 확인해보세요.', SYSDATE(), 29);
INSERT INTO post (board_no, post_title, writer, post_content, post_date, view_count) VALUES (7000, '커뮤니티 소식지 발행', '관리자', '최신 커뮤니티 소식지가 발행되었습니다. 중요한 내용을 확인해보세요.', SYSDATE(), 24);
INSERT INTO post (board_no, post_title, writer, post_content, post_date, view_count) VALUES (7000, '여행 동반자 구하기 팁', '관리자', '여행 시 동반자를 구하는 방법과 주의사항을 소개합니다.', SYSDATE(), 21);
INSERT INTO post (board_no, post_title, writer, post_content, post_date, view_count) VALUES (7000, '커뮤니티 멤버십 혜택 안내', '관리자', '멤버십 가입 시 받을 수 있는 다양한 혜택을 소개합니다.', SYSDATE(), 26);
INSERT INTO post (board_no, post_title, writer, post_content, post_date, view_count) VALUES (7000, '공지사항: 서버 점검 안내', '관리자', '이번 주말 서버 점검이 예정되어 있습니다. 점검 시간 동안 서비스 이용에 제한이 있을 수 있습니다.', SYSDATE(), 14);
INSERT INTO post (board_no, post_title, writer, post_content, post_date, view_count) VALUES (7000, '신규 기능 업데이트', '관리자', '새로운 기능이 추가되었습니다. 자세한 내용을 공지사항에서 확인하세요.', SYSDATE(), 34);
INSERT INTO post (board_no, post_title, writer, post_content, post_date, view_count) VALUES (7000, '커뮤니티 서포터 모집', '관리자', '커뮤니티 발전을 위해 서포터를 모집합니다. 관심 있는 분들은 지원해 주세요.', SYSDATE(), 17);



-- 댓글 테이블
DROP TABLE IF EXISTS reply;
CREATE TABLE IF NOT EXISTS reply(
	reply_no INTEGER AUTO_INCREMENT PRIMARY KEY,
	post_no INTEGER NOT NULL,
	reply_content VARCHAR(500) NOT NULL,
	reply_writer VARCHAR(20) NOT NULL,
	reply_date TIMESTAMP NOT NULL,	
	CONSTRAINT reply_fk FOREIGN KEY(post_no) REFERENCES post(post_no)
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


-- 댓글 -- 
INSERT INTO reply(post_no, reply_content, reply_writer, reply_date)VALUES(20, '항상 감사합니다.\r\n땡큐!~', 'kyle', '2024-11-05 19:44:32');
INSERT INTO reply(post_no, reply_content, reply_writer, reply_date)VALUES(20, '저두 감사드립니다.', 'kyle', '2024-11-05 20:24:57');
INSERT INTO reply(post_no, reply_content, reply_writer, reply_date)VALUES(20, '저두요~ ^_^', 'kale', '2024-11-04 21:19:23');
INSERT INTO reply(post_no, reply_content, reply_writer, reply_date)VALUES(20, '나두 관심이 많은뎅~', 'julia', '2024-11-04 21:54:45');
INSERT INTO reply(post_no, reply_content, reply_writer, reply_date)VALUES(61, '헤헷~ 감사 합니다.', 'kale', '2024-11-04 22:16:51');
INSERT INTO reply(post_no, reply_content, reply_writer, reply_date)VALUES(61, '아~ 다들 이 사이트가 잘되길 바라는 군요', 'julia', '2024-11-03 23:34:11');
INSERT INTO reply(post_no, reply_content, reply_writer, reply_date)VALUES(61, '관리자님께서 워낙 신경을 쓰시니...\r\n잘될 겁니다. ', 'julia', '2024-11-03 11:03:37');
INSERT INTO reply(post_no, reply_content, reply_writer, reply_date)VALUES(61, '저두 사이트 발전에 관심이 많습니다.\r\n감사합니다.' , 'julia', '2024-11-03 14:39:29');
INSERT INTO reply(post_no, reply_content, reply_writer, reply_date)VALUES(61, '와~ 대단하네요 우리 사이트~\r\nㅋㅋㅋ~', 'julia', '2024-11-02 14:41:18');
INSERT INTO reply(post_no, reply_content, reply_writer, reply_date)VALUES(61, '우리 관리자님이 워낙 열심이시라~\r\n그리고 회원님들도 열성으로 사이트에 충성 접속하시니...\r\n않될 수가 있나요...^_^', 'kyle', '2024-11-02 14:52:48');
INSERT INTO reply(post_no, reply_content, reply_writer, reply_date)VALUES(81, '네 맞아요~', 'kyle', '2024-11-02 15:42:12');
INSERT INTO reply(post_no, reply_content, reply_writer, reply_date)VALUES(81, '그렇죠 그렇고 말구요', 'kyle', '2024-11-01 15:44:57');
INSERT INTO reply(post_no, reply_content, reply_writer, reply_date)VALUES(81, '항상 감사합니다.', 'kale', '2024-11-01 16:19:23');
INSERT INTO reply(post_no, reply_content, reply_writer, reply_date)VALUES(81, '땡큐!~', 'kale', '2024-11-01 17:31:45');
INSERT INTO reply(post_no, reply_content, reply_writer, reply_date)VALUES(81, '저두요~ 땡큐!~', 'kale', '2024-10-29 18:16:51');
INSERT INTO reply(post_no, reply_content, reply_writer, reply_date)VALUES(81, '모두들 열성이네요~\r\n헤헤~\r\n땡큐!~', 'danny', '2024-10-29 10:34:11');
INSERT INTO reply(post_no, reply_content, reply_writer, reply_date)VALUES(81, '땡큐~ 여기 붙어라~ ^_^', 'danny', '2024-10-28 11:33:27');
INSERT INTO reply(post_no, reply_content, reply_writer, reply_date)VALUES(20, '땡큐~ 붙었어요~', 'danny', '2024-10-27 13:19:59');
INSERT INTO reply(post_no, reply_content, reply_writer, reply_date)VALUES(20, '당연 회원이면 관심 가져야죠~', 'danny', '2024-10-27 13:41:17');
INSERT INTO reply(post_no, reply_content, reply_writer, reply_date)VALUES(20, '동감 합니다.\r\n땡큐!~', 'danny', '2024-10-27 14:52:48');



COMMIT;

show tables;
DESC post;

SELECT * 
FROM board
ORDER BY board_no;

SELECT * 
FROM post
ORDER BY post_no DESC;

SELECT * 
FROM reply
ORDER BY post_no;








