require 'rails_helper'

RSpec.describe User, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end

describe User do

  describe "session#create" do

    it "全ての条件を満たせば保存ができる" do
      user = build(:user)
      expect(user).to be_valid
    end

    it "nicknameがない場合は登録できない事" do
      user = build(:user, nickname: nil)
      user.valid?
    end
    it "emailがない場合は登録できない事" do
      user = build(:user,email: nil)
      user.valid?
    end
    it "passwordがない場合は登録できないこと" do
      user = build(:user, password: nil)
      user.valid?
    end
    it "passwordがぞんざいしてもpassword_confirmationがない場合は登録できない事" do
      user = build(:user, password_confirmation: nil)
      user.valid?
    end
    it "family_nameがない場合登録できない事" do
      user = build(:user, family_name: nil)
      user.valid?
    end
    it "first_nameが無い場合登録できない" do
      user = build(:user, first_name: nil)
      user.valid?
    end
    it "family_name_kanaが無い場合登録できない" do
      user = build(:user, family_name_kana: nil)
      user.valid?
    end
    it "first_name_kanaが無い場合登録できない" do
      user = build(:user, first_name_kana: nil)
      user.valid?
    end
    it "birth_dayが無い場合登録できない" do
      user = build(:user, birth_day: nil)
      user.valid?
    end



    it "ニックネームが空だと保存できない" do
      user = build(:user, nickname: "")
      user.valid?
    end
    it "苗字が空だと保存できない" do
      user = build(:user, first_name: "")
      user.valid?
    end
    it "メールアドレスが空だと保存できない" do
      user = build(:user, email: "")
      user.valid?
    end
    it "パスワードが体と保存できない" do
      user = build(:user, password: "")
      user.valid?
    end
    






    it "苗字が半角文字、英数字なら保存できない" do
      user = build(:user, first_name: "Ferumi")
      user.valid?
    end
    it "苗字が英数字なら保存できない" do
      user = build(:user, first_name: "1234")
      user.valid?
    end
    

    it "名前が空だと保存できない" do
      user = build(:user, family_name: "")
      user.valid?
    end
    it "名前が半角文字なら保存できない" do
      user = build(:user, family_name: "Ferumi")
      user.valid?
    end

    it "苗字(フリガナ)が空だと保存できない" do
      user = build(:user, first_name_kana: "")
      user.valid?
    end

    it "苗字(フリガナ)が半角文字だと保存できない" do
      user = build(:user, first_name_kana: "Yamada")
      user.valid?
    end



    it "名前(フリガナ)が漢字だと保存できない" do
      user = build(:user, family_name_kana: "太郎")
      user.valid?
    end
    it "名前(フリガナ)が半角文字だと保存できない" do
      user = build(:user, family_name_kana: "Taro")
      user.valid?
    end


    

    it "パスワードが全角だと保存できない" do
      user = build(:user, password: "１１１１１１１１")
      user.valid?
    end

  end
end