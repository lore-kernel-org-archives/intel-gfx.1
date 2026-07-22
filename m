Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF6FDC4453D
	for <intel-gfx@archiver.kernel.org>; Wed, 22 Jul 2026 10:28:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 432A010ED39;
	Wed, 22 Jul 2026 10:28:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="X6exg+AX";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 36FFA10ED39
 for <intel-gfx@lists.freedesktop.org>; Wed, 22 Jul 2026 10:28:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1784716114; x=1816252114;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=llgNOrRZEbP19KF0MnQHB/yiWKBw/pUr+lJlRh8KZBA=;
 b=X6exg+AXZtMPHv/r8kTHxF5eq/KJOPCh3ek3x1I95PhimYTxsuHJff3V
 QvaLvva9o9v7vty+ir8QuqAs6j8TjfIBKXKg0f7QmBOtgCtGSR6Qewj5M
 CxGT9SRmBqBX78sW7ZvYTtwDB4rRbdImDEQ3iavmyBCdGmkbm7RofTg1W
 q8zbY2mRC3RTLED/IKzv6N7kPiPumbXf+prtySp9G7de8b4tlgZM9hRBf
 AwxNXyzECsIMTo7ZHRPqxyq2g4YOC4BnTBbcUx22WPy6G2JWuj/iRW1MJ
 vTgpThtI8XY62e25hUyK9gtbUW5TobO5LdiQAD6xL5LTG3fc9lZMngNhd A==;
