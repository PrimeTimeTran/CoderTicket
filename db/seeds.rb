# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#

# Create Regions
['North East', 'West Coast', 'South East', 'Deep South'].each do |r|
  Region.create!(name: r)
end
# Create Categories
['Entertainment', 'Learning', 'Family', 'Tech', 'Everything Else', 'Sporting'].each do |c|
  Category.create!(name: c)
end

###########
# Event One
###########
madison_square = Venue.create!({
  name: 'Madison Square Garden',
  full_address: Faker::Address.street_address,
  region: Region.find_by(name: 'North East')
})

e = Event.create!({
  name: Faker::Name.title,
  starts_at: 1.year.from_now,
  ends_at: 1.year.from_now,
  venue: madison_square,
  category: Category.find_by(name: 'Everything Else'),
  hero_image_url: 'https://www.nycgo.com/images/venues/98/madisonsquaregarden-courtesymsg-b70005-rtw__x_large.jpg',
  card_description: Faker::Lorem.paragraph,
  extended_html_description: <<-DESC
    <p style="text-align:center"><span style="font-size:20px">VIỆT NAM THỬ THÁCH CHIẾN THẮNG 2016</span></p>
    <p style="text-align:center"><span style="font-size:20px">Giải đua xe đạp địa hình 11-13/03/2016</span></p>
    <p style="text-align:center"><span style="font-size:16px"><span style="font-family:arial,helvetica,sans-serif">Việt Nam Th</span>ử Thách Chiến Thắng là giải đua xe đạp địa hình được tổ chức như một sự tri ân, và cũng nhằm thỏa mãn lòng đam mẹ của những người yêu xe đạp địa hình nói chung, cũng như cho những ai đóng góp vào môn thể thao đua xe đạp tại thành phố Hồ Chí Minh. Cuộc đua diễn ra ở thành phố cao nguyên hùng vĩ Đà Lạt, với độ cao 1,500m (4,900ft) so với mặt nước biển. Đến với đường đua này ngoài việc tận hưởng cảnh quan nơi đây, bạn còn có cơ hội biết thêm về nền văn hóa của thành phố này. </span></p>
    <p style="text-align:center"><span style="font-size:16px">Hãy cùng với hơn 350 tay đua trải nghiệm 04 lộ trình đua tuyệt vời diễn ra trong 03 ngày tại Đà Lạt và bạn sẽ có những kỉ niệm không bao giờ quên!</span></p>
    <p style="text-align:center"><span style="font-size:16px">Để biết thêm thông tin chi tiết và tạo thêm hứng khởi cho cuộc đua 2016, vui lòng ghé thăm trang web</span></p>
    <p style="text-align:center"><span style="font-size:16px"><strong><span style="background-color:transparent; color:rgb(0, 0, 0)">www.vietnamvictorychallenge.com. </span></strong></span></p>
  DESC
})
e.ticket_types << TicketType.create(name: 'Regular', price: 99, max_quantity: 1000)
e.ticket_types << TicketType.create(name: 'Gold', price: 150, max_quantity: 500)
e.ticket_types << TicketType.create(name: 'Diamond', price: 250, max_quantity: 100)

###########
# Event Two
###########
dan_venue = Venue.create({
  name: 'Hollywood Bowl',
  full_address: Faker::Address.street_address,
  region: Region.find_by(name: 'West Coast')
})

