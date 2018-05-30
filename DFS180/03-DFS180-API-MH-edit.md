---
title: DFS180 - M7 - Public Message Interface
version: 1.1.5
---
![](./02-media/media/image1.jpg)

  DFS180 - M7 - Public Message Interface
  ----------------------------------------
  M7 Release 6.0.10

  Version       1.1.5
  ---------- -- ---------------------------------------------------------------------------

  Status        Final

  Filename      DFS180 - M7 6.0.10 - Public Message Interface (Schema 6.0) - v 1.1.5.docx

  Date          16/03/2018

  Author        M7 Project Team

  Reviewer      M7 Project Manager

# Public Requests and Responses

The requests and responses described in this chapter are used for users without administrative privileges to communicate with the backend.

## General Requests and Responses

The general requests and responses described in this chapter are used for login and logout to the backend system as well as for responding to management requests.

### System Info Response (SystemInfoResp)

  SystemInfoResp            
  ------------------------- --------------------------------------------------------
  Type:                     Inquiry Response
  Response to:              SystemInfoReq (sent to private response queue see 3.1)
  Broadcast:                No
  Broadcast Routing Keys:   \-\--
  Roles:                    \<All\>

The System Info Response returns general information about the backend system as reply to a System Info Request.

+--------------------------+------------------+-----+------+-------------+-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+----------------------------------------------------------+
| XML Tag                  | Type             | m/o | No.  | Data Type   | Short description                                                                                                                                                                             |
+==========================+==================+=====+======+=============+===============================================================================================================================================================================================+==========================================================+
| **SystemInfoResp**       | SE               |     |      | Structure   |                                                                                                                                                                                               |                                                          |
+--------------------------+------------------+-----+------+-------------+-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+----------------------------------------------------------+
| backendVersion           | A                | m   |      | String(255) | The version number of the backend system.                                                                                                                                                     |                                                          |
+--------------------------+------------------+-----+------+-------------+-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+----------------------------------------------------------+
| backendTimeZone          | A                | m   |      | String(255) | The time zone identifier of the time zone the backend system runs in.                                                                                                                         |                                                          |
+--------------------------+------------------+-----+------+-------------+-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+----------------------------------------------------------+
| backendMarketTimeZone    | A                | m   |      | String(255) | The time zone identifier of the time zone the market is operated in. This time zone is used on backend side to generate time zone related information like contract short names.              |                                                          |
+--------------------------+------------------+-----+------+-------------+-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+----------------------------------------------------------+
| contractStoreTimeInDays  | A                | m   |      | Integer     | Number of days that contracts are made available in the system (today included)                                                                                                               |                                                          |
+--------------------------+------------------+-----+------+-------------+-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+----------------------------------------------------------+
| appVersionActual         | A                | o   |      | String(32)  | Contains actual version for application identified by app-id message property in requesting message (SysInfoReq). This may be used on client side to check if up-to-date application is used. |                                                          |
+--------------------------+------------------+-----+------+-------------+-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+----------------------------------------------------------+
| maxOrders                | A                | m   |      | Integer     | maximum number of orders that are allowed to be send within one order entry/modify message                                                                                                    |                                                          |
+--------------------------+------------------+-----+------+-------------+-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+----------------------------------------------------------+
| maxQuotes                | A                | m   |      | Integer     | maximum number of quotes that are allowed to be send within one order entry/modify message (order types Q and W)                                                                              |                                                          |
+--------------------------+------------------+-----+------+-------------+-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+----------------------------------------------------------+
| capabilities             | A                | o   | 0..n | String(255) | List of backend features available. If the feature is not in the list, it is disabled on backend side.                                                                                        |                                                          |
|                          |                  |     |      |             |                                                                                                                                                                                               |                                                          |
|                          |                  |     |      |             | Possible values:                                                                                                                                                                              |                                                          |
|                          |                  |     |      |             |                                                                                                                                                                                               |                                                          |
|                          |                  |     |      |             | **"SETTLEMENT"**: Update Settlement Information message is supported by the system (see [7.2.3](#_Toc317612050)) and trade settlement status functionality is available.                      |                                                          |
|                          |                  |     |      |             |                                                                                                                                                                                               |                                                          |
|                          |                  |     |      |             | **"LINKED-ORDERS"**: See 6.2.1 Order Entry (OrdrEntry) for the description.                                                                                                                   |                                                          |
|                          |                  |     |      |             |                                                                                                                                                                                               |                                                          |
|                          |                  |     |      |             | **"QUOTE-ORDERS"**: Mass Quote requests are supported by the system.                                                                                                                          |                                                          |
|                          |                  |     |      |             |                                                                                                                                                                                               |                                                          |
|                          |                  |     |      |             | **"QUOTE-REQUESTS"**: Order Quote request are supported by the system (see 6.4.31).                                                                                                           |                                                          |
|                          |                  |     |      |             |                                                                                                                                                                                               |                                                          |
|                          |                  |     |      |             | **"OPEN-CLOSE-INDICATOR"**: Open-close indicator is supported in the Order entry and following messages (see 6.2.1).                                                                          |                                                          |
|                          |                  |     |      |             |                                                                                                                                                                                               |                                                          |
|                          |                  |     |      |             | **"TRADING-LIMIT"**: Cash limit requests are supported by the system (see 6.4.5).                                                                                                             |                                                          |
+--------------------------+------------------+-----+------+-------------+-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+----------------------------------------------------------+
| allowedClearingAcctTypes | A                | o   |      | String(255) | Comma separated valid values for "clearingAcctType" attribute in e.g. OrdrEntry message.                                                                                                      |                                                          |
|                          |                  |     |      |             |                                                                                                                                                                                               |                                                          |
|                          |                  |     |      |             | Example (spot markets): "**A,P**"                                                                                                                                                             |                                                          |
+--------------------------+------------------+-----+------+-------------+-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+----------------------------------------------------------+
| ***StandardHeader***     | *SE*             | *m* |      | *Structure* | *Standard header of each message. Please see* *5.1.3.*                                                                                                                                        |                                                          |
+--------------------------+------------------+-----+------+-------------+-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+----------------------------------------------------------+
| **RequestLimitList**     | SE               | m   | 1    | SE          | List of request limits                                                                                                                                                                        |                                                          |
+--------------------------+------------------+-----+------+-------------+-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+----------------------------------------------------------+
|                          | **RequestLimit** | SE  | m    | 0..N        | SE                                                                                                                                                                                            | Request limit                                            |
+--------------------------+------------------+-----+------+-------------+-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+----------------------------------------------------------+
|                          | message          | A   | m    |             | String(255)                                                                                                                                                                                   | Message name (eg. AllUsersReq)                           |
+--------------------------+------------------+-----+------+-------------+-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+----------------------------------------------------------+
|                          | duration         | A   | o    |             | Integer                                                                                                                                                                                       | Limit duration in seconds (eg. 60 for short term limits) |
+--------------------------+------------------+-----+------+-------------+-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+----------------------------------------------------------+
|                          | rate             | A   | o    |             | Integer                                                                                                                                                                                       | The value of the limit (eg. 1)                           |
+--------------------------+------------------+-----+------+-------------+-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+----------------------------------------------------------+

Table 7: Message layout of a System Info Response.