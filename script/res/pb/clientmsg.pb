
∆ì
clientmsg.proto"Z
ClientMsgHead
msgtype (
msgname (	
svr_id (	
service_address ("v
Version
platform (
channel (
version (	
authtype (
regfrom (
channel_name (	"N
GateSvrItem

ip (	
port (

updatetime (
	onlinenum ("
PlayerBaseinfo
rid (
rolename (	
logo (	
phone (	
totalgamenum (
winnum (
sex (
coins (
diamonds	 (
highwininseries
 (

maxcoinnum (
base_room_card (
bind_room_card (
club_id (
master_score (
king_wins_card (

level_name (	
	vip_level (
sign (	

phone_bind (	
is_system_create (
player_level (
exp (
next_level_need_exp (
account (	"Î
TableStateItem

id (
state (
name (	
	room_type (
	game_type (
max_player_num (
cur_player_num (
retain_to_time (
create_user_rid	 (
create_user_rolename
 (	
create_time (
create_table_id (	

roomsvr_id (	
roomsvr_table_address (
action_timeout (
action_timeout_count (
create_user_logo (	
min_carry_coin (
max_carry_coin (
	base_coin (
common_times (
totalplayernum (
distribute_playernum (
	round_num (
	rule_name (	
rule_ext_names (	
max_fan_names (	
check_type_indexs (
play_rule_type (
check_room_index (
is_review_mode (
	table_uid  (
is_no_shuffle! (
level" (
contest_type& (	
tickets' (
need_consume_coin( (
king_wins_card) ("¬
SeatInfo
rid (
index (
state (

is_tuoguan (
coin (
jdztag (
isdz (
ready_to_time (
cardsnum	 (
cards
 (
	out_cards (
curscore ( 

actionmesg (2.DoactionNtc
is_ming_pai (
contest_score (
rank (
total_player (
	jdz_score (#
need_play_num_add_king_card (
	call_time (
is_see_card (

is_give_up (
total_score (
gepaonum (
fan_bei_num (
is_gendaodi (
	is_quanya (
	is_tanpai (
	is_taotai ("ù
TablePlayerInfo
rid (
rolename (	
logo (	
sex (
totalgamenum (
winnum (
coins (
diamonds (
highwininseries	 (

maxcoinnum
 (
clientip (	
latitude (	
	longitude (	

level_name (	
	vip_level ("&
ChipInfo
rid (
score ("%

RecordCell

id (
num ("7
NNRecordCell

id (
record (2.RecordCell"8
ZFBRecordCell

id (
record (2.RecordCell".
QDZPlayerInfo
rid (
rolename (	"î
RankPlayerInfo
rid (
rolename (	
coins (
	totalbets (
winnum (
logo (	
winmoney (
	vip_level ("—
GameInfo

id (
state (
name (	
	room_type (
	game_type (
max_player_num (
cur_player_num (
retain_to_time (
create_user_rid	 (
create_user_rolename
 (	
create_time (
create_table_id (	

roomsvr_id (	
roomsvr_table_address (
action_timeout (
action_timeout_count (
create_user_logo (	
min_carry_coin (
max_carry_coin (
	base_coin (
common_times (
	all_times (
action_seat_index (
action_to_time (
action_type (
dz_seat_index (
seats (2	.SeatInfo*
tableplayerinfos (2.TablePlayerInfo

actionlist (

room_round (

curr_round (
play_rule_type  (
	rule_name! (	
is_club_daikai" (
check_room_index# (
rang_pai_num$ (
fan_bei_num% (

last_cards& (
dizhu_dipai' (

call_times( (
can_use_bomb) (
last_cardtype* (

laizicards+ (
lastcond, (
master_score- (
tickets. (
loser_score/ (
contest_type< (	
contest_cfg_uuid= (	
contest_game_uuid> (	
contest_svr_id? (	
contest_agent_address@ (
contest_di_scoreA (
contest_template_idB (

kick_scoreC (!
contest_prefer_left_countD (
chiplistE (2	.ChipInfo
	all_scoreF (
roundsG (

count_timeH (
wait_call_timesI (#
qdz_playersJ (2.QDZPlayerInfo"
	rank_listK (2.RankPlayerInfo
playersL (2.HHPlayerInfo
	winrecordM (2.HHRoadNode
remain_scoreO (
nntrendP (2.NNRecordCell 
baccarat_roadQ (2	.RoadNode
luckyR (2.RankPlayerInfo
hh_roadS (2.HHRoadNode"
player_infoT (2.HHPlayerInfo!
	zfb_trendU (2.ZFBRecordCell!

lh_playersV (2.LHPlayerInfo!
lh_winrecordW (2.LHRoadNode
lh_roadX (2.LHRoadNode"$
	AwardItem

id (
num (",
	ThirdInfo
type_id (
status (" 
GetThirdStatusReq
rid ("W
GetThirdStatusRes
errcode (

errcodedes (	
	info_list (2
.ThirdInfo"7
UpdateThirdStatusReq
type_id (
status (";
UpdateThirdStatusRes
errcode (

errcodedes (	"è
	AccRegReq
version (2.Version

deviceinfo (	
uid (	
uidtype (

thirdtoken (	
username (	
vercode (	"§
	AccRegRes
errcode (

errcodedes (	
uid (	
rid (

logintoken (	

expiretime (
gatesvrs (2.GateSvrItem
clientip (	"J

AccBindReq
uid (	
uidtype (
phone (	
vercode (	"1

AccBindRes
errcode (

errcodedes (	"e
AccBindPhoneScretReq
uid (	
uidtype (
phone (	
only_id (	
account (	";
AccBindPhoneScretRes
errcode (

errcodedes (	"2
LHChangePwdReq
old_pwd (	
new_pwd (	"5
LHChangePwdRes
errcode (

errcodedes (	"P
LHPhoneCodeReq
version (2.Version
phone (	
vercode_type ("F
LHPhoneCodeRes
errcode (

errcodedes (	
vercode (	"0
LHPhoneBindReq
vercode (	
phone (	"D
LHPhoneBindRes
errcode (

errcodedes (	
phone (	"6
LHAccDisBindPhoneReq
phone (	
vercode (	";
LHAccDisBindPhoneRes
errcode (

errcodedes (	"#
PhoneScretResetReq
scret (	"9
PhoneScretResetRes
errcode (

errcodedes (	"J
PhoneVerCodeReq
version (2.Version
uid (	
uidtype ("G
PhoneVerCodeRes
errcode (

errcodedes (	
vercode (	"¥
LoginReq
version (2.Version

deviceinfo (	
uid (	
uidtype (
device_uuid (	
only_id (	

thirdtoken (	
account (	
login_ip	 (	"Ú
LoginRes
errcode (

errcodedes (	
uid (	
rid (

logintoken (	

expiretime (
gatesvrs (2.GateSvrItem
clientip (	
uidtype	 (

check_code
 (
vercode_pwd (	
device_uuid (	"C
LoginResetPwdReq
phone (	
vercode (	
new_pwd (	"H
LoginResetPwdRes
errcode (

errcodedes (	
new_pwd (	"5
ChangeLoginPwdReq
old_pwd (	
new_pwd (	"8
ChangeLoginPwdRes
errcode (

errcodedes (	"%
HeartReq
version (2.Version"C
HeartRes
errcode (

errcodedes (	

servertime ("?
QiniuUploadReq
version (2.Version

uploadlogo (	"J
QiniuUploadRes
errcode (

errcodedes (	
uploadtoken (	"ë
EnterGameReq
version (2.Version
device_info (	
uid (	
rid (

expiretime (

logintoken (	
uidtype ("®
EnterGameRes
errcode (

errcodedes (	
isreauth (

servertime (!
baseinfo (2.PlayerBaseinfo

ip (	
port (

roomsvr_id (	
roomsvr_table_address	 (
identity_type
 (
bind_prompter (
create_club_flag (
club_owner_rid (
server_current_mode (
unread_mail_num (
previous_room_num (
create_table_id (	"
new_join_daikai_apply_flag (
contest_uuid (	&
limit_room_info (2.PropRoomInfo1
limit_money_page_info (2.PropMoneyPageInfo"J
CreateClubFlagNtc
create_club_flag (
can_open_club_level ("4
RealNameValidateReq
name (	
id_card (	":
RealNameValidateRes
errcode (

errcodedes (	"C
PrompterValidateReq
name (	
id_card (	
phone (	":
PrompterValidateRes
errcode (

errcodedes (	"^
PrompterValidateCodeReq
name (	
id_card (	
phone (	
validate_code (	">
PrompterValidateCodeRes
errcode (

errcodedes (	"(
BindInviteCodeReq
invite_code (	"8
BindInviteCodeRes
errcode (

errcodedes (	"E
CardInfo
cardtype (
cards (
mingpai_provider (";
PlayerBaseinfoReq
version (2.Version
rid ("[
PlayerBaseinfoRes
errcode (

errcodedes (	!
baseinfo (2.PlayerBaseinfo"ö
UpdateinfoReq
version (2.Version
rolename (	
logo (	
phone (	
sex (
sign (	
flag (
third_topUpSum ("ë
UpdateinfoRes
errcode (

errcodedes (	
rolename (	
logo (	
phone (	
sex (
sign (	
	vip_level (")
UpdatePlayerInfoNtc

level_name (	"Á
CreateFriendTableReq
version (2.Version
action_timeout (
retain_time (
	base_coin (
	iscontrol (
check_room_index (
is_club_daikai (
play_rule_type (
coin_room_level	 ("=
CreateMockTableReq
	table_uid (	
select_round ("9
CreateMockTableRes
errcode (

errcodedes (	"l
CreateFriendTableRes
errcode (

errcodedes (	
create_table_id (	
is_club_daikai ("P
GetTableStateByCreateIdReq
version (2.Version
create_table_id (	"f
GetTableStateByCreateIdRes
errcode (

errcodedes (	#

tablestate (2.TableStateItem"2
GetFriendTableListReq
version (2.Version"`
GetFriendTableListRes
errcode (

errcodedes (	"
	tablelist (2.TableStateItem"9
FriendTableListChangeNtc
type (
room_id ("?
GetGameRoomsReq
version (2.Version
	room_type ("\
GameRoomsInfo
	room_type ($
tablestates (2.TableStateItem

player_num ("Z
GetGameRoomsRes
errcode (

errcodedes (	"

rooms_info (2.GameRoomsInfo"o
QuickStartReq
version (2.Version
	room_type (

id (
	game_type (
	is_create ("ô
QuickStartRes
errcode (

errcodedes (	

id (

roomsvr_id (	
roomsvr_table_address (
	room_type (
	game_type ("V
CancelQuickStartReq
version (2.Version
	room_type (
	game_type (":
CancelQuickStartRes
errcode (

errcodedes (	"ú
GoldRoomMatchNTC
errcode (

errcodedes (	

id (

roomsvr_id (	
roomsvr_table_address (
	room_type (
	game_type ("¨
ContestRoomMatchNTC
errcode (

errcodedes (	

id (

roomsvr_id (	
roomsvr_table_address (
	room_type (
	game_type (
rid ("0
CreateRobotTableReq
version (2.Version"y
CreateRobotTableRes
errcode (

errcodedes (	

id (

roomsvr_id (	
roomsvr_table_address ("|
EnterTableReq
version (2.Version

id (

roomsvr_id (	
roomsvr_table_address (
	invite_id ("p
EnterTableRes
errcode (

errcodedes (	
gameinfo (2	.GameInfo
creator_prompter_type ("á
SitdownTableReq
version (2.Version

id (

roomsvr_id (	
roomsvr_table_address (
roomsvr_seat_index ("6
SitdownTableRes
errcode (

errcodedes (	"k
StandupTableReq
version (2.Version

id (

roomsvr_id (	
roomsvr_table_address ("6
StandupTableRes
errcode (

errcodedes (	"|
LeaveTableReq
version (2.Version

id (

roomsvr_id (	
roomsvr_table_address (
	is_switch ("G
LeaveTableRes
errcode (

errcodedes (	
	is_switch ("_
ReenterTableReq
version (2.Version

roomsvr_id (	
roomsvr_table_address ("S
ReenterTableRes
errcode (

errcodedes (	
gameinfo (2	.GameInfo"h
StartGameReq
version (2.Version

id (

roomsvr_id (	
roomsvr_table_address ("3
StartGameRes
errcode (

errcodedes (	"‚
DoactionReq
version (2.Version

id (

roomsvr_id (	
roomsvr_table_address (
action_type (
cards (

call_times (
laizi_cards_key (
action_subtype	 (
obj_seat
 ("7
Doaction2RobotNtc
action_type (
value ("n
DoactionRes
errcode (

errcodedes (	
action_type (
cards (
action_subtype ("h
GameReadyReq
version (2.Version

id (

roomsvr_id (	
roomsvr_table_address ("3
GameReadyRes
errcode (

errcodedes (	"\
PlayerGameRecordinfoReq
version (2.Version
rid (

id (
limit ("Y
playerRecordinfo
rid (

currencyid (

balancenum (
rolename (	"•
PlayerGameRecordinfo

id (
table_id (
table_create_time (
tablecreater_rid (

entercosts (&
recordinfos (2.playerRecordinfo"f
PlayerGameRecordinfoRes
errcode (

errcodedes (	&
records (2.PlayerGameRecordinfo""
GetMailsReq
create_time (";
PlayerMailNtc
type (
	mailitems (2	.MailItem"Ç
MailItem
mail_key (	
reason (
rid (
create_time (
content (	
isattach (
is_read ("G
PlayerMailListReq
index (
	page_size (
req_type ("Ç
PlayerMailListRes
errcode (

errcodedes (	
index (
size (
total (
	mailitems (2	.MailItem",
PlayerMailAlreadyReadReq
mail_key (	"?
PlayerMailAlreadyReadRes
errcode (

errcodedes (	"P
GetMailsRes
errcode (

errcodedes (	
	mailitems (2	.MailItem">
GetmailItemsReq
version (2.Version
mail_key (	"[
GetmailItemsRes
errcode (

errcodedes (	
mail_key (	
	resultdes (	"<
DeleteMailReq
version (2.Version
mail_key (	"F
DeleteMailRes
errcode (

errcodedes (	
mail_key (	"%

TaskReward

id (
num ("ù
TaskItem
task_id (
desc (	
	condition (
progress (
status (
rewards (2.TaskReward
	jump_type (
icon (	")
QueryTaskReq
version (2.Version"r
QueryTaskRes
errcode (

errcodedes (	

dailytasks (2	.TaskItem
systemtasks (2	.TaskItem"/
	DoTaskNtc"
daily_task_info (2	.TaskItem"6
GetTaskRewardReq
task_id (
	task_type ("ã
GetTaskRewardRes
errcode (

errcodedes (	
task_id (
	task_type (
status (

award_list (2
.AwardItem"l
SendMessageReq
version (2.Version
messages (	
	chat_type (
chat_to_seat_index ("5
SendMessageRes
errcode (

errcodedes (	"E
ConfBase

changetime (
confname (	
confcontent (	"L
DownloadCfgReq
version (2.Version
resconfinfos (2	.ConfBase"V
DownloadCfgRes
errcode (

errcodedes (	
reqconfinfos (2	.ConfBase"k
DisbandRoomReq

id (

roomsvr_id (	
roomsvr_table_address (
roomsvr_seat_index ("5
DisbandRoomRes
errcode (

errcodedes (	"Ö
ResponseDisbandRoomReq

id (

roomsvr_id (	
roomsvr_table_address (
roomsvr_seat_index (
bdisband ("=
ResponseDisbandRoomRes
errcode (

errcodedes (	"ê
IosGoodItems
goods_id (	
count (
price (
title (	
simple_description (	
description (	
iconPath (	":
BuyCardModelReq
version (2.Version
type ("Y
BuyCardModelRes
errcode (

errcodedes (	!

goods_item (2.IosGoodItems"B
CreateClubReq
rid (
	club_name (	
	club_city (	"E
CreateClubRes
errcode (

errcodedes (	
club_id ("
JoinClubReq
club_id ("0
NewJoinClubApplyNtc
type (
num ("2
JoinClubRes
errcode (

errcodedes (	"d
ClubEditReq
rid (
edit_club_notice (	
edit_club_city (	
edit_club_name (	"2
ClubEditRes
errcode (

errcodedes (	"%
ClubEditNotice
notice_type ("
ClubInfoReq
rid ("ª
ClubInfo
club_notice (	
club_create_time (
club_owner_name (	
club_id (
club_room_card (

club_level (
online_member (
	club_name (	
	club_city	 (	
club_member_counts
 (
club_max_member_limit (
club_room_card_endtime (
is_check_long_time (
club_owner_rid (&
day_average_room_times_of_7day (
my_club_room_card_quota (
exit_end_time ("P
ClubInfoRes
errcode (

errcodedes (	
	club_info (2	.ClubInfo"(
	ConfigReq
theme (
type ("L
	ConfigRes
errcode (

errcodedes (	
data (	
type ("
ClubLevelInfoReq
rid ("A
ClubLevelInfo

club_level (
average_war_record_7 ("`
ClubLevelInfoRes
errcode (

errcodedes (	'
club_level_info (2.ClubLevelInfo"P
ClubMembersListReq
rid (
key (	
index (
	page_size ("á

MemberInfo
rid (
photo (	
name (	
status (
off_time (
level (

star_level (
remain_room_card ( 
current_table_player_num	 (
create_table_id
 (
exit_club_remain_time (
max_player_num ("†
ClubMembersListRes
errcode (

errcodedes (	 
member_info (2.MemberInfo
application_num (
index (
size (
total ("0
MemberJoinRoomReq
rid (
to_rid ("_
MemberJoinRoomRes
errcode (

errcodedes (	
room_id (
room_address (	"1
ApplicationMembersReq
rid (
key (	"N
ApplicationMembers
rid (
photo (	
name (	
credit ("n
ApplicationMembersRes
errcode (

errcodedes (	0
application_members (2.ApplicationMembers"P
HandleClubMemberApplicationReq
is_allow_join_club (

choose_rid ("u
HandleClubMemberApplicationRes
errcode (

errcodedes (	
is_allow_join_club (

choose_rid ("J
ClubApplicationResultNotice
club_id (
is_allow_join_club ("b
ManageClubMemberReq
add_white_list_id (
remove_white_list_id (

delete_rid ("N
ManageClubMemberRes
errcode (

errcodedes (	

delete_rid (" 
PaiHistoryInfoReq
rid ("q
PaiHistoryInfo
time (
mj_type (	

room_owner (
current_ju_num (
total_ju_num ("[
PaiHistoryInfoRes
errcode (

errcodedes (	!
pai_info (2.PaiHistoryInfo"&
WarRewardHistoryInfoReq
rid ("B
WarRewardHistoryInfo
photo (	
name (	
score ("n
WarRewardHistoryInfoRes
errcode (

errcodedes (	.
war_reward_info (2.WarRewardHistoryInfo"D
ClubTableRecordReq
type (
index (
	page_size ("@
TableRecordPlayerInfo
photo (	
name (	

id ("/
TableRecordSigleRoundScoreInfo
score ("–
SingleTableRecord
create_table_id (
play_round_num (
total_round_num (
table_type_name (	
creator_name (	
consume_room_card (	
table_start_time (1
table_player_info (2.TableRecordPlayerInfo9
table_score_info	 (2.TableRecordSigleRoundScoreInfo
is_game_end
 (!
consume_of_increase_round (
can_increase_round_num (
create_user_rid (
	table_uid (	
is_have_application ("ú
ClubTableRecordRes
errcode (

errcodedes (	
req_type (
start (
size (
total (#
records (2.SingleTableRecord">
UseRoomCardSetReq
operation_rid (

star_level ("c
UseRoomCardSetRes
errcode (

errcodedes (	
operation_rid (

star_level ("6
GetRoomCardByStarReq
rid (
	room_card ("m
GetRoomCardByStarRes
errcode (

errcodedes (	
club_room_card (
remain_room_card (""
QuotaRoomCardLogReq
rid ("]
RoomCardLog
time (
name (	
conf_room_card (
consumer_room_card ("c
QuotaRoomCardLogRes
errcode (

errcodedes (	'
set_room_card_log (2.RoomCardLog"L
ClubOpenRoomReq
rid (

invited_id (
check_room_index ("6
ClubOpenRoomRes
errcode (

errcodedes (	"5
ClueOpenRoomReplyReq
rid (
is_agree ("M
ClueOpenRoomReplyRes
errcode (

errcodedes (	
is_agree ("'
CanInviteJoinRoomListReq
rid ("L
CanInviteJoinRoom

id (
photo (	
name (	
credit ("h
CanInviteJoinRoomListRes
errcode (

errcodedes (	'
member_info (2.CanInviteJoinRoom"G
InvitedJoinRoomReq
rid (
invited_ids (
room_id (	"9
InvitedJoinRoomRes
errcode (

errcodedes (	"
DaikaiRoomIdsReq
rid ("f
DaikaiRoomIdsRes
errcode (

errcodedes (	
room_ids (	
is_have_application (",
DaikaiMainInfoReq
create_table_id (	"û
DaikaiMainInfoRes
errcode (

errcodedes (	(
invite_infos (2.CanInviteJoinRoom/
application_members (2.CanInviteJoinRoom
disband_room_time (
majiang_name (	
is_review_mode (
rule_ext_names (	
max_fan_names	 (	
	round_num
 ("o
DaikaiRoomUpdatePlayerNtc
create_table_id (	*
updated_player (2.CanInviteJoinRoom
state ("?
DaikaiKickReq
rid (
room_id (	
kick_rid ("4
DaikaiKickRes
errcode (

errcodedes (	"
	RepeatNtc
rid ("f
SitdownTableNtc
rid (
seatinfo (2	.SeatInfo)
tableplayerinfo (2.TablePlayerInfo"Y
StandupTableNtc
rid (
roomsvr_seat_index (
state (
reason ("@

TingStruct
card ($
canhutilelist (2.TingTileInfo".
TingTileInfo
card (
multiple ("
MingPaiInfo
cards ("¢
DoactionNtc
rid (
roomsvr_seat_index (
action_to_time (
action_type (
can_use_bomb (
must_chu_heart3 (
rounds ("5
PDKBombInfo

seat_index (

bomb_score ("4

PDKBombNtc&
player_bomb_list (2.PDKBombInfo"+
GameStartNtc
gameinfo (2	.GameInfo"∏
DoactionResultNtc
rid (
roomsvr_seat_index (
action_type (
cards (

call_times (
	card_type (
rang_pai_num (
fan_bei_num (
is_server_op	 (
laizi_cards_key
 (
action_subtype (
obj_seat (
	all_score (
player_win_score ("A
CompareCardsNtc
winner (
loser (
is_draw ("F
DealCardsNtc
rid (
roomsvr_seat_index (
cards (")
AllCardsNtc
red (
black ("L

DoReadyNtc
rid (
roomsvr_seat_index (
ready_to_time ("&
GameNtc
itype (
time ("
DoDoubleScoreReq
rid ("7
DoDoubleScoreRes
errcode (

errcodedes (	"-
DoubleScoreNtc
rid (
status ("æ
HHPlayerInfo
rid (
rolename (	
logo (	
lucky (

win_num_20 (
total_score_20 (
coins (
	bigwinner (
	win_point	 (
	vip_level
 (":

DoGePaoNtc
gepao_config (
action_timeout ("
SelGePaoReq
gepaonum ("D
SelGePaoRes
errcode (

errcodedes (	
gepaonum ("
SelGePaoNtc
gepaonum ("Ä
HHTablePlayerNtc
isend (
list (2.HHPlayerInfo
hh_road (2.HHRoadNode"
player_info (2.HHPlayerInfo"N
GameReadyResultNtc
rid (
roomsvr_seat_index (
isready ("ò
PlayerInfoInGameEnd
rid (

finalscore (
iswin (
winnum (
	seatindex (
rolename (	
logo (	
rivals ("H
HuInfo
rid (
	seatindex (
hu_type (
cards ("∫
DealCardsEnd
	seatindex (
cards (
winmoney (
hu_info (2.HuInfo
total_money (
win_contest_score (
total_contest_score (
rank (
total_player	 (
be_kick
 (
master_score (
times (
	base_coin (
flg (
is_show_cards ("&
	TimesInfo

id (
times ("€
GameEndResultNtc
dealcard (2.DealCardsEnd
	basecoins (
times ('
	countdata (2.PlayerInfoInGameEnd

ischuntian (
mjrounds (
table_rounds_uid (	

total_time (#
times_info_list	 (2
.TimesInfo
total_rounds
 (!
is_friend_force_disbandom (
remain_score (
is_game_end ("C
	CardsPuts
rid (
putcards (
laizi_cards_key ("
ReenterRoomNtc
index ("(
CardTask
beinum (
desc (	"’
ReenterTableNtc
	handcards (
	dealcards (
cardsput (2
.CardsPuts
action_type (
action_to_time (
action_seat_index (
must_chu_heart3 (
random_task (2	.CardTask
dipai_tasks	 (2	.CardTask
is_use_kandipai
 (
is_use_jipaiqi (
dipai_cards (
handle_out_card ("y
PlayerTableMessageNtc
rid (

seat_index (
messages (	
	chat_type (
chat_to_seat_index ("T
DeliverGoodsNtc
order_id (	
option_data (	
awards (2
.AwardItem"6
PlayerBaseInfoNtc!
baseinfo (2.PlayerBaseinfo""
PlayerLevelTableNtc
rid ("$
PlayerDisconnectNtc
index ("}
DisbandRoomNtc

id (

roomsvr_id (	
roomsvr_table_address (
roomsvr_seat_index (
rolename (	"ï
DisbandRoomResultNtc

id (

roomsvr_id (	
roomsvr_table_address (
roomsvr_seat_index (
bdisband (
rolename (	"Î
GoodsNtc
rid (
coins (
diamonds (
base_room_card (
bind_room_card (
master_score (
king_wins_card (
bag_info (2.BagInfo
totalgamenum	 (
winnum
 (
	bank_coin ("4
SeverNtc
msg_type (
disband_reason (	".
PlayerBindPrompterNtc
bind_prompter ("E
BroadCastMsgInfo
msg (	
count (
distance_time ("<
BroadCastMsgNtc)
broadcast_list (2.BroadCastMsgInfo" 
JonClubInfoNtc
status ("J
ClubChangeNtc

command_id (
	extra_msg (	

extra_data ("S
ClubOpenRoomNtc
	invite_id (
invite_name (	
check_room_index ("T
InviteJoinRoomNtc
room_number (	
room_owner_name (	
	invite_id ("A
TableReviewModeSetReq
is_open (
create_table_id (	"f
TableReviewModeSetRes
errcode (

errcodedes (	
create_table_id (	
is_open ("/
TableReviewClosedNtc
table_create_id (	"W
TableReviewApplyNtc
rid (
name (	
logo (	
table_create_id (	"W
TableReviewApplyMutiNtc
is_review_mode ($
applys (2.TableReviewApplyNtc"R
HandleTableReviewApplyReq

choose_rid (
is_allow (
room_id (	"T
HandleTableReviewApplyRes
errcode (

errcodedes (	

choose_rid ("∑
TableReviewApplyResultNtc
is_allow (
create_table_id (
create_user_rolename (	

id (

roomsvr_id (	
roomsvr_table_address (

errcodedes (	"[
MemberStarLevelNtc

star_level (
can_use_room_card (
club_room_card ("D
ClubLevelChangeNtc

club_level (
club_member_counts ("4
ClubDaikaiTableIncreaseRoundReq
	table_uid (	"v
ClubDaikaiTableIncreaseRoundRes
errcode (

errcodedes (	
	table_uid (	
new_total_round_num ("O
TableConfChangeNtc
type (
club_owner_name (	

new_rounds ("
DaikaiKickNtc
name (	")
ClubRoomCardNtc
club_room_card (" 
MockChargeReq
item_id (	"4
MockChargeRes
errcode (

errcodedes (	"=
UploadPlayerPostionReq
latitude (	
	longitude (	"=
UploadPlayerPostionRes
errcode (

errcodedes (	"J
UploadPlayerPostionNtc
rid (
latitude (	
	longitude (	"%
BindIntroducerReq
bind_rid ("8
BindIntroducerRes
errcode (

errcodedes (	"j
InviteNewPlayerInfo
rid (
name (	
status (
invite_time (
award_cards ("
InviteNewPlayerListReq"o
InviteNewPlayerListRes
errcode (

errcodedes (	0
invite_player_list (2.InviteNewPlayerInfo"&
InviteActivityStateReq
type ("q
InviteActivityStateRes
errcode (

errcodedes (	
total_invite_num (
already_get_card ("t
MockTableInfoNtc

roomsvr_id (	
roomsvr_table_address (
gameinfo (2	.GameInfo
gepaonum ("K
MockTableNextActionReq

roomsvr_id (	
roomsvr_table_address ("=
MockTableNextActionRes
errcode (

errcodedes (	"0
GetInviteNewPlayerAwardReq

choose_rid ("A
GetInviteNewPlayerAwardRes
errcode (

errcodedes (	" 
ShareAppAwardReq
type ("Z
ShareAppAwardRes
errcode (

errcodedes (	
type (
remain_time ("=
ClientErrorUploadReq
	errorDesc (	

deviceinfo (	";
ClientErrorUploadRes
errcode (

errcodedes (	"º
PlayBackTableInitInfo)
table_state_info (2.TableStateItem
	seat_card (2.MingPaiInfo*
seat_player_info (2.TablePlayerInfo
dz_seat_index (
gepao_config ("È
PlayBackScoreResultInfo
dealcard (2.DealCardsEnd
winseatindex (
endtype (
mjrounds (
	mjquannum ('
	countdata (2.PlayerInfoInGameEnd
baocardvalue (
dianpao_index (
hupai_index	 (

hupai_type
 (
table_rounds_uid (	

ischuntian (
	basecoins (
times (

total_time ("“
PlayBackActionResultInfo
rid (
roomsvr_seat_index (
action_type (
cards (

call_times (
	card_type (
rang_pai_num (
fan_bei_num (
laizi_cards_key	 ("-
PlayBackRecordReq
table_rounds_uid (	"…
PlayBackRecordRes
errcode (

errcodedes (	*

table_info (2.PlayBackTableInitInfo,

score_info (2.PlayBackScoreResultInfo5
action_result_list (2.PlayBackActionResultInfo"(
ExitClubReq
rid (
type ("O
ExitClubRes
errcode (

errcodedes (	
exit_club_last_time ("
KickPlayerNtc
desc (	"q
DizhuNtc
rid (
	seatindex (
cards (

call_times ("
qiangzhuang_seatindex_list (")
TempLeaveReq
rid (
type ("3
TempLeaveRes
errcode (

errcodedes (	")
TempLeaveNtc
rid (
type ("M
PushhandsNumNtc
	basecoins (
times (
seats (2	.SeatInfo"<
DealCardsEndNtc
rid (
cards (
times ("
MingPaiCardNtc
card ("/

MingPaiNtc

seat_index (
cards ("

NoDizhuNtc
info (	"
	HangUpReq
rid ("0
	HangUpRes
errcode (

errcodedes (	"&
	WakeUpReq
version (2.Version"M
	WakeUpRes
errcode (

errcodedes (	
gameinfo (2	.GameInfo""
NoticeClientNtc
info_id ("
GetRewardListReq
rid ("T
SubsidyInfo
config_min_coin (
subsidy_coin (
can_attach_num ("ò
GetRewardListRes
errcode (

errcodedes (	
remain_award_status ("
subsidy_info (2.SubsidyInfo

goods_info (2
.GoodsInfo"4

SubsidyNtc
	coins_num (
subsidy_num ("3
SpecialCoinInfoReq
rid (
buy_type ("z
	GoodsInfo
discount (	
special_price (	

is_can_buy (

award_list (2
.AwardItem
goods_id ("{
SpecialCoinInfoRes
errcode (

errcodedes (	
last_limit_buy_time (#
goods_info_list (2
.GoodsInfo"8
BuySpecialCoinReq
buy_type (
	pos_index ("X
BuySpecialCoinRes
errcode (

errcodedes (	

award_list (2
.AwardItem"&
RemainLoginAwardInfoReq
rid ("6
RemainLoginAwardInfo

award_list (2
.AwardItem"ô
RemainLoginAwardInfoRes
errcode (

errcodedes (	
remain_day_num (
is_attach_coin ()

award_info (2.RemainLoginAwardInfo"%
GetRemainLoginAwardReq
rid ("]
GetRemainLoginAwardRes
errcode (

errcodedes (	

award_list (2
.AwardItem"

SubsidyReq
rid ("f

SubsidyRes
errcode (

errcodedes (	
subsidy_num (

award_list (2
.AwardItem"
GetShopInfoReq
type ("›
ShopItemInfo
goods_id (

goods_icon (	

goods_name (	
price (	

award_list (2
.AwardItem$
extra_award_list (2
.AwardItem
ios_order_name (	
	extra_pre (	
baidu_point	 (	"\
GetShopInfoRes
errcode (

errcodedes (	%
shop_item_list (2.ShopItemInfo"0
BuyShopInfoReq
type (
goods_id ("U
BuyShopInfoRes
errcode (

errcodedes (	

award_list (2
.AwardItem" 
HaifantianInfoReq
rid ("k
HaifantianInfoRes
errcode (

errcodedes (	

award_list (2
.AwardItem
	money_rmb ("$
GetHaifantianGoodsReq
rid ("<
GetHaifantianGoodsRes
errcode (

errcodedes (	"2
GetBagInfoReq
rid (
get_bag_type ("6
BagInfo

id (
num (

goods_type ("Q
GetBagInfoRes
errcode (

errcodedes (	
	info_list (2.BagInfo"(

UsePropReq
bag_info (2.BagInfo"1

UsePropRes
errcode (

errcodedes (	"3
UsePropCardsNtc
	prop_type (
cards ("
HuoDongInfoReq
rid ("K
HuoDongInfoRes
errcode (

errcodedes (	
activity_ids ("!
TurntableStatusReq
rid ("B
TurntableInfo
	goods_pos (

award_list (2
.AwardItem"x
TurntableStatusRes
errcode (

errcodedes (	"

goods_list (2.TurntableInfo
need_master_score ("#
TurntableLuckDrawReq
rid ("n
TurntableLuckDrawRes
errcode (

errcodedes (	
	goods_pos (
next_need_master_score ("$
WeinxinShareStatusReq
rid ("g
WeinxinShareStatusRes
errcode (

errcodedes (	
status (
items (2
.AwardItem"
WeinxinShareReq
rid ("Q
WeinxinShareRes
errcode (

errcodedes (	
items (2
.AwardItem"
CreateLaiziNtc
cards ("+
RedSecondItem

id (
status ("O
RedPrimaryItem

id (
status (!
	item_list (2.RedSecondItem"+
RedNtc!
red_list (2.RedPrimaryItem"
KnockoutMiscInfoReq"‹
KnockoutPlayerInfo
cfg_uuid (	
	game_uuid (	
rid (
rank (
score (
reason (
state (
round (
total_player	 (
regist_min_count (
prefer_left_count ("†
KnockoutMiscInfoRes
errcode (

errcodedes (	
cfg_uuid (	
template_id (

group_type (
svr_id (	
contest_address (
	game_uuid (	
create_table_id (%
playinfo (2.KnockoutPlayerInfo
open_interval_time (
	cfg_uuids (	"*
KnockoutContestInfoReq
cfg_uuid (	"—
KnockoutContestInfo
cfg_uuid (	

group_type (
template_id (
svr_id (	
contest_address (
open_interval_time ($
deduct_item_list
 (2
.AwardItem
show_num (
regist_count (
	countdown (
next_contest_time (
	is_regist (
	game_uuid (	
is_confirm_entry ("a
KnockoutContestInfoRes
errcode (

errcodedes (	"
info (2.KnockoutContestInfo"%
KnockoutListReq

group_type ("n
KnockoutListRes
errcode (

errcodedes (	

group_type ("
list (2.KnockoutContestInfo"c
KnockoutRegistReq
svr_id (	
contest_address (
cfg_uuid (	
deduct_item ("`
KnockoutRegistRes
errcode (

errcodedes (	
cfg_uuid (	
regist_count ("P
KnockoutUnRegistReq
svr_id (	
contest_address (
cfg_uuid (	"b
KnockoutUnRegistRes
errcode (

errcodedes (	
cfg_uuid (	
regist_count ("|
KnockoutConfirmEntryNtc
svr_id (	
contest_address (
cfg_uuid (	
template_id (
	diff_time ("h
KnockoutConfirmEntryReq
svr_id (	
contest_address (
cfg_uuid (	

entry_flag ("ç
KnockoutConfirmEntryRes
errcode (

errcodedes (	
svr_id (	
contest_address (
cfg_uuid (	

entry_flag ("4
KnockoutAbortiveNtc
cfg_uuid (	
rid ("W
KnockoutUnMatchNtc
cfg_uuid (	
	game_uuid (	
state (
round ("§
KnockoutPlayerInfoNtc
cfg_uuid (	
	game_uuid (	
rid (
rank (
score (
reason (
state (
round (
total_player	 (
reward
 (2
.AwardItem
svr_id (	
contest_address (
regist_min_count (
prefer_left_count ("c
KnockoutGameInfoReq
cfg_uuid (	
	game_uuid (	
svr_id (	
contest_address (" 
KnockoutGameInfoRes
errcode (

errcodedes (	
cfg_uuid (	
	game_uuid (	
state (
round (
left_table_count (
rank (
score	 (
total_player
 ("_
KnockoutRankReq
svr_id (	
contest_address (
cfg_uuid (	
	game_uuid (	"o
KnockoutRankPlayerInfo
rid (
score (
rank (
rolename (	
logo (	
sex ("á
KnockoutRankRes
errcode (

errcodedes (	
cfg_uuid (	
	game_uuid (	*
	rank_list (2.KnockoutRankPlayerInfo"
UseCDKEYReq
code (	"\
UseCDKEYRes
errcode (

errcodedes (	
code (	
reward (2
.AwardItem""
GetDuiJiangInfoReq
type ("ñ
DuiJiangItemInfo
goods_id (

goods_icon (	

goods_name (	
need_goods_id (
need_goods_num (
award (2
.AwardItem"_
GetDuiJiangInfoRes
errcode (

errcodedes (	$
	item_list (2.DuiJiangItemInfo"=
UserExtraInfo
name (	
phone (	
address (	"V
DuiJiangReq
type (
goods_id ('
user_extra_info (2.UserExtraInfo"d
DuiJiangRes
errcode (

errcodedes (	
type (
goods_id (
now_time ("w
RechargeReq
version (2.Version
good_id (
pay_type (
option_data (	
ios_pay_order (	"ì
RechargeRes
errcode (

errcodedes (	
order_id (	
pay_type (
good_id (
option_data (	
ios_pay_order (	"S
DeliverGoodNtc
order_id (	
option_data (	
awards (2
.AwardItem"

BindAOAReq
rid ("S

BindAOARes
errcode (

errcodedes (	

actAddress (	
tkey (	"0
	DonateReq
goods_id (
	goods_num ("U
	DonateRes
errcode (

errcodedes (	
goods_id (
	goods_num ("e
DonateRecordItem

id (
rid (
goods_id (
	goods_num (
update_time ("
DonateRecordSelfReq"[
DonateRecordSelfRes
errcode (

errcodedes (	
list (2.DonateRecordItem"F
DonateRecordAllReq
hour24 (
index (
	page_size ("á
DonateRecordAllRes
errcode (

errcodedes (	
hour24 (
index (
size (
list (2.DonateRecordItem"-
KingCardNtc

award_item (2
.AwardItem"9
DzChangeNtc
dz_seat_index (
change_type ("n
DzScoreChangeNtc
rid (

seat_index (

base_score (
curscore (
change_type ("H
DzContinueNtc
rid (

seat_index (
action_timeout ("'
DzContinueReq
is_dz_continue ("4
DzContinueRes
errcode (

errcodedes (	"N
DzContinueResultNtc
rid (

seat_index (
is_dz_continue ("+

BetWinInfo
rid (
winmoney ("…
GameEndResultNtc2Watch
play_rule_type (
	game_type (
dz_winmoney (
winmoney ("
	rank_list (2.RankPlayerInfo
action_to_time (
record (2.RecordCell
	road_node (2	.RoadNode
cards_zhuang (

cards_xian (
choushui_num (
dizhu_win_list (
player_win_win_list ()
players_bet_win_list (2.BetWinInfo&
rank_top_list (2.RankPlayerInfo
lucky (2.RankPlayerInfo"7
QDZPlayerListNtc#
qdz_players (2.QDZPlayerInfo"
GetTableRankListReq"^
GetTableRankListRes
errcode (

errcodedes (	"
	rank_list (2.RankPlayerInfo""
BuryingPointReq
type_id ("6
BuryingPointRes
errcode (

errcodedes (	"%
GetDetailInfoReq
	room_type (">
WinInfo
	bet_index (	
bet_num (
win_num ("â

DetailInfo
order_id (	
	rounds_id (
validbet (
	total_win (
end_time (
win_info_list (2.WinInfo"W
GetDetailInfoRes
errcode (

errcodedes (	
	info_list (2.DetailInfo"$
GetClientIcoinRankReq
rid ("6
IconRankInfo
type_id (
room_type_ids ("c
GetClientIcoinRankRes
errcode (

errcodedes (	%
icon_rank_list (2.IconRankInfo"H
DoOneSpinReq

line_count (
bets_num (

room_level ("C
ScoreOnWholeMatrix
type (
score (
multiple ("Ü
ScoreGroupOnOneLine
line_id (

element_id (
element_count (
score (
multiple (

from_right ("
OneRowItems
items ("Ë
DoOneSpinRes
errcode (

errcodedes (	
	item_rows (2.OneRowItems
	win_point (
win_free_times (2
score_group_on_lines (2.ScoreGroupOnOneLine
bonus_multiple (
bonus_score_list (
bonus_random_score	 (
remain_free_spin_times
 (
win_multiple (
spin_consume (
jackpot_win_point ("
SlotBounsScoreReq"G
SlotBounsScoreRes
errcode (

errcodedes (	
score ("0
SlotGameConfigReq
theme (
type ("î
SlotGameConfigRes
errcode (

errcodedes (	
theme (
type (
array1 (
last_spin_line_count (
last_spin_bets_num (
last_room_level (
last_spin_bibei_difen	 (
history_bibei_record
 (#
maryGameInfo (2.MaryGameInfo)
free_spin_info (2.SlotFreeSpinInfo
room_bet_multiple (
room_enter_limit (
bonus_score_list ("O
ShuiHu_DoOneSpinReq
bets_num (

room_level (

test_score	 (	"o
PlaySingleMaryGameInfo

inner_eles (
inner_multiple (
	outer_ele (
outer_multiple ("†
MaryGameInfo-
play_results (2.PlaySingleMaryGameInfo
can_play_times (
multiple (
score (
cur_step (
score_on_lines ("*
ShuiHu_MaryGameNextStepReq
step ("d
ShuiHu_MaryGameNextStepRes
errcode (

errcodedes (	
step (
is_finished ("⁄
ShuiHu_DoOneSpinRes
errcode (

errcodedes (	
	item_rows (2.OneRowItems
	win_point (
win_free_times (2
score_group_on_lines (2.ScoreGroupOnOneLine#
maryGameInfo (2.MaryGameInfo
win_multiple (
spin_consume (2
score_on_whole_matrix (2.ScoreOnWholeMatrix
jackpot_win_point ("3
ShuiHu_SelectWhetherBibeiReq
is_do_bibei ("â
ShuiHu_SelectWhetherBibeiRes
errcode (

errcodedes (	
is_do_bibei (
	win_point (
history_bibei_record ("#
ShuiHu_DoBibeiReq
select ("≥
ShuiHu_DoBibeiRes
errcode (

errcodedes (	
select (
dice_1 (
dice_2 (
accumulate_point (
win_multiple (
is_select_correct ("ê
RankInfo
rank (
rid (
rolename (	
photo (	
win_coin (
vip (
player_level (
online_time (".
GetRankInfoReq
rid (
type_id ("S
GetRankInfoRes
errcode (

errcodedes (	
	rank_list (2	.RankInfo"8
GetBankInfoReq
rid (
is_use_for_update ("£
GetBankInfoRes
errcode (

errcodedes (	
is_need_pwd (
	bank_coin (
is_use_for_update (
is_phone_bind (

is_set_pwd ("
OpenBankPwdReq
pwd (	"5
OpenBankPwdRes
errcode (

errcodedes (	"
BankVercodeReq
rid ("F
BankVercodeRes
errcode (

errcodedes (	
vercode (	"0
ModifyBankPwdReq
pwd (	
vercode (	"7
ModifyBankPwdRes
errcode (

errcodedes (	"
LoginBankReq
pwd (	"3
LoginBankRes
errcode (

errcodedes (	"-
AccessBankReq
status (
coin ("G
AccessBankRes
errcode (

errcodedes (	
	bank_coin ("5
TransferReq
transfer_rid (
coin_num ("2
TransferRes
errcode (

errcodedes (	"º
TransferInfo
transfer_rid (
transfer_name (	
transfer_time (	
transfer_coin_num (
transfer_fee_per (
from_rid (
	from_name (	
status ("!
TransferHistoryReq
rid ("_
TransferHistoryRes
errcode (

errcodedes (	$
transfer_list (2.TransferInfo"*
TransferConfirmationInfoReq
rid ("f
TransferConfirmationInfoRes
errcode (

errcodedes (	
rid (
transfer_name (	"
CashMoneyReq
coin ("A
CashMoneyRes
errcode (

errcodedes (	
coin ("6
CashRechargeNtc
type_id (

notice_msg (	"Q
FuLinMen_DoOneSpinReq
bets_num (

room_level (

test_score	 (	"x
FuLinMen_DuiJinYuModel
is_duijinyu_model (
remain_free_spin_times (
coin_num (
	total_win ("œ
FuLinMen_DoOneSpinRes
errcode (

errcodedes (	
	item_rows (2.OneRowItems
	win_point (
win_free_times (2
score_group_on_lines (2.ScoreGroupOnOneLine
remain_free_spin_times
 (
win_multiple (
spin_consume (
free_spin_total_win (
is_free_spin_end (
duijinyu_total_win (
duijinyu_free_spin_time (
is_duijinyu_start (
is_duijinyu_end (
fumantang_award_point ("R
SlotFreeSpinInfo
remain_free_spin_times (
current_accumate_score ("P
DuiJinYuInfo
duijinyu_free_time ($
last_item_rows (2.OneRowItems"*
FuLinMen_SlotGameConfigReq
type ("ç
FuLinMen_SlotGameConfigRes
errcode (

errcodedes (	
type (
array1 (
last_spin_line_count (
last_spin_bets_num (
last_room_level ()
free_spin_info	 (2.SlotFreeSpinInfo$
duijinyu_info
 (2.DuiJinYuInfo
dafu_base_value (
xiaofu_base_value (
fumantang_base_multiple (
room_bet_multiple (
room_enter_limit ("4
FuLinMen_FuManTangAwardPoolReq

room_level ("c
FuLinMen_FuManTangAwardPoolRes
errcode (

errcodedes (	
fumantang_pool_value ("N
JieBa_DoOneSpinReq
bets_num (

room_level (

test_score	 (	"Ü
JieBa_DoOneSpinRes
errcode (

errcodedes (	
	item_rows (2.OneRowItems
	win_point (
win_free_times (
score_eles_pos (
remain_free_spin_times
 (
win_multiple (
spin_consume (
free_spin_total_win (
is_free_spin_end (*
bonus_multiple_array (2.OneRowItems
bonus_init_free_times (
jackpot_win_point ("R
JieBa_BonusGameNextStepReq
step (

box_select (

total_step ("d
JieBa_BonusGameNextStepRes
errcode (

errcodedes (	
step (
is_finished ("å
JieBa_BonusGameInfo*
bonus_multiple_array (2.OneRowItems
cur_step (
bonus_init_free_times (
box_select_array ("'
JieBa_SlotGameConfigReq
type ("æ
JieBa_SlotGameConfigRes
errcode (

errcodedes (	
type (
array1 (
last_spin_line_count (
last_spin_bets_num (
last_room_level ()
free_spin_info	 (2.SlotFreeSpinInfo-
bonus_game_info
 (2.JieBa_BonusGameInfo
room_bet_multiple (
room_enter_limit ("O
SanGuo_DoOneSpinReq
bets_num (

room_level (

test_score	 (	"∏
SanGuo_DoOneSpinRes
errcode (

errcodedes (	
	item_rows (2.OneRowItems
	win_point (
win_free_times (2
score_group_on_lines (2.ScoreGroupOnOneLine
bonus_remain_point (4
bonus_start_info (2.SanGuo_BonusGameStartInfo
win_multiple (
spin_consume ("T
SanGuo_RobotSelectInfo
food_select (

is_success (
	need_time ("ü
SanGuo_BonusGameStartInfo)
robotOne (2.SanGuo_RobotSelectInfo)
robotTwo (2.SanGuo_RobotSelectInfo

total_time (
remain_play_time ("0
SanGuo_BonusGameSelectReq
food_select ("|
SanGuo_BonusGameSelectRes
errcode (

errcodedes (	
food_select (

is_success (
	need_time ("v
SanGuo_BonusGameEndNtc
is_max_multiple (
	win_point (
win_multiple (
bonus_remain_point ("(
SanGuo_SlotGameConfigReq
type ("∑
SanGuo_SlotGameConfigRes
errcode (

errcodedes (	
type (
array1 (
last_spin_line_count (
last_spin_bets_num (
last_room_level (
bonus_remain_point	 (4
bonus_start_info
 (2.SanGuo_BonusGameStartInfo
room_bet_multiple (
room_enter_limit ("W
RoadNode
state (
is_zhuangdui (

is_xiandui (

is_tianpai (".

HHRoadNode
state (
	card_type (".

LHRoadNode
state (
	card_type ("J
PropRoomInfo
	room_type (
	game_type (
is_close_all ("5
PropRoomNtc&
limit_room_info (2.PropRoomInfo"4
PropMoneyPageInfo
type_id (
status ("I
PropMoneyPageInfoNtc1
limit_money_page_info (2.PropMoneyPageInfo".
SlotJackPotPoolValReq
req_game_type ("E
SlotJackPotPoolValInfo
	game_type (
jackpot_val_list ("z
SlotJackPotPoolValRes
errcode (

errcodedes (	
req_game_type (%
info (2.SlotJackPotPoolValInfo"P
SlotSingleRoomJackPotPoolValReq
req_game_type (
req_room_level ("ä
SlotSingleRoomJackPotPoolValRes
errcode (

errcodedes (	
req_game_type (
req_room_level (
jackpot_val ("*
LZTanBao_SlotGameConfigReq
type ("…
LZTanBao_Status_info
total_bets_num (
eliminate_box (
longzhu_num (
level (
max_bets (
last_spin_line_count (
last_spin_bets_num (

room_level ("»
LZTanBao_SlotGameConfigRes
errcode (

errcodedes (	
type (
array1 (
room_bet_multiple (
room_enter_limit (2
longzhu_status_info (2.LZTanBao_Status_info"e
LZTanBao_DoOneSpinReq

room_level (
bets_num (

line_count (

test_score	 (	"
Pos	
x (	
y ("1
gem_item
one_line (2.Pos
score ("P
MatrixDataInfo!
matrix_data (2.OneRowItems
gem_list (2	.gem_item"ı
LZTanBao_DoOneSpinRes
errcode (

errcodedes (	)
matrix_data_list (2.MatrixDataInfo2
longzhu_status_info (2.LZTanBao_Status_info
spin_consume (
win_multiple (
	win_point (
jackpot_win_point ("C
LZTanBao_DoTanBaoReq
jubaopeng_index (

room_level ("m
LZTanBao_DoTanBaoRes
errcode (

errcodedes (	
single_longzhu_coin (
longzhu_num ("S
RRShengCai_DoOneSpinReq
bets_num (

room_level (

test_score	 (	"˛
RRShengCai_DoOneSpinRes
errcode (

errcodedes (	
	item_rows (2.OneRowItems
	win_point (
win_free_times (2
score_group_on_lines (2.ScoreGroupOnOneLine
remain_free_spin_times
 (
win_multiple (
spin_consume (
free_spin_total_win (
is_free_spin_end (
jackpot_win_point ( 
is_need_select_free_type ("E
RRShengCai_FreeTypeSelectReq

room_level (
	free_type ("ã
RRShengCai_FreeTypeSelectRes
errcode (

errcodedes (	
	free_type (
free_spin_times (
free_spin_multiple (",
RRShengCai_SlotGameConfigReq
type ("“
RRShengCai_SlotGameConfigRes
errcode (

errcodedes (	
type (
array1 (
last_spin_line_count (
last_spin_bets_num (
last_room_level ()
free_spin_info	 (2.SlotFreeSpinInfo 
is_need_select_free_type
 (
room_bet_multiple (
room_enter_limit (
free_spin_multiple (")
Line888_SlotGameConfigReq
type ("(
Line888_Status_info
	total_win ("ƒ
Line888_SlotGameConfigRes
errcode (

errcodedes (	
type (
array1 (
last_spin_line_count (
last_spin_bets_num (
last_room_level ()
free_spin_info	 (2.SlotFreeSpinInfo1
line888_status_info
 (2.Line888_Status_info
room_bet_multiple (
room_enter_limit ("P
Line888_DoOneSpinReq

room_level (
bets_num (

line_count ("–
Line888_DoOneSpinRes
errcode (

errcodedes (	
ele_id (
win_free_times (
win_multiple (
	win_point (
jackpot_win_point (
	total_win	 (
spin_consume
 ("(
Line888_shoufenReq

room_level ("O
Line888_shoufenRes
errcode (

errcodedes (	
shoufen_coin ("&
DJDL_SlotGameConfigReq
type ("„
DJDL_SlotGameConfigRes
errcode (

errcodedes (	
type (
array1 (
last_spin_line_count (
last_spin_bets_num (
last_room_level (
room_bet_multiple	 (
room_enter_limit
 ("M
DJDL_DoOneSpinReq
bets_num (

room_level (

test_score	 (	"°
DJDL_DoOneSpinRes
errcode (

errcodedes (	
items (
win_multiple (
	win_point (
jackpot_win_point (
spin_consume ("N
Line9_DoOneSpinReq
bets_num (

room_level (

test_score	 (	"¸
Line9_DoOneSpinRes
errcode (

errcodedes (	
	item_rows (2.OneRowItems
	win_point (
win_free_times (2
score_group_on_lines (2.ScoreGroupOnOneLine#
maryGameInfo (2.MaryGameInfo
win_multiple (
spin_consume	 (
jackpot_win_point
 (
remain_free_spin_times (
is_free_spin_end (
free_spin_total_win (")
Line9_MaryGameNextStepReq
step ("c
Line9_MaryGameNextStepRes
errcode (

errcodedes (	
step (
is_finished ("&
YGBH_SlotGameConfigReq
type ("f
YGBH_TurnGameInfo
is_can_turn (
suipian_num (
bets_num (
bets_num_list ("û
YGBH_SlotGameConfigRes
errcode (

errcodedes (	
theme (
type (
array1 (
last_spin_line_count (
last_spin_bets_num (
last_room_level ()
turnGameInfos (2.YGBH_TurnGameInfo)
free_spin_info (2.SlotFreeSpinInfo
free_mode_type (
room_bet_multiple (
room_enter_limit ( 
is_need_select_free_type (
free_zixi_line_num ("M
YGBH_DoOneSpinReq
bets_num (

room_level (

test_score	 (	"æ
YGBH_DoOneSpinRes
errcode (

errcodedes (	
	item_rows (2.OneRowItems
	win_point (
win_free_times (2
score_group_on_lines (2.ScoreGroupOnOneLine
win_multiple (
spin_consume	 (
jackpot_win_point
 (
remain_free_spin_times (
is_free_spin_end (
free_spin_total_win ((
turnGameInfo (2.YGBH_TurnGameInfo 
is_need_select_free_type (
free_zixi_line_num ("$
YGBH_DoTurnReq

room_level ("y
YGBH_DoTurnRes
errcode (

errcodedes (	
win_multiple (
	win_point (
jackpot_win_point (",
YGBH_FreeTypeSelectReq

room_level ("U
YGBH_FreeTypeSelectRes
errcode (

errcodedes (	
free_mode_type ("ì
JPM_BonusGameInfo
can_play_times (
cur_step (

total_step (
score (
bonus_random_score (
picture_index ("E
RoleInfo
rid (
rolename (	
logo (	
coin ("%
JPM_SlotGameConfigReq
type ("⁄
JPM_SlotGameConfigRes
errcode (

errcodedes (	
type (
array1 (
last_spin_line_count (
last_spin_bets_num (
last_room_level ()
free_spin_info	 (2.SlotFreeSpinInfo(
maryGameInfo
 (2.JPM_BonusGameInfo
room_bet_multiple (
room_enter_limit (!
role_info_list (2	.RoleInfo"`
JPM_DoOneSpinReq
bets_num (

line_count (

room_level (

test_score (	"ˇ
JPM_DoOneSpinRes
errcode (

errcodedes (	
	item_rows (2.OneRowItems
	win_point (
win_free_times (2
score_group_on_lines (2.ScoreGroupOnOneLine
win_multiple (
spin_consume	 (
remain_free_spin_times (
is_free_spin_end (
free_spin_total_win ((
maryGameInfo (2.JPM_BonusGameInfo
jackpot_win_point ("<
JPM_BonusGameNextStepReq
step (

box_select ("b
JPM_BonusGameNextStepRes
errcode (

errcodedes (	
step (
is_finished ("8
JPM_PlayerChangeNtc!
role_info_list (2	.RoleInfo"3
JPM_StatusReq
status (

room_level ("4
JPM_StatusRes
errcode (

errcodedes (	"T
JDQS_SmallGameInfo
	shot_list (2.Pos

kulou_nums (
	blood_num (":
JDQS_BloodInfo
pos (2.Pos
off_blood_num ("ˆ
JDQS_MatrixInfo
	item_rows (2.OneRowItems2
score_group_on_lines (2.ScoreGroupOnOneLine
	win_point (
jackpot_win_point (
win_multiple ($
blood_infos (2.JDQS_BloodInfo
	kulou_num (
	blood_num ("&
JDQS_SlotGameConfigReq
type ("Ω
JDQS_SlotGameConfigRes
errcode (

errcodedes (	
type (
array1 (
last_spin_line_count (
last_spin_bets_num (
last_room_level ()
free_spin_info	 (2.SlotFreeSpinInfo
room_bet_multiple (
room_enter_limit (-
small_game_infos (2.JDQS_SmallGameInfo"a
JDQS_DoOneSpinReq
bets_num (

line_count (

room_level (

test_score (	"Í
JDQS_DoOneSpinRes
errcode (

errcodedes (	!
matrixs (2.JDQS_MatrixInfo
	win_point (
win_free_times (
win_multiple (
spin_consume	 (
remain_free_spin_times (
is_free_spin_end (
free_spin_total_win (
jackpot_win_point (,
small_game_info (2.JDQS_SmallGameInfo
free_final_win ("&
SMYH_SlotGameConfigReq
type ("é
SMYH_SlotGameConfigRes
errcode (

errcodedes (	
type (
array1 (
last_spin_line_count (
last_spin_bets_num (
last_room_level ()
free_spin_info	 (2.SlotFreeSpinInfo
room_bet_multiple (
room_enter_limit ("a
SMYH_DoOneSpinReq
bets_num (

line_count (

room_level (

test_score (	"§
SMYH_DoOneSpinRes
errcode (

errcodedes (	!
matrixs (2.JDQS_MatrixInfo
	win_point (
win_free_times (
win_multiple (
spin_consume	 (
remain_free_spin_times (
is_free_spin_end (
free_spin_total_win (
jackpot_win_point ("*
WUZETIAN_SlotGameConfigReq
type ("Ê
WUZETIAN_SlotGameConfigRes
errcode (

errcodedes (	
type (
array1 (
last_spin_line_count (
last_spin_bets_num (
last_room_level ()
free_spin_info	 (2.SlotFreeSpinInfo
room_bet_multiple
 (
room_enter_limit (
is_gold_free_model (
gold_free_item_list (
bibei_result_list ("e
WUZETIAN_DoOneSpinReq
bets_num (

line_count (

room_level (

test_score (	"‡
WUZETIAN_DoOneSpinRes
errcode (

errcodedes (	
	item_rows (2.OneRowItems
	win_point (
win_free_times (2
score_group_on_lines (2.ScoreGroupOnOneLine
win_multiple (
spin_consume (
remain_free_spin_times	 (
is_free_spin_end
 (
free_spin_total_win (
jackpot_win_point (
is_gold_free_model (
gold_free_item_list (
is_can_bibei (
bibei_result_list (
is_gold_free_begin (">
WUZETIAN_DoBibeiReq
select_color (
	select_id ("¡
WUZETIAN_DoBibeiRes
errcode (

errcodedes (	
select_color (
	select_id (
result_color (
	result_id (
accumulate_point (
is_select_correct	 ("
WUZETIAN_GiveUpBibeiReq"l
WUZETIAN_GiveUpBibeiRes
errcode (

errcodedes (	
	win_point (
jackpot_win_point ("&
CQBY_SlotGameConfigReq
type ("Ã
CQBY_SlotGameConfigRes
errcode (

errcodedes (	
type (
array1 (
last_spin_line_count (
last_spin_bets_num (
last_room_level (
room_bet_multiple
 (
room_enter_limit (
win_multiple (
win_point_all (
sceneid (
stageid (
is_in_small_game ("a
CQBY_DoOneSpinReq
bets_num (

line_count (

room_level (

test_score (	"Æ
CQBY_DoOneSpinRes
errcode (

errcodedes (	
	item_rows (2.OneRowItems
	win_point (
win_free_times (2
score_group_on_lines (2.ScoreGroupOnOneLine
win_multiple (
spin_consume (
jackpot_win_point	 (
is_get_small_game
 (

wild_mutil ("-
CQBY_DoSelectSceneReq
select_scene ("R
CQBY_DoSelectSceneRes
errcode (

errcodedes (	
select_scene ("+
CQBY_DoFightBossReq
select_stage ("œ
CQBY_DoFightBossRes
errcode (

errcodedes (	
	win_point (
jackpot_win_point (
win_point_all (
sceneid (
stageid (
win_multiple (
line_win_point	 ("≠
CurrentFish
rid (

fish_group (
	fish_flag (
only_number (
progress (
status (
CategoryBitmask (	
ContactTestBitmask (	"í
FishPlayerInfo
rid (
	pay_times (
weapon_type (
coin (
angle (
rolename (	
coins (
index ("G
PushFishGroup
btide (
only_number (

fish_group ("f
FishWeaponInfo
rid (
	game_type (
	pay_times (
weapon_type (
coin ("ı

FishWeapon
rid (
	game_type (

fish_group (
	fish_flag (
angle (
	pay_times (
weapon_type (
	lock_fish (2.CurrentFish
coin	 (
only_number
 (	
x (	
y (
bitmask (	"-
FishGeneral
ivalue (
bvalue ("∞
	FishDeath
rid (

fish_group (
	fish_flag (
win_coin (
	body_coin (
	pay_times (
weapon_type (
only_number (
death	 ("á
FishOpenFire
rid (
angle (
coin (
weapon_type (
	pay_times (	
x (	
y (
bitmask (	"U
FishScreenPlayerInfo
fishs (2.CurrentFish 
players (2.FishPlayerInfo"b
FishSpecialDeath
only_number (
	fish_flag (
win_coin (
special_type ("»
FishGroupDeath
rid (
only_number (
	fish_flag (
	game_type (!
deaths (2.FishSpecialDeath
	pay_times (
weapon_type (
win_coin (
	body_coin	 (""
FISH_GameConfigReq
type ("õ
FISH_GameConfigRes
errcode (

errcodedes (	
theme (
type (
array1 (
room_bet_multiple (
room_enter_limit ("ﬁ
DoFishOperationReq
command (
version (2.Version

id (

roomsvr_id (	
roomsvr_table_address ('
request_fish_info (2.FishGeneral$
weapon_info (2.FishWeaponInfo
	open_fire (2.FishWeapon 
attack_fish	 (2.FishWeapon
	lock_fish
 (2.CurrentFish+
special_fish_death (2.FishGroupDeath"§
DoFishOperationRes
command (
errcode (

errcodedes (	(
	fish_info (2.FishScreenPlayerInfo$
weapon_info (2.FishWeaponInfo 
	open_fire (2.FishOpenFire

fish_death (2
.FishDeath
	lock_fish (2.CurrentFish'
push_fish_group	 (2.PushFishGroup
tide
 (2.FishGeneral1
special_fish_group_death (2.FishGroupDeath-
special_fish_death (2.FishSpecialDeath",
DoFishKickPlayerLeaveTableNtc
msg (	"ã
GFXM_BonusGameInfo*
bonus_multiple_array (2.OneRowItems
cur_step (
bonus_init_free_times (
box_select_array ("&
GFXM_SlotGameConfigReq
type ("º
GFXM_SlotGameConfigRes
errcode (

errcodedes (	
type (
array1 (
last_spin_line_count (
last_spin_bets_num (
last_room_level ()
free_spin_info	 (2.SlotFreeSpinInfo,
bonus_game_info
 (2.GFXM_BonusGameInfo
room_bet_multiple (
room_enter_limit ("M
GFXM_DoOneSpinReq
bets_num (

room_level (

test_score	 (	"Ö
GFXM_DoOneSpinRes
errcode (

errcodedes (	
	item_rows (2.OneRowItems
	win_point (
win_free_times (
score_eles_pos (
remain_free_spin_times
 (
win_multiple (
spin_consume (
free_spin_total_win (
is_free_spin_end (*
bonus_multiple_array (2.OneRowItems
bonus_init_free_times (
jackpot_win_point ("Q
GFXM_BonusGameNextStepReq
step (

box_select (

total_step ("c
GFXM_BonusGameNextStepRes
errcode (

errcodedes (	
step (
is_finished ("æ
LHPlayerInfo
rid (
rolename (	
logo (	
lucky (

win_num_20 (
total_score_20 (
coins (
	bigwinner (
	win_point	 (
	vip_level
 ("Ä
LHTablePlayerNtc
isend (
list (2.LHPlayerInfo
hh_road (2.LHRoadNode"
player_info (2.LHPlayerInfo"5
LHAllCardsNtc

long_cards (
hu_cards ("0
AJDB_SmallItemInfo

id (
isopen ("I
AJDB_SmallLineInfo"
infos (2.AJDB_SmallItemInfo
mutiple ("8
AJDB_SmallGameInfo"
lines (2.AJDB_SmallLineInfo"&
AJDB_SlotGameConfigReq
type ("ê
AJDB_SlotGameConfigRes
errcode (

errcodedes (	
type (
array1 (
last_spin_line_count (
last_spin_bets_num (
last_room_level (+
all_smallgames	 (2.AJDB_SmallGameInfo
room_bet_multiple
 (
room_enter_limit ("M
AJDB_DoOneSpinReq
bets_num (

room_level (

test_score	 (	"Ÿ
AJDB_DoOneSpinRes
errcode (

errcodedes (	
	item_rows (2.OneRowItems
	win_point (
score_eles_pos (
win_multiple (
spin_consume (2
score_group_on_lines (2.ScoreGroupOnOneLine,
cur_other_lines	 (2.AJDB_SmallLineInfo-
next_other_lines
 (2.AJDB_SmallLineInfo
base_win_point ("U
Fruit_Line11_DoOneSpinReq

line_count (
bets_num (

room_level ("ƒ
Fruit_Line11_DoOneSpinRes
errcode (

errcodedes (	
	item_rows (2.OneRowItems
	win_point (
win_free_times (2
score_group_on_lines (2.ScoreGroupOnOneLine
bonus_multiple (
bonus_score_list (
bonus_random_score	 (
remain_free_spin_times
 (
win_multiple (
spin_consume (
quanpan_win_point (
score_eles_pos (
is_free_spin_end (
free_spin_total_win (" 
Fruit_Line11_SlotBounsScoreReq"T
Fruit_Line11_SlotBounsScoreRes
errcode (

errcodedes (	
score ("&
BQTP_SlotGameConfigReq
type ("é
BQTP_SlotGameConfigRes
errcode (

errcodedes (	
type (
array1 (
last_spin_line_count (
last_spin_bets_num (
last_room_level ()
free_spin_info	 (2.SlotFreeSpinInfo
room_bet_multiple (
room_enter_limit ("s
BQTP_MatrixInfo
	item_rows (2.OneRowItems
score_eles_pos (
	win_point (
win_multiple ("M
BQTP_DoOneSpinReq
bets_num (

room_level (

test_score (	"™
BQTP_DoOneSpinRes
errcode (

errcodedes (	
	item_rows (2.OneRowItems
	win_point (
win_free_times (!
matrixs (2.BQTP_MatrixInfo
remain_free_spin_times
 (
win_multiple (
spin_consume (
free_spin_total_win (
is_free_spin_end (