e = Event.create({
  name: Faker::Name.title,
  venue: dan_venue,
  category: Category.find_by(name: 'Entertainment'),
  starts_at: 4.years.from_now,
  ends_at: 5.years.from_now,
  hero_image_url: 'http://cdn.abclocal.go.com/content/kabc/images/cms/1756437_1280x720.jpg',
  card_description: Faker::Lorem.paragraph,
  extended_html_description: <<-DESC
  <p style="text-align:justify"> </p>

  <p style="text-align:justify">Đan Trường cũng tiết lộ kế hoạch chuẩn bị cho live show kỷ niệm 20 năm ca hát của anh, sẽ diễn ra vào ngày 16-1-2016. “Nói ra, mọi người bảo tôi lo xa nhưng tính tôi là vậy. Tôi là người kỹ tính và chỉn chu trong mọi việc nên không cho phép sai sót, dù nhỏ, trong live show của mình. Để đạt được điều ấy, tôi phải chuẩn bị thật kỹ. Đó là chưa kể có rất nhiều chuyện phải làm cho đến khi diễn ra live show, như phát hành các sản phẩm âm nhạc” - anh tâm sự.</p>

  <p style="text-align:justify"> </p>

  <p style="text-align:justify"><img src="https://az810747.vo.msecnd.net/agenda/2015/12/14/57EEE9.jpg" /></p>

  <p style="text-align:justify"> </p>

  <p style="text-align:justify">Vẫn là một Đan Trường đa năng bởi sự đa sắc trong âm nhạc, anh đang khát vọng chinh phục mọi đối tượng công chúng yêu nhạc của mình một cách hoàn hảo nhất. Mỗi người có một nhận định, đánh giá riêng về chất giọng cũng như phong cách biểu diễn của Đan Trường nhưng những thành tích mà ca sĩ này gặt hái được trong suốt nhiều năm theo đuổi nghiệp hát thì không ai có thể phủ nhận. 19 năm ca hát, Đan Trường của ngày nay vẫn là một giọng ca được đông đảo công chúng yêu mến.</p>

  <p style="text-align:justify"> </p>

  <p style="text-align:justify">Xét ở mọi góc độ, thành công của ca sĩ Đan Trường tại thị trường âm nhạc còn sơ khai như của Việt Nam những năm cuối thập niên 1990 có thể xem là một kỳ tích. Anh xuất hiện khiêm tốn nhưng nhanh chóng tỏa sáng và trở nên nổi bật giữa một rừng ngôi sao ca nhạc Việt Nam lúc ấy.</p>

  <p style="text-align:justify"> </p>

  <p style="text-align:justify">Nhìn lại hành trình đã qua của Đan Trường, không thể bỏ qua yếu tố may mắn khi mọi thứ đối với anh gần như được trải hoa hồng. “Thành tựu 19 năm qua mà tôi có được rõ ràng là nhờ may mắn nhưng nếu không có sự cố gắng và nỗ lực một cách tận tâm của mình và cả ông bầu Hoàng Tuấn, tôi không tin có thể đạt được như vậy. Một nghệ sĩ trụ lâu được ở thị trường giải trí là nhờ sự ủng hộ của khán giả nhưng nếu nghệ sĩ ấy không chứng minh cho khán giả thấy mình xứng đáng được yêu mến, công chúng cũng sẽ quay lưng” - Đan Trường chiêm nghiệm.</p>

  <p style="text-align:justify"> </p>

  <p style="text-align:justify">“Đan Trường chính là hiện thân một ca sĩ thần tượng đúng nghĩa nhất bởi hiệu ứng tổng thể mang lại từ vóc dáng, giọng hát tình cảm và quan trọng hơn là cách chọn bài hát khá khéo léo của anh. Đan Trường luôn có những ca khúc ăn khách mỗi khi giới thiệu một sản phẩm âm nhạc mới” - ca sĩ Cẩm Ly nhận xét.</p>

  <p style="text-align:justify"> </p>

  <p style="text-align:justify">Theo nhạc sĩ Hữu Minh, những cái mới phù hợp với trào lưu hiện tại cũng như với văn hóa của người Việt sẽ mau chóng được công chúng đón nhận. “Thành công của Đan Trường một phần là nhờ sự đón đầu xu hướng mới đó” - nhạc sĩ này khẳng định.</p>

  <p style="text-align:justify"> </p>

  <p style="text-align:justify">Mỗi sản phẩm âm nhạc của Đan Trường khi ra mắt đều trở thành bản hit (ăn khách) trên các bảng xếp hạng. Hẳn nhiên, sự yêu mến không điều kiện, vô tư của lực lượng fan (người hâm mộ) hùng hậu đã góp phần không nhỏ trong việc đưa một ca khúc mới của thần tượng đứng đầu bảng xếp hạng âm nhạc. Song, không khó để nhận ra Đan Trường là ca sĩ không ngại thể nghiệm những điều mới mẻ để mang đến người yêu nhạc những sản phẩm lạ tai, đón đầu xu hướng.</p>

  <p style="text-align:justify"> </p>

  <p style="text-align:justify"><img src="https://az810747.vo.msecnd.net/agenda/2015/12/14/06EAAD.jpg" /></p>

  <p style="text-align:justify"> </p>

  <p style="text-align:justify"> </p>

  <p style="text-align:justify">Từ nhạc trẻ, trữ tình, âm hưởng dân ca, sử ca, truyền thống cách mạng, đến cả nhạc dance, hip hop, R&B..., Đan Trường đều thử sức, bất chấp tuổi tác. Sự nỗ lực đó luôn mang lại cho anh những quả ngọt là sự đón nhận của khán giả, thậm chí trong từng thể loại âm nhạc khác nhau.</p>

  <p style="text-align:justify"> </p>

  <p style="text-align:center"><span style="font-size:20px"><strong>HOTLINE ĐẶT VÉ: 091-333-2198</strong></span></p>

  <p style="text-align:justify"> </p>

  <p style="text-align:justify"><img src="https://az810747.vo.msecnd.net/agenda/2015/12/14/0714C1.jpg" /></p>

  <p style="text-align:justify"> </p>

                          </div>

                          <!--/agenda-->
                      </div>
                  </div>

  DESC
})

e.ticket_types << TicketType.create(name: 'General', price: 50, max_quantity: 10000)
e.ticket_types << TicketType.create(name: 'Gold', price: 100, max_quantity: 2500)
e.ticket_types << TicketType.create(name: 'Diamond', price: 200, max_quantity: 1000)
e.ticket_types << TicketType.create(name: 'VIP', price: 500, max_quantity: 500)

###########
# Event Three
###########

gap = Venue.create!({
  name: 'Radio City Music Hall',
  full_address: Faker::Address.street_address,
  region: Region.find_by(name: 'North East')
  })

e = Event.create!({
  name: Faker::Name.title,
  starts_at: 5.years.from_now,
  ends_at: 6.years.from_now,
  venue: gap,
  category: Category.find_by(name: 'Entertainment'),
  hero_image_url:'http://cruiselinehistory.com/wp-content/uploads/2009/10/rcmh_interior491_.jpg',
  card_description: Faker::Lorem.paragraph,
  extended_html_description: <<-DESC
         <p>
  <span style="background-color:rgb(255, 255, 255); color:rgb(20, 24, 35); font-family:helvetica,arial,sans-serif; font-size:14px">* Bạn một m&igrave;nh, bạn FA ?</span><br />
  <span style="background-color:rgb(255, 255, 255); color:rgb(20, 24, 35); font-family:helvetica,arial,sans-serif; font-size:14px">* Bạn chưa biết l&agrave;m g&igrave; v&agrave;o tối thứ năm cuối th&aacute;ng 12 n&agrave;y ?</span><br />
  <span style="background-color:rgb(255, 255, 255); color:rgb(20, 24, 35); font-family:helvetica,arial,sans-serif; font-size:14px">* Đ&oacute; l&agrave; đ&ecirc;m gi&aacute;ng sinh, bạn muốn một buổi tối vui vẻ ?</span><br />
  <span style="background-color:rgb(255, 255, 255); color:rgb(20, 24, 35); font-family:helvetica,arial,sans-serif; font-size:14px">* Bạn muốn nghe những b&agrave;i h&aacute;t hay l&atilde;ng mạn mộc mạc b&ecirc;n c&acirc;y đ&agrave;n guitar ?</span><br />
  <span style="background-color:rgb(255, 255, 255); color:rgb(20, 24, 35); font-family:helvetica,arial,sans-serif; font-size:14px">* Buffet với tr&agrave;, b&aacute;nh kẹo ngon, tr&aacute;i c&acirc;y tươi đa dạng, phong ph&uacute; với những người bạn mới th&uacute; vị ?</span><br />
  <span style="background-color:rgb(255, 255, 255); color:rgb(20, 24, 35); font-family:helvetica,arial,sans-serif; font-size:14px">*Được nhận những m&oacute;n qu&agrave; bất ngờ từ &ocirc;ng gi&agrave; Noel :D ?</span><br />
  <br />
  <span style="background-color:rgb(255, 255, 255); color:rgb(20, 24, 35); font-family:helvetica,arial,sans-serif; font-size:14px">Nếu bạn cảm thấy thoải m&aacute;i, hứng khởi về những điều tr&ecirc;n bạn h&atilde;y đến với chương tr&igrave;nh Merry Christmas Never Alone do Gap Yolo Hanoi tổ chức tại 1B Quốc Tử Gi&aacute;m, ngay trung t&acirc;m H&agrave; Nội, tr&ecirc;n tầng 5 ngắm phố phường đ&ocirc;ng đ&uacute;c, nhộn nhịp qua lại v&agrave; bầu trời thanh b&igrave;nh H&agrave; Nội.</span><br />
  <br />
  <span style="background-color:rgb(255, 255, 255); color:rgb(20, 24, 35); font-family:helvetica,arial,sans-serif; font-size:14px">Gi&aacute; v&eacute; chỉ 99K/ v&eacute;/ người (đ&atilde; bao gồm v&eacute; giữ xe)</span><br />
  <br />
  <span style="background-color:rgb(255, 255, 255); color:rgb(20, 24, 35); font-family:helvetica,arial,sans-serif; font-size:14px">Ngo&agrave;i ra c&ograve;n nhiều Voucher tặng bạn v&ocirc; c&ugrave;ng hấp dẫn :D</span></p>

                        </div>

  DESC
})
e.ticket_types << TicketType.create(name: 'General', price: 50, max_quantity: 5000)
e.ticket_types << TicketType.create(name: 'Box', price: 100, max_quantity: 1000)
e.ticket_types << TicketType.create(name: 'Floor', price: 1000, max_quantity: 500)
e.ticket_types << TicketType.create(name: 'Stage', price: 2000, max_quantity: 250)

