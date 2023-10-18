class ModelCreateContact {
  Contact? contact;

  ModelCreateContact({this.contact,});

  ModelCreateContact.fromJson(Map<String, dynamic> json) {
    contact =
    json['contact'] != null ? new Contact.fromJson(json['contact']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.contact != null) {
      data['contact'] = this.contact!.toJson();
    }
    return data;
  }
}

class Contact {
  int? id;
  String? firstName;
  String? lastName;
  String? displayName;
  Null? avatar;
  Null? jobTitle;
  Null? city;
  Null? state;
  Null? zipcode;
  Null? country;
  String? email;
  List<Emails>? emails;
  Null? timeZone;
  Null? workNumber;
  String? mobileNumber;
  Null? address;
  Null? lastSeen;
  int? leadScore;
  Null? lastContacted;
  Null? openDealsAmount;
  Null? wonDealsAmount;
  Links? links;
  Null? lastContactedSalesActivityMode;
  CustomField? customField;
  String? createdAt;
  String? updatedAt;
  Null? keyword;
  Null? medium;
  Null? lastContactedMode;
  Null? recentNote;
  Null? wonDealsCount;
  Null? lastContactedViaSalesActivity;
  Null? completedSalesSequences;
  Null? activeSalesSequences;
  Null? webFormIds;
  Null? openDealsCount;
  Null? lastAssignedAt;
  Null? facebook;
  Null? twitter;
  Null? linkedin;
  bool? isDeleted;
  Null? teamUserIds;
  Null? externalId;
  Null? workEmail;
  int? subscriptionStatus;
  String? subscriptionTypes;
  Null? unsubscriptionReason;
  Null? otherUnsubscriptionReason;
  int? customerFit;
  int? whatsappSubscriptionStatus;
  Null? lastSeenChat;
  Null? firstSeenChat;
  Null? locale;
  Null? totalSessions;
  Null? firstCampaign;
  Null? firstMedium;
  Null? firstSource;
  Null? lastCampaign;
  Null? lastMedium;
  Null? lastSource;
  Null? latestCampaign;
  Null? latestMedium;
  Null? latestSource;
  int? mcrId;

  Contact(
      {this.id,
        this.firstName,
        this.lastName,
        this.displayName,
        this.avatar,
        this.jobTitle,
        this.city,
        this.state,
        this.zipcode,
        this.country,
        this.email,
        this.emails,
        this.timeZone,
        this.workNumber,
        this.mobileNumber,
        this.address,
        this.lastSeen,
        this.leadScore,
        this.lastContacted,
        this.openDealsAmount,
        this.wonDealsAmount,
        this.links,
        this.lastContactedSalesActivityMode,
        this.customField,
        this.createdAt,
        this.updatedAt,
        this.keyword,
        this.medium,
        this.lastContactedMode,
        this.recentNote,
        this.wonDealsCount,
        this.lastContactedViaSalesActivity,
        this.completedSalesSequences,
        this.activeSalesSequences,
        this.webFormIds,
        this.openDealsCount,
        this.lastAssignedAt,
        this.facebook,
        this.twitter,
        this.linkedin,
        this.isDeleted,
        this.teamUserIds,
        this.externalId,
        this.workEmail,
        this.subscriptionStatus,
        this.subscriptionTypes,
        this.unsubscriptionReason,
        this.otherUnsubscriptionReason,
        this.customerFit,
        this.whatsappSubscriptionStatus,
        this.lastSeenChat,
        this.firstSeenChat,
        this.locale,
        this.totalSessions,
        this.firstCampaign,
        this.firstMedium,
        this.firstSource,
        this.lastCampaign,
        this.lastMedium,
        this.lastSource,
        this.latestCampaign,
        this.latestMedium,
        this.latestSource,
        this.mcrId});

  Contact.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    displayName = json['display_name'];
    avatar = json['avatar'];
    jobTitle = json['job_title'];
    city = json['city'];
    state = json['state'];
    zipcode = json['zipcode'];
    country = json['country'];
    email = json['email'];
    if (json['emails'] != null) {
      emails = <Emails>[];
      json['emails'].forEach((v) {
        emails!.add(new Emails.fromJson(v));
      });
    }
    timeZone = json['time_zone'];
    workNumber = json['work_number'];
    mobileNumber = json['mobile_number'];
    address = json['address'];
    lastSeen = json['last_seen'];
    leadScore = json['lead_score'];
    lastContacted = json['last_contacted'];
    openDealsAmount = json['open_deals_amount'];
    wonDealsAmount = json['won_deals_amount'];
    links = json['links'] != null ? new Links.fromJson(json['links']) : null;
    lastContactedSalesActivityMode = json['last_contacted_sales_activity_mode'];
    customField = json['custom_field'] != null
        ? new CustomField.fromJson(json['custom_field'])
        : null;
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    keyword = json['keyword'];
    medium = json['medium'];
    lastContactedMode = json['last_contacted_mode'];
    recentNote = json['recent_note'];
    wonDealsCount = json['won_deals_count'];
    lastContactedViaSalesActivity = json['last_contacted_via_sales_activity'];
    completedSalesSequences = json['completed_sales_sequences'];
    activeSalesSequences = json['active_sales_sequences'];
    webFormIds = json['web_form_ids'];
    openDealsCount = json['open_deals_count'];
    lastAssignedAt = json['last_assigned_at'];
    facebook = json['facebook'];
    twitter = json['twitter'];
    linkedin = json['linkedin'];
    isDeleted = json['is_deleted'];
    teamUserIds = json['team_user_ids'];
    externalId = json['external_id'];
    workEmail = json['work_email'];
    subscriptionStatus = json['subscription_status'];
    subscriptionTypes = json['subscription_types'];
    unsubscriptionReason = json['unsubscription_reason'];
    otherUnsubscriptionReason = json['other_unsubscription_reason'];
    customerFit = json['customer_fit'];
    whatsappSubscriptionStatus = json['whatsapp_subscription_status'];
    lastSeenChat = json['last_seen_chat'];
    firstSeenChat = json['first_seen_chat'];
    locale = json['locale'];
    totalSessions = json['total_sessions'];
    firstCampaign = json['first_campaign'];
    firstMedium = json['first_medium'];
    firstSource = json['first_source'];
    lastCampaign = json['last_campaign'];
    lastMedium = json['last_medium'];
    lastSource = json['last_source'];
    latestCampaign = json['latest_campaign'];
    latestMedium = json['latest_medium'];
    latestSource = json['latest_source'];
    mcrId = json['mcr_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['first_name'] = this.firstName;
    data['last_name'] = this.lastName;
    data['display_name'] = this.displayName;
    data['avatar'] = this.avatar;
    data['job_title'] = this.jobTitle;
    data['city'] = this.city;
    data['state'] = this.state;
    data['zipcode'] = this.zipcode;
    data['country'] = this.country;
    data['email'] = this.email;
    if (this.emails != null) {
      data['emails'] = this.emails!.map((v) => v.toJson()).toList();
    }
    data['time_zone'] = this.timeZone;
    data['work_number'] = this.workNumber;
    data['mobile_number'] = this.mobileNumber;
    data['address'] = this.address;
    data['last_seen'] = this.lastSeen;
    data['lead_score'] = this.leadScore;
    data['last_contacted'] = this.lastContacted;
    data['open_deals_amount'] = this.openDealsAmount;
    data['won_deals_amount'] = this.wonDealsAmount;
    if (this.links != null) {
      data['links'] = this.links!.toJson();
    }
    data['last_contacted_sales_activity_mode'] =
        this.lastContactedSalesActivityMode;
    if (this.customField != null) {
      data['custom_field'] = this.customField!.toJson();
    }
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['keyword'] = this.keyword;
    data['medium'] = this.medium;
    data['last_contacted_mode'] = this.lastContactedMode;
    data['recent_note'] = this.recentNote;
    data['won_deals_count'] = this.wonDealsCount;
    data['last_contacted_via_sales_activity'] =
        this.lastContactedViaSalesActivity;
    data['completed_sales_sequences'] = this.completedSalesSequences;
    data['active_sales_sequences'] = this.activeSalesSequences;
    data['web_form_ids'] = this.webFormIds;
    data['open_deals_count'] = this.openDealsCount;
    data['last_assigned_at'] = this.lastAssignedAt;
    data['facebook'] = this.facebook;
    data['twitter'] = this.twitter;
    data['linkedin'] = this.linkedin;
    data['is_deleted'] = this.isDeleted;
    data['team_user_ids'] = this.teamUserIds;
    data['external_id'] = this.externalId;
    data['work_email'] = this.workEmail;
    data['subscription_status'] = this.subscriptionStatus;
    data['subscription_types'] = this.subscriptionTypes;
    data['unsubscription_reason'] = this.unsubscriptionReason;
    data['other_unsubscription_reason'] = this.otherUnsubscriptionReason;
    data['customer_fit'] = this.customerFit;
    data['whatsapp_subscription_status'] = this.whatsappSubscriptionStatus;
    data['last_seen_chat'] = this.lastSeenChat;
    data['first_seen_chat'] = this.firstSeenChat;
    data['locale'] = this.locale;
    data['total_sessions'] = this.totalSessions;
    data['first_campaign'] = this.firstCampaign;
    data['first_medium'] = this.firstMedium;
    data['first_source'] = this.firstSource;
    data['last_campaign'] = this.lastCampaign;
    data['last_medium'] = this.lastMedium;
    data['last_source'] = this.lastSource;
    data['latest_campaign'] = this.latestCampaign;
    data['latest_medium'] = this.latestMedium;
    data['latest_source'] = this.latestSource;
    data['mcr_id'] = this.mcrId;
    return data;
  }
}

class Emails {
  int? id;
  String? value;
  bool? isPrimary;
  Null? label;
  bool? bDestroy;

  Emails({this.id, this.value, this.isPrimary, this.label, this.bDestroy});

  Emails.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    value = json['value'];
    isPrimary = json['is_primary'];
    label = json['label'];
    bDestroy = json['_destroy'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['value'] = this.value;
    data['is_primary'] = this.isPrimary;
    data['label'] = this.label;
    data['_destroy'] = this.bDestroy;
    return data;
  }
}

class Links {
  String? conversations;
  String? timelineFeeds;
  String? documentAssociations;
  String? notes;
  String? tasks;
  String? appointments;
  String? reminders;
  String? duplicates;
  String? connections;

  Links(
      {this.conversations,
        this.timelineFeeds,
        this.documentAssociations,
        this.notes,
        this.tasks,
        this.appointments,
        this.reminders,
        this.duplicates,
        this.connections});

  Links.fromJson(Map<String, dynamic> json) {
    conversations = json['conversations'];
    timelineFeeds = json['timeline_feeds'];
    documentAssociations = json['document_associations'];
    notes = json['notes'];
    tasks = json['tasks'];
    appointments = json['appointments'];
    reminders = json['reminders'];
    duplicates = json['duplicates'];
    connections = json['connections'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['conversations'] = this.conversations;
    data['timeline_feeds'] = this.timelineFeeds;
    data['document_associations'] = this.documentAssociations;
    data['notes'] = this.notes;
    data['tasks'] = this.tasks;
    data['appointments'] = this.appointments;
    data['reminders'] = this.reminders;
    data['duplicates'] = this.duplicates;
    data['connections'] = this.connections;
    return data;
  }
}

class CustomField {
  dynamic cfProductType;
  dynamic cfCustomerId;
  dynamic cfRegistered;

  CustomField({this.cfProductType, this.cfCustomerId, this.cfRegistered});

  CustomField.fromJson(Map<String, dynamic> json) {
    cfProductType = json['cf_product_type'];
    cfCustomerId = json['cf_customer_id'];
    cfRegistered = json['cf_registered'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['cf_product_type'] = this.cfProductType;
    data['cf_customer_id'] = this.cfCustomerId;
    data['cf_registered'] = this.cfRegistered;
    return data;
  }
}
