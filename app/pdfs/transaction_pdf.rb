class TransactionPDF <  Prawn::Document

   def initialize(transaction)

     super(top_margin: 50)
     @transactions = transaction

     text "MagisCoin \n\n", size: 25, style: :bold, align: :center

     text "Transactions", size: 20
     line_items

   end

   def line_items
       move_down 20
       table line_item_rows

   end

  def line_item_rows
    [["Sender", "Receiver", "Card Number", "Purchase Type", "Amount", "Time Recorded"]] + @transaction.each.map do |transaction|
      [
        transaction.send_id,
        transaction.recv_id,
        transaction.card_id,
        transaction.purchase_type,
        transaction.amount,
        transaction.time_recorded.to_s
      ]
    end
  end
end
