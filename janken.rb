# プレイヤー(自分)に「0 ~ 2」を入力させるロジックを書きます。
class Player
  def hand
    puts "数字を入力してください。"
    puts "0:グー, 1:チョキ, 2:パー"
    input_hand = gets.chomp #入力を取得
    while true
      if ["0", "1", "2"].include?(input_hand) #入力が正しければ
        player_hand = input_hand.to_i
        return player_hand # 取得値を返す
      else
        puts "もう一度数字を入力してください。" #取得値が不適合なら再入力
        puts "0:グー, 1:チョキ, 2:パー"
        input_hand = gets.chomp
      end
    end #入力が正しければwhileからはずれる
  end
end
# 敵が「0 ~ 2」の値をランダムで生成するロジックを書きます。
class Enemy
  def hand
    enemy_hand = rand(0..2) # グー、チョキ、パーの値をランダムに出力
  end
end
# プレイヤー(自分)が入力した「0 ~ 2」と、敵がランダムで生成した「0 ~ 2」をじゃんけんをさせて、その結果をコンソール上に出力するロジックを書きます。
class Janken
  def pon(player_hand, enemy_hand)
    janken = ["グー", "チョキ", "パー"]
    print "相手の手は#{janken[enemy_hand]}です。"
    # Playerクラスの戻り値とEnemyクラスの戻り値からじゃんけんするロジックを作成
    while true
      if (player_hand == enemy_hand)
        puts "あいこ"
        return true
      elsif (player_hand == 0 && enemy_hand == 1) || (player_hand == 1 && enemy_hand == 2) || (player_hand == 2 && enemy_hand == 0)
        puts "あなたの勝ちです"
        return false
      else
        puts "あなたの負けです"
        return false
      end
    end
  end
end
# 変数「player」にPlayerをインスタンス化したものを代入します。
player = Player.new
# 変数「enemy」にEnemyをインスタンス化したものを代入します。
enemy = Enemy.new
# 変数「janken」にJankenをインスタンス化したものを代入します。
janken = Janken.new

# ※「next_game」が「false」にならない限り、永久にwhileで繰り返し処理を実行
next_game = true
while next_game
  # 変数「next_game」にじゃんけんを実行して返ってきた値(戻り値)を代入します。
  # 「janken.pon(player.hand, enemy.hand)」でじゃんけんを実行しています。
  next_game = janken.pon(player.hand, enemy.hand)
  # じゃんけんの実行結果に「false」が返ってくると、このwhileを終了
end
