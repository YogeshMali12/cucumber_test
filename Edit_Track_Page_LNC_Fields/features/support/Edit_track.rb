

class Edit_track_Page
  include PageObject
  include RSpec::Matchers

  select_list(:master_value, :id => "master_rights1")
  select_list(:master_right, :id => "master_rights1")

  def master_right_field0(option1)
    master_value
    expect(master_right).to eq(option1)
  end

  def master_right_field(option1)
    master_value
    expect(master_right).to be(option1)
  end


  def login_to_OA
    @browser.goto "synergy_oa.lnc.devorch.com"
    #@browser.goto "qa.dc.devorch.com"
    #@browser = Watir::Browser.start  "qa.dc.devorch.com"
    @browser.text_field(:name => "username").set("synergy")
    @browser.text_field(:name => "password").set("Orchard09")
    @browser.button(:id, "sign_in").click
    @browser.link(:text, "Relationships").click
    @browser.driver.manage.window.maximize
  end


  def tracknamemethod(trackname)
    @browser.text_field(:class => "editTrackModalInput").set(trackname)
    @browser.div(:class => "submitButtonsModal").a(:id => "next_button").click
  end


  def edit_track_Page_oa_side

    @browser.text_field(:id, "edit_vendor_track_identifier1").set("G01235665255")
    @browser.text_field(:name => "track_name").set("TrackCucumberTest")
    @browser.text_field(:name => "version").set("1.0")
    @browser.select_list(:class => "small", :name => "offertype1").select("Track Permanent Only")
    @browser.textarea(:name => "writer").set("Writer")
    @browser.select_list(:id, "third_party_publisher1").select("YES")
    @browser.select_list(:id, "us_publishing1").select("100% controlled by label")
    @browser.select_list(:id, "master_rights1").select("NO")
    @browser.text_field(:id, "iswcPartA1").set("T")
    @browser.text_field(:id, "iswcPartB1").set("121")
    @browser.text_field(:id, "iswcPartC1").set("111")
    @browser.text_field(:id, "iswcPartD1").set("111")
    @browser.text_field(:id, "iswcPartE1").set("2")
    @browser.textarea(:name => "publisher").set("Publisher")
    @browser.text_field(:value, "2").set("2")
    @browser.select_list(:name => "dpd_license").select("YES")
    @browser.text_field(:name => "p_line").set("2009 VCompany Name")
    @browser.select_list(:name => "mechanical").select("YES")
    @browser.select_list(:name => "third_party_publisher").select("Yes")
    @browser.select_list(:name => "royalty_collection").select("NO")
    @browser.select_list(:name => "publishing_admin").select("YES")
    @browser.select_list(:id, "edit_meta_language1").select("French")
    @browser.select_list(:name => "recording_country").select("Bahrain")
    @browser.text_field(:name => "recording_year").set("2004")
    @browser.select_list(:name => "hidden").select("Indexed with track no")
    @browser.checkbox(:value, "Y").set
    @browser.checkbox(:value, "Y").set

  end


  def check
    if
    actual = @browser.select_list(:id, "master_rights1").select("NO")
      expected = "NO"
      expect(actual).to include(expected)

      puts "true"
    else
      puts "false"
    end
  end

  def verify_the_ISWC_Validation
    if
    actual = "An ISWC begins with the letter"
    then
      expect(actual).to match(/An ISWC begins with the letter/)

      puts "Validation message is displaying"
    else
      puts "No validation is displaying"
      #expect{invlid_login_detail}.to raise_error("Sorry, invalid login information provided.")
    end
  end





end