# Helper to return hashes
module FixtureDataHelper

  def team_ids

  end

  def base_order
    { 'order' => { 'order_id' => 123_456 },
      'shipping_address' => {
        'first_name'       =>  'Freddy',
        'last_name'        =>  'Krugger',
        'phone'            =>  '212 589 1245',
        'address_1'        =>  '550 Madison Ave 15th Floor',
        'city'             =>  'New York',
        'state_province'   =>  'New York',
        'postal_code'              =>  '10022'
      },
      'order_items' => [{ 'product_id' => 1_234_560_121_214, 'quantity' => 2 }] }
  end

  def base_order_missing_all
    { 'order' => {},
      'shipping_address' => {},
      'order_items' => [{}, {}]
    }
  end

  def provident_order_missing_all
    { 'order' => {},
      'shipping_address' => {},
      'billing_address' => {},
      'order_items' => [{}, {}]
    }
  end

  def provident_order
    { 'order' => {
      'order_id'          =>  12_345_645,
      'order_external_id' =>  'ABCXYZ123',
      'customer_id'       =>   12_345_687,
      'created_at'        =>   Time.now.to_s,
      'tax_rate'          =>   1.2,
      'shipment_method'   =>   'DMI',
      'ship_complete'     =>   true,
      'free_shipping'     =>   false,
      'is_gift'           =>   true,
      'gift_message'      =>   'Happy New Year'
    },
      'shipping_address' => address,
      'billing_address' => address,
      'order_items' => [provident_order_item_hash] }
  end

  def address
    {
      'first_name'      =>  'Freddy',
      'last_name'       =>  'Krugger',
      'phone'           =>  '212 589 1245',
      'address_1'       =>  '550 Madison Ave 15th Floor',
      'city'            =>  'New York',
      'state_province'  =>  'New York',
      'postal_code'             =>  '10022',
      'country'         =>  'US',
      'email'           =>  'test@myplaydirect.com'
    }
  end

  def provident_order_item_hash
    {
      'product_id'            => 112_233_445_566,
      'quantity'              => 2,
      'status'                => 'InStock',
      'order_item_id'         => 12_345_645,
      'with_giftbox'          => true,
      'line_total_before_tax' => 1.2,
      'line_total_after_tax'  => 1.5,
      'shipping_flat_fee'     => 1.0,
      'shipping_per_item_fee' => 0.5,
      'shipping_detail'      => order_item_shipping_details
    }
  end



  def cancel_order
    { 'order_id' => 123_456,
      'order_items' => [{ 'product_id' => 112_233_445_566, 'order_item_id' => 123_221 }] }
  end



  def provident_order_xml
    fixture_file_path = '../../fixtures/provident/send_order_to_web_shipped.xml'
    file = File.read(File.expand_path(fixture_file_path, __FILE__))
    file.gsub!("\n", '')
  end
end
