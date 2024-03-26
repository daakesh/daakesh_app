abstract class ComplaintEvent{}

class AddComplaintEvent extends ComplaintEvent{
  final String complaintType;
  final String sellerName;
  final String subject;
  final String remark;
  AddComplaintEvent({
    required this.complaintType,
    required this.sellerName,
    required this.subject,
    required this.remark,
  });
}

class GetAllComplaintEvent extends ComplaintEvent{}

