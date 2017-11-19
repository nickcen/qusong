module WaybillHelper
  def show_waybill_status(status)
    case status
    when 'new'
      '初始'
    when 'accepted'
      '已接单'
    when 'rejected'
      '已拒单'
    end
  end
end