X-CSE-ConnectionGUID: +L3nJFCVRcOFwhHhkY0O6A==
X-CSE-MsgGUID: BVLQFlXhTPmtUfhW3sj2jA==
X-IronPort-AV: E=McAfee;i="6800,10657,11853"; a="96864379"
X-IronPort-AV: E=Sophos;i="6.25,178,1779174000"; d="scan'208";a="96864379"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jul 2026 03:28:33 -0700
X-CSE-ConnectionGUID: fALjKwKsRbOHtpxlN0WowQ==
X-CSE-MsgGUID: O6PdC0V6R+epjU+xucYD5A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,178,1779174000"; d="scan'208";a="281344654"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jul 2026 03:28:33 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Wed, 22 Jul 2026 03:28:32 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43 via Frontend Transport; Wed, 22 Jul 2026 03:28:32 -0700
Received: from SJ2PR03CU001.outbound.protection.outlook.com (52.101.43.34) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Wed, 22 Jul 2026 03:28:32 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DUrYJkiOKfTNN2jheZ7x474l0Dkc/q+pmCWp3f9MXTvtLLl+7n3UUzu/6i+YvAeGYO+TTHcuHo0VQfu6KA+1WnzywvAIwuCaMXPROQgN/647U+afSgfv/ekuJFvv0OyFLiiTv48eZd9qXRk8YIj8YnwW96WB6VYSnAoHteiqE3lIeXkOvCnjX/SdFI7d4eiQ6MqSHCQe7vfmq/zBvrwwr8206FJEqV4nF0BIRnXDefO5AVDWUil4wDiH52Uh92wFmcnu16pW1ZtAbCspsrZqQ99A5lliHebZT/w9WLl8muC40lJELWn/6Chwx+pJz2s2XIE64AV7f1o5a3k6VAnX/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/eySueRX5U7Tbhee4JXrXELOmog2061mBYeCg4NOrTs=;
 b=LB6ZCQ25O9uebDO85KaB6fvn4SMywg3b2rxc+jnLi/EAdEu67HFTU0HJh65eB4mahD2AnD8TstZqFRxfpIxuyf++4o8uDRgkUQMkctU3vHoQGZyl8zRH20zcxxPZ/CN6W+SVW4TFg4PvLBQ+Y7jkSBrU8teunEPBEk8yHeTvlme634PmUkdf/UK+M/414CmGw8iXK6ffqyt0cIlmejgt4n4aqutxb47TSvoSchpXyjq0Nswg3aYRDd0t/CwUFpEjeWQ1DRcN2m5KsxGWD1yJ0E+EN+TmwKQsb+Z9I3U6zUykQ7XE/5evs7sScY9r3z6vc1zvYZcbVNyl0zP1n8tYOg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW4PR11MB6909.namprd11.prod.outlook.com (2603:10b6:303:224::12)
 by MW6PR11MB8338.namprd11.prod.outlook.com (2603:10b6:303:247::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.18; Wed, 22 Jul
 2026 10:28:30 +0000
Received: from MW4PR11MB6909.namprd11.prod.outlook.com
 ([fe80::9eab:962:806:3794]) by MW4PR11MB6909.namprd11.prod.outlook.com
 ([fe80::9eab:962:806:3794%4]) with mapi id 15.21.0245.009; Wed, 22 Jul 2026
 10:28:29 +0000
From: Sebastian Brzezinka <sebastian.brzezinka@intel.com>
To: <intel-gfx@lists.freedesktop.org>
CC: Sebastian Brzezinka <sebastian.brzezinka@intel.com>,
 <andi.shyti@linux.intel.com>, <krzysztof.karas@intel.com>
Subject: [PATCH 1/6] drm/i915: Convert driver init/PCI/params license headers
 to SPDX
Date: Wed, 22 Jul 2026 12:29:18 +0200
Message-ID: <3b7af1481b89841e0cfaa17b34068441e975f437.1784713895.git.sebastian.brzezinka@intel.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1784713895.git.sebastian.brzezinka@intel.com>
References: <cover.1784713895.git.sebastian.brzezinka@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: DB9PR06CA0016.eurprd06.prod.outlook.com
 (2603:10a6:10:1db::21) To MW4PR11MB6909.namprd11.prod.outlook.com
 (2603:10b6:303:224::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB6909:EE_|MW6PR11MB8338:EE_
X-MS-Office365-Filtering-Correlation-Id: 47bd6792-6524-40fb-97c8-08dee7dbf900
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|23010399003|366016|22082099003|18002099003|3023799007|56012099006|11063799006|10067099003;
X-Microsoft-Antispam-Message-Info: gYMpJ4Q8cpbKGajCYwF/gfIGeIVIHsuylPWQLzqHzO/BMnjNWU7jMtENXZ8OxL9ozBE917P+9G0GjOQgwZwdjCz9LNCKFCSQRKnscofnS5/ULEm2rQONfUs2ctlR3M0gRqnbcQC9jTYzI8YehYrF+9xt2kMeM/G1lRxfX2eaAvVqFljxX7HWCqJJxke1h+qbLvqKRI9b8wxcQ/vWHJAQ63b7Ova4o9PIZp+LNewvCG+0ySEu5MOxFJis/vFvTUVkJIJRPN/r37jA7XMNKJh8yYJdcxUS5gx7PuUzHDzVnZTUDlPSe/3N3+1dzfEUF+FjZF28If1X8Xo+l2PyFb7HqxxmqG0nNSqgr0NrZLt2IU3HzGYAhjc/3BsVO0tFMDfWeLwtM46ibpVafkdbKq5RXZZT9J/nm3Dn9c9jnDc6iOSErW0NlyuipsYpCtmUWcAAtAuho/0toaPkfxQtuz8RrB37ril9l6sypWXYuWaofKDNWdXY1NDQX2ZcsSdU1VUADTOngvC2f4Iz9MGMF6bJM1+2/psJpvQkgTz9jbiqyCK5oku1YJV4Hqzlqkd+BDfaM+ovOp594tklvWRu0n7H8rgEoheqjTzGwru+gv24G++Tb7AXlp1nSglrHSaMF0mq6nL4tRAx0ycXfkXbCwJe90PidQbNVrR4XOFVdn4fF9o=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB6909.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(23010399003)(366016)(22082099003)(18002099003)(3023799007)(56012099006)(11063799006)(10067099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ekM3aEcxb3JvK0JoSnQ5RXRqUzV6TmR5TWRaYzlmMWxKQ1hFNkZlQ2k3UWh3?=
 =?utf-8?B?S0tzb2dWUTRwNkt0VWxXcmRhTjFHbkpCNktBUSt0blYyekNzZHRFMTV2UnFi?=
 =?utf-8?B?WEJkZ0VFQ21MZjR3QjhQaVJTRlpBWHZQeklBOENmODc4aHJzMytrVCs0eG5t?=
 =?utf-8?B?OUJTcTBvRk9kamdYU1U1MUpPbkZ6VHZFMjBHbHFUUWtLYzVKeTAyK0RVYmRD?=
 =?utf-8?B?OHorMDJNaFhwVXBvdWtXMkk4UW1Wbys1a0lwOWFpUExPSzZUYmpXazRMNnU5?=
 =?utf-8?B?T0JTRmhocnJ2aU5QK1FKcTN5ZWRwYkxaRHVBdEl4YmErOTViY3FiRFFleURE?=
 =?utf-8?B?eGJMbXB5ZnhPR0FPNFJsRmhBSXppSm1jcmVoanZ5OE9TUnpHOFVGSHJxQnNv?=
 =?utf-8?B?RzhCaTNya2NOenUxdjJLdHpWS05WUnUzcGMxWEpuaFhITEVzZERkYVhMamtT?=
 =?utf-8?B?cHRCOXRpTGE2a09xL3BtNWQ0Qm5zbXhkQjA5VTdsL2tLOXFWbEhGSUFzanFJ?=
 =?utf-8?B?aGVzNXZQL3NaeFkrdDRSaXFYQWM5dDl1am9UNnN5TUxuOHd6a2o1a3VYZ1pX?=
 =?utf-8?B?V2lIblZ2TkV0eTMwR08wQzVCVlVPdFJPaWg3K0N6dHNlUERucnlYUGYwQUJi?=
 =?utf-8?B?Q1BaN203ZVU4eUxFUXRKVWlFaU1nOUg1OUdSODBmZDhsYmRrSmNqQ2owWGpE?=
 =?utf-8?B?TkdrY0lGT05zL0hJWWpReEpkclRnMGd0R3hWY1oyakNmaSt3Qk5JdE40S09K?=
 =?utf-8?B?aDdKekJ0Snh0cmNwbDNoSFMvWVNmdVVaM2txeFFmY21mZ0tneGhWN05jVGp3?=
 =?utf-8?B?Q010bFZYRUdWeXJCOS9WT3VlbWhHb2JoenFBdms1QVZ4QXpiaXJveWI0aGVH?=
 =?utf-8?B?ZTc5akVOWmYwRmVoUjFHRHZZWHRWR2wvVGpSL0lqZW9Wa3pkcW81SzYvaytV?=
 =?utf-8?B?cjREM1Y4NGFVamJ1QlhWNFJPNytwS3hDWnRramxZOUs2WVNtZ0MvNWhFK29i?=
 =?utf-8?B?a3puK2xVdUNVaEhDR3NNUEhOSWhmQlN2eUpEdE1YMDM0bHZ0N2JnWktrM2Zv?=
 =?utf-8?B?VVB2ZDlSU1NoUk1zeXdtTWhMazVVV2JKdkZTVHAyMlNDZktHakx0cHJFMnZ5?=
 =?utf-8?B?NHNvNWJ0bWRXR2txbGROWllpcDBIQ2ZQazNBcnh3djFOVTZnVWY2UGhCNU9v?=
 =?utf-8?B?bWQrR1ZLUVg3a2NCcmNPZFR4S3lRQlpXSlVNWXlBcHlFSk96alhZeWs1RndY?=
 =?utf-8?B?OVByNEtSRld1eXltVlVpSC9wa0loRytFeENWYXhJNDkwOWcxUUJxcHl2R1pa?=
 =?utf-8?B?cENEVkdFVFdzT1p0Lyt3ZlcwY2FwVy9yZEtVTTlhZERsV2I1b0k5MTRGYlhN?=
 =?utf-8?B?dHFNQ1k4aDRFMHFCMkE2bUIvY1hzNUo3bEFIeWVWME16S3lTbDhGc2RQVnFu?=
 =?utf-8?B?UXkwNEpiYUlHaldYRzdMdVN1bktud1hRNnVzc3JDeDA5a2ZFaDZteHJ4Vkhh?=
 =?utf-8?B?NEVNSVRlV0JyL3Qrdnd6d1FGdUt0RXVDeE8zMDVGbm5HcVR5UUNoeHhuQW0x?=
 =?utf-8?B?cGs2VjRyYXU5UDI3V28yTEE0eXowMDFtTGlYRUxQL3g2WS8vcm1sbHp4MU1C?=
 =?utf-8?B?NEEzVkpManJvZ2tuN2V3Qkt2Tk9mMi9GM2VYUytVL21LczRWOHh0S2YwMEFW?=
 =?utf-8?B?MFhPM0Z6SXVTOFFrQ0U5L3gwOUxEWFp6L3VuWEdaeWFiVy9lbEswNmdnTktD?=
 =?utf-8?B?SUZsbk80VDZTZHhvNGFtbEtzS2dteFFJWnFvaXI3VDJnQ2U1ekFDYUY2bDdx?=
 =?utf-8?B?ZS9SVGVQR3p2cmdBbzRXemNnN2J5eWFvTzIvcUUvR0YzeG52WlBWOFJoS29l?=
 =?utf-8?B?U1dIMFhTTlRwYURrNHlUaU9RQXVPRU5xSWtQTU43dEF6bzNJUmhTMkNManVL?=
 =?utf-8?B?aGZmSEp0b285bTFBdFVCWFVmY1JZZ2dmamdmcE02UXZpQzVoWDdJL3Mzek1r?=
 =?utf-8?B?VTU1MVZpNkZveC9MU3pyY1RxNFFxRXBuSEtaWVRQbEZadVp1U1dPTW9nWlZ2?=
 =?utf-8?B?M1NOdkQycDNZMmVPTVozY0tOSi95R09rQ205T2ZFMHBIR2ZuMUhRN0djODZJ?=
 =?utf-8?B?Vkl0emdnUGZ2ZHpjODZXN1I1TmVRYldPMU9LRGMzOVJmSWs0VUhFQlpaVlpO?=
 =?utf-8?B?cm0zajRVTUlNdmFlRG84dmhMM1RlamMxbTBnWlE2TnJPVzdQdEdDYnRzNW8r?=
 =?utf-8?B?K0RyNnl2TC9tQXhTUEk2aFBVUXcyd3JSUnZLZWJydUJIWG1tT3M4cmZOdTVL?=
 =?utf-8?B?WkdDbkJhc200OHN3NXZpSElFMStzUXFQbkRMWmdOQi9hbTJyWnFZL0dzbnlr?=
 =?utf-8?Q?81HclvxMC5zV+KKw=3D?=
X-Exchange-RoutingPolicyChecked: TEneUWMM3ltCshp4s8uawtka5U27PDVbwfO1EsIOhMKMTy72FwJQbds+PeO4AHXHIbPGAG5rnZPcbZ0tJFHQqQadkC3CJqoEqthq4/17WLqjtnmPki/JK+jHdowuFO73wfe/+q7qHBwS69EdcaoCoQgF3EF/yI2sUK2tXff/XMYHkXKZxj3IjJPyJ531Gc5pDdQzezyFLJ7r33r1VLBioiYlz6qrH6JQA/nBIAb8jeowjv7IUzXq02ir2cJP94CIlPYTmhH5SYd1NO/+LkJNzUFbIvt3rZotTYggv8F94bg9zoJq8eR3Ad30enjcN4gXJLoP4wsv6RS7cmWsSmNIIw==
X-MS-Exchange-CrossTenant-Network-Message-Id: 47bd6792-6524-40fb-97c8-08dee7dbf900
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB6909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jul 2026 10:28:29.8489 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cJr+9NC8tgrrAHXc4oKolfLsvG8gIEh/jP1Nc5oEF2dU67EaG0HYfkVW6S/qJanLmvSKKwTw5eDFElGoj/vhrH7Ola1IUXgGm+2fSyqqJA8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW6PR11MB8338
X-OriginatorOrg: intel.com
X-BeenThere: intel-gfx@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel graphics driver community testing & development
 <intel-gfx.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/intel-gfx>,
 <mailto:intel-gfx-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/intel-gfx>
List-Post: <mailto:intel-gfx@lists.freedesktop.org>
List-Help: <mailto:intel-gfx-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-gfx>,
 <mailto:intel-gfx-request@lists.freedesktop.org?subject=subscribe>
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

Replace the verbose MIT license boilerplate in the core driver
init, PCI enumeration and module parameter files with the
corresponding SPDX-License-Identifier tag. This preserves the
existing copyright notices while removing duplicated legal text, per
Documentation/process/license-rules.rst.

No functional changes.

Signed-off-by: Sebastian Brzezinka <sebastian.brzezinka@intel.com>
---
 drivers/gpu/drm/i915/i915_driver.c | 25 ++-----------------------
 drivers/gpu/drm/i915/i915_drv.h    | 25 ++-----------------------
 drivers/gpu/drm/i915/i915_params.c | 21 +--------------------
 drivers/gpu/drm/i915/i915_params.h | 21 +--------------------
 drivers/gpu/drm/i915/i915_pci.c    | 21 +--------------------
 5 files changed, 7 insertions(+), 106 deletions(-)

diff --git a/drivers/gpu/drm/i915/i915_driver.c b/drivers/gpu/drm/i915/i915_driver.c
index ce6d20958320..3beeccbed949 100644
--- a/drivers/gpu/drm/i915/i915_driver.c
+++ b/drivers/gpu/drm/i915/i915_driver.c
@@ -1,30 +1,9 @@
-/* i915_drv.c -- i830,i845,i855,i865,i915 driver -*- linux-c -*-
- */
+// SPDX-License-Identifier: MIT
 /*
+ * i915_drv.c -- i830,i845,i855,i865,i915 driver -*- linux-c -*-
  *
  * Copyright 2003 Tungsten Graphics, Inc., Cedar Park, Texas.
  * All Rights Reserved.
- *
- * Permission is hereby granted, free of charge, to any person obtaining a
- * copy of this software and associated documentation files (the
- * "Software"), to deal in the Software without restriction, including
- * without limitation the rights to use, copy, modify, merge, publish,
- * distribute, sub license, and/or sell copies of the Software, and to
- * permit persons to whom the Software is furnished to do so, subject to
- * the following conditions:
- *
- * The above copyright notice and this permission notice (including the
- * next paragraph) shall be included in all copies or substantial portions
- * of the Software.
- *
- * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS
- * OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
- * MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NON-INFRINGEMENT.
- * IN NO EVENT SHALL TUNGSTEN GRAPHICS AND/OR ITS SUPPLIERS BE LIABLE FOR
- * ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT,
- * TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE
- * SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
- *
  */
 
 #include <linux/aperture.h>
diff --git a/drivers/gpu/drm/i915/i915_drv.h b/drivers/gpu/drm/i915/i915_drv.h
index 844ed79e7211..db48632425ed 100644
--- a/drivers/gpu/drm/i915/i915_drv.h
+++ b/drivers/gpu/drm/i915/i915_drv.h
@@ -1,30 +1,9 @@
-/* i915_drv.h -- Private header for the I915 driver -*- linux-c -*-
- */
+/* SPDX-License-Identifier: MIT */
 /*
+ * i915_drv.h -- Private header for the I915 driver -*- linux-c -*-
  *
  * Copyright 2003 Tungsten Graphics, Inc., Cedar Park, Texas.
  * All Rights Reserved.
- *
- * Permission is hereby granted, free of charge, to any person obtaining a
- * copy of this software and associated documentation files (the
- * "Software"), to deal in the Software without restriction, including
- * without limitation the rights to use, copy, modify, merge, publish,
- * distribute, sub license, and/or sell copies of the Software, and to
- * permit persons to whom the Software is furnished to do so, subject to
- * the following conditions:
- *
- * The above copyright notice and this permission notice (including the
- * next paragraph) shall be included in all copies or substantial portions
- * of the Software.
- *
- * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS
- * OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
- * MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NON-INFRINGEMENT.
- * IN NO EVENT SHALL TUNGSTEN GRAPHICS AND/OR ITS SUPPLIERS BE LIABLE FOR
- * ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT,
- * TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE
- * SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
- *
  */
 
 #ifndef _I915_DRV_H_
diff --git a/drivers/gpu/drm/i915/i915_params.c b/drivers/gpu/drm/i915/i915_params.c
index 34ed82bb1b1a..2d1867c92796 100644
--- a/drivers/gpu/drm/i915/i915_params.c
+++ b/drivers/gpu/drm/i915/i915_params.c
@@ -1,25 +1,6 @@
+// SPDX-License-Identifier: MIT
 /*
  * Copyright © 2014 Intel Corporation
- *
- * Permission is hereby granted, free of charge, to any person obtaining a
- * copy of this software and associated documentation files (the
- * "Software"), to deal in the Software without restriction, including
- * without limitation the rights to use, copy, modify, merge, publish,
- * distribute, sub license, and/or sell copies of the Software, and to
- * permit persons to whom the Software is furnished to do so, subject to
- * the following conditions:
- *
- * The above copyright notice and this permission notice (including the
- * next paragraph) shall be included in all copies or substantial portions
- * of the Software.
- *
- * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
- * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
- * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL
- * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
- * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
- * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS
- * IN THE SOFTWARE.
  */
 
 #include <linux/string_helpers.h>
diff --git a/drivers/gpu/drm/i915/i915_params.h b/drivers/gpu/drm/i915/i915_params.h
index 4d9d4cd3220d..85330624ccf1 100644
--- a/drivers/gpu/drm/i915/i915_params.h
+++ b/drivers/gpu/drm/i915/i915_params.h
@@ -1,25 +1,6 @@
+/* SPDX-License-Identifier: MIT */
 /*
  * Copyright © 2015 Intel Corporation
- *
- * Permission is hereby granted, free of charge, to any person obtaining a
- * copy of this software and associated documentation files (the "Software"),
- * to deal in the Software without restriction, including without limitation
- * the rights to use, copy, modify, merge, publish, distribute, sublicense,
- * and/or sell copies of the Software, and to permit persons to whom the
- * Software is furnished to do so, subject to the following conditions:
- *
- * The above copyright notice and this permission notice (including the next
- * paragraph) shall be included in all copies or substantial portions of the
- * Software.
- *
- * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
- * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
- * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL
- * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
- * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
- * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS
- * IN THE SOFTWARE.
- *
  */
 
 #ifndef _I915_PARAMS_H_
diff --git a/drivers/gpu/drm/i915/i915_pci.c b/drivers/gpu/drm/i915/i915_pci.c
index 82415af47d54..57577a63d749 100644
--- a/drivers/gpu/drm/i915/i915_pci.c
+++ b/drivers/gpu/drm/i915/i915_pci.c
@@ -1,25 +1,6 @@
+// SPDX-License-Identifier: MIT
 /*
  * Copyright © 2016 Intel Corporation
- *
- * Permission is hereby granted, free of charge, to any person obtaining a
- * copy of this software and associated documentation files (the "Software"),
- * to deal in the Software without restriction, including without limitation
- * the rights to use, copy, modify, merge, publish, distribute, sublicense,
- * and/or sell copies of the Software, and to permit persons to whom the
- * Software is furnished to do so, subject to the following conditions:
- *
- * The above copyright notice and this permission notice (including the next
- * paragraph) shall be included in all copies or substantial portions of the
- * Software.
- *
- * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
- * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
- * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL
- * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
- * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
- * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS
- * IN THE SOFTWARE.
- *
  */
 
 #include <drm/drm_color_mgmt.h>
-- 
2.53.0

