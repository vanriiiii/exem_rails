class Owaater < ApplicationRecord
  validates :content, presence: true, length:{ in: 1..140 }
  #参考ページ https://client.diveintocode.jp/curriculums/557
end
