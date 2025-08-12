import 'package:ecommerce_app_login/constants/resources.dart';
import 'package:ecommerce_app_login/ui/empty/widget/empty_body.dart';
import 'package:flutter/material.dart';

class EmptyScreen {
  EmptyScreen._();

  static Widget networkRequest() => EmptyScreenBodyWidget(
    imageUrl: Assets.emptyNetworkRequest,
    title: S.noNetworkRequest,
    description: S.noNetworkRequestDesp,
    isShowButton: true,
    buttonIconPath: Assets.peopleRoof,
    buttonText: S.viewConnections,
    onTap: () {},
  );

  static Widget contacts() => EmptyScreenBodyWidget(
    imageUrl: Assets.emptyContact,
    title: S.noContactsYet,
    description: S.noContactsYetDesp,
    isShowButton: true,
    buttonIconPath: Assets.createContact,
    buttonText: S.createContacts,
    onTap: () {},
  );

  static Widget events() => EmptyScreenBodyWidget(
    imageUrl: Assets.emptyEvent,
    title: S.nothingOnYourCalendar,
    description: S.planYourFirstEvent,
    isShowButton: true,
    buttonIconPath: Assets.calendarPlus1,
    buttonText: S.createEvents,
    onTap: () {},
  );

  static Widget categories() => EmptyScreenBodyWidget(
    imageUrl: Assets.emptyCategories,
    title: S.noCategories,
    description: S.noCategoriesDesp,
    isShowButton: true,
    buttonIconPath: Assets.addCategory,
    buttonText: S.addCategory,
    onTap: () {},
  );

  static Widget appointments() => EmptyScreenBodyWidget(
    imageUrl: Assets.emptyAppointments,
    title: S.allSet,
    description: S.allSetDesp,
    isShowButton: true,
    buttonIconPath: Assets.sheduleAppointment,
    buttonText: S.scheduleAppointment,
    onTap: () {},
  );

  static Widget leads() => EmptyScreenBodyWidget(
    imageUrl: Assets.emptyMyLeads,
    title: S.noLeadsYet,
    description: S.noLeadsYetDesp,
    isShowButton: true,
    buttonIconPath: Assets.addLead,
    buttonText: S.addLeads,
    onTap: () {},
  );

  static Widget network() => EmptyScreenBodyWidget(
    imageUrl: Assets.emptyMyNetwork,
    title: S.emptyNetwork,
    description: S.emptyNetworkDesp,
    isShowButton: true,
    buttonIconPath: Assets.addNetwork,
    buttonText: S.addNetwork,
    onTap: () {},
  );

  static Widget payment() => EmptyScreenBodyWidget(
    imageUrl: Assets.emptyMyPayment,
    title: S.noPayments,
    description: S.noPaymentsDesp,
    isShowButton: true,
    buttonIconPath: Assets.membership,
    buttonText: S.joinMembership,
    onTap: () {},
  );

  static Widget resultsFound() => const EmptyScreenBodyWidget(
    imageUrl: Assets.noResultsFound,
    title: S.noResultsFound,
    description: S.noResultsFoundDesp,
    isShowButton: false,
  );

  static Widget offline() => EmptyScreenBodyWidget(
    imageUrl: Assets.offline,
    title: S.youAreOffline,
    description: S.youAreOfflineDesp,
    isShowButton: true,
    buttonText: S.retry,
    onTap: () {},
  );

  static Widget upcomingEvent() => EmptyScreenBodyWidget(
    imageUrl: Assets.emptyUpcomingEvents,
    title: S.nothingOnYourCalendar,
    description: S.planYourFirstEvent,
    isShowButton: true,
    buttonIconPath: Assets.calendarPlus1,
    buttonText: S.createEvents,
    onTap: () {},
  );

  static Widget pastEvent() => const EmptyScreenBodyWidget(
    imageUrl: Assets.emptyPastEvents,
    title: S.noPastEvents,
    description: S.pastEentEmptyMessage,
    isShowButton: false,
  );
}