###########
# Event Four
###########
dalat = Venue.create!({
  name: 'Doak Campbell Stadium',
  full_address: '2405 Nugget Lane',
  region: Region.find_by(name: 'South East')
})

e = Event.create!({
  name: 'Garnet & Gold Game',
  starts_at: 2.years.from_now,
  ends_at: 3.years.from_now,
  venue: dalat,
  category: Category.find_by(name: 'Sporting'),
  hero_image_url: 'http://www.tallahasseeseminoleclub.com/wp-content/uploads/2015/07/doak021009.jpg',
  card_description: 'The Florida State Athletics Department announced the events surrounding the Sun Trust Football Spring Weekend presented by the Florida Restaurant and Lodging Association and Visit Florida on Thursday.',
  extended_html_description: <<-DESC
    <p style="text-align:center"><span style="font-size:20px">Random Photo of us from Cuong's Wedding</span></p>
    <p style="text-align:center"><span style="font-size:20px">Tons of cool information about when this will be!</span></p>
    <p style="text-align:center"><span style="font-size:16px"><span style="font-family:arial,helvetica,sans-serif">Việt Nam Th</span>Just some random text</span></p>
    <p style="text-align:center"><span style="font-size:16px">Some more random text</span></p>
    <p style="text-align:center"><span style="font-size:16px">Do tell, now," cried Bildad, "is this Philistine a regular member of Deacon Deuteronomy's meeting? I never saw him going there, and I pass it every Lord's day."
    "I don't know anything about Deacon Deuteronomy or his meeting," said I; "all I know is, that Queequeg here is a born member of the First Congregational Church. He is a deacon himself, Queequeg is."
    "Young man," said Bildad sternly, "thou art skylarking with me—explain thyself, thou young Hittite. What church dost thee mean? answer me."
    Finding myself thus hard pushed, I replied. "I mean, sir, the same ancient Catholic Church to which you and I, and Captain Peleg there, and Queequeg here, and all of us, and every mother's son and soul of us belong; the great and everlasting First Congregation of this whole worshipping world; we all belong to that; only some of us cherish some queer crotchets no ways touching the grand belief; in THAT we all join hands.</span></p>
    <p style="text-align:center"><span style="font-size:16px"><strong><span style="background-color:transparent; color:rgb(0, 0, 0)">www.PrimeTimeTran.com. </span></strong></span></p>
  DESC
})
e.ticket_types << TicketType.create(name: 'Standard', price: 20, max_quantity: 10000)
e.ticket_types << TicketType.create(name: 'Premium', price: 99, max_quantity: 5000)
e.ticket_types << TicketType.create(name: 'TranFam', price: 999, max_quantity: 250)
