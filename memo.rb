require "csv" # CSVファイルを扱うためのライブラリを読み込んでいます

loop {

puts "1 → 新規でメモを作成する / 2 → 既存のメモを編集する"

memo_type = gets.chomp.to_i # ユーザーの入力値を取得し、数字へ変換しています

# if文を使用して続きを作成していきましょう。
# 「memo_type」の値（1 or 2）によって処理を分岐させていきましょう。

if memo_type == 1
 puts "新規でメモを作成します。拡張子を除いたファイル名を入力してください。"
 file_name = gets.chomp
 
 puts"メモの内容を記入して下さい。Ctrl+Dで保存します。"
 imput_memo = STDIN.read
 memo = imput_memo.chomp
 
 CSV.open("#{file_name}.csv","w") do |csv|
 csv.puts ["#{memo}"]
 
 puts "新規保存しました。ご確認ください。最初に戻ります。"
 end

elsif memo_type == 2
 puts "既存のメモを編集します。拡張子を除いた既存ファイル名を入力してください。"
 file_name = gets.chomp
 
 puts "メモの内容を記入して下さい。Ctrl+Dで保存します。"
 imput_memo = STDIN.read
 memo = imput_memo.chomp
 
 CSV.open("#{file_name}.csv","a") do |csv|
 csv.puts ["#{memo}"]
 
 puts "上書き保存しました。ご確認ください。最初に戻ります。"
 end
 
else
 puts "1か2の数字を入力してください。全角半角にご注意ください。最初に戻ります。"

end
}