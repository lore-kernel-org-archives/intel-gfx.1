Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68933606A31C
	for <intel-gfx@archiver.kernel.org>; Thu, 12 Nov 2026 11:59:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=FW+xBjJS;
	dkim=pass (1024-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=selector1 header.b=ZLFaHJcv
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E08E5112064;
	Thu, 12 Nov 2026 11:59:38 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A334F112091
 for <intel-gfx@lists.freedesktop.org>; Thu, 12 Nov 2026 11:59:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1794484768; x=1826020768;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=MDizO5FW4NdLubb3LYERvWZPTyfvUBhogktfiGRXpUE=;
 b=FW+xBjJSPuHPSo4QfPYLip5UuGxKIwn65yrLCdTgyLRsZVY23Cgd0zSj
 vB0ojNOW4CI6ST45eZaJrEPU77MXr8EZv7jPZHUA9xzz6Wks9XEGLOTv2
 lWtpehzFarXGyhwroShaMjUEF7A5Sv86p6JoNtqZr/NjpfOOob5k4UgGS
 2EgyWYV+3WRfQ2zXLFU6A7UJOOchJ7AAAp4UUp64jo/Wz1SOVLgyDkcCo
 58JznOl8j4FcsHhtLApj/iHzVaSg9NFrKEu0R8eLWTeS/y7xIbE4M5bZB
 DZxf8FZb6Lhtv9pZt1VxBSXPgwKXfvAJNBtYhafYpYsoJyQCCEAzMB4su w==;
X-CSE-ConnectionGUID: 7qc4JPlSTY2AaJXqx7NkXw==
X-CSE-MsgGUID: SU40ALkaQMmqIq7FfoixTQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11963"; a="3178056"
X-IronPort-AV: E=Sophos;i="6.27,209,1787036400"; 
   d="scan'208";a="3178056"
Received: from fmviesa013.fm.intel.com ([10.60.135.153])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Nov 2026 03:59:24 -0800
X-CSE-ConnectionGUID: wjGv2eJYTc6qERwTrZcAFg==
X-CSE-MsgGUID: CHBeNQisTNSgML40IkPKng==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,209,1787036400"; d="scan'208";a="10538102"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa013.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Nov 2026 03:59:24 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Thu, 12 Nov 2026 03:59:23 -0800
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56 via Frontend Transport; Thu, 12 Nov 2026 03:59:23 -0800
Received: from SN4PR2101CU001.outbound.protection.outlook.com (40.93.195.70)
 by edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Thu, 12 Nov 2026 03:59:23 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=v/GwMSP2LlyQ/GHKWU2GCVw1knw4AGpwhpJv70CR9yFtmpNcOd6AAD/wbeEnwclf4jSc7r0kDqdBJ+p5jrw5hAoVq/DiS11em9hbpnwdXKxXVllM1ITn4fQMCDs2WEcc2IwxxxUIpXVMYznexvCSA86PjqmZYeiuipX9m7U35E2aNA3UNZyYnePAHASuBIajNKcxrjgJHwYrh33ulS+cTBGRN6XkODMgapDQQqMa/nfDUWejU2aXU+lAq6WDwMdHo1uaYGqlciJ6xI+3puYzuRj17hlN7BnOKX/tofXxJYBK99hzxqQMiOlZVIksU45d3ZnBFwfdlwQd5wDCVVhnCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MdB3NLOI48QC/Y3g3XyC1bozU8ZQ3MXqAkgmHxIunOs=;
 b=CaSU3PfGynVNc1OKN6EWHNYoLTlp9N3235AQJSa5mEl1QiMCCsWmcilF9fmaLP5I5lIa9HmRLunzzsiWWweUD5vRNgYElAfM866FWYNdxKl4Cdo9yQFYmEQiIUgrugdjnmB/qUZnC4UCiN8Q7fGYQ0WisTDES6WgyenHRtJwct5+zoJoYJSEhPft2yHuhG8HlDvIw3qfiZ+sQd9yUONx39Pd1a4RJj+fL8Dkz+wFL+FBU5iENunyaUh3TIQQtKkBnQIPAWM9CXEmsI4G6iTXw8pK1Dg2q03M3N0TYR3FHgFrhjfr06++36JX/GA4dbPq053pZUfdjzZKBQ0TWbGfOQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MdB3NLOI48QC/Y3g3XyC1bozU8ZQ3MXqAkgmHxIunOs=;
 b=ZLFaHJcviG0wziB41A678yM6l9DvBVZsUNHVK+XeO5PYTKWelCEYCgr4kMSWykVybqXIMZ27L6fC3nSHmbzre9xO166g4P+U3oOTe7w4Ehy0mTSv2dmb7d+dq83OxpfSYFUXFYCPmsStzez65gZURAc5KHtc8cIPz6Izq6TkPMg=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS4PR11MB134916.namprd11.prod.outlook.com (2603:10b6:8:4f0::21)
 by DM6PR11MB4692.namprd11.prod.outlook.com (2603:10b6:5:2aa::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.8; Thu, 12 Nov
 2026 11:59:21 +0000
Received: from DS4PR11MB134916.namprd11.prod.outlook.com
 ([fe80::87f6:b354:5770:3ad4]) by DS4PR11MB134916.namprd11.prod.outlook.com
 ([fe80::87f6:b354:5770:3ad4%5]) with mapi id 15.21.0615.008; Thu, 12 Nov 2026
 11:59:21 +0000
From: Sebastian Brzezinka <sebastian.brzezinka@intel.com>
To: <intel-gfx@lists.freedesktop.org>
CC: <andi.shyti@linux.intel.com>, <chris.p.wilson@intel.com>,
 <krzysztof.karas@intel.com>, <krzysztof.niemiec@intel.com>, "Sebastian
 Brzezinka" <sebastian.brzezinka@intel.com>
Subject: [PATCH v5 1/2] drm/i915/selftests: Fix unlocked mm.stolen in reset
 selftest
Date: Thu, 12 Nov 2026 12:59:06 +0100
Message-ID: <20261112115907.16263-2-sebastian.brzezinka@intel.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261112115907.16263-1-sebastian.brzezinka@intel.com>
References: <20261112115907.16263-1-sebastian.brzezinka@intel.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: WA2P291CA0033.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1f::13) To DS4PR11MB134916.namprd11.prod.outlook.com
 (2603:10b6:8:4f0::21)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS4PR11MB134916:EE_|DM6PR11MB4692:EE_
X-MS-Office365-Filtering-Correlation-Id: 24c398d7-388d-4086-7c90-08df40b46304
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|23010399003|1800799024|376014|56012099006|5023799004|11063799006|18002099003|22082099003|6133799003|261009223027099003|261102123227099003|261028144727099003|261022115727099003|261026140227099003|261021121427099003|261026135527099003|261026130827099003|261022075727099003|10067099003|261026121527099003|261021133027099003|261021123027099003|261022105027099003|261021130227099003|261022113327099003|261021135927099003;
X-Microsoft-Antispam-Message-Info: n9g+22NXSijnWdp5olkbdEyc+qi+HaOk5CXL/dP2BpK7Hh/fv5QyTGLLlUCACU73Ib9mQvnLjLm+PMTaRM+MCSQL8NzgFT+L2j4FynoAYTq9CCE1ImAFS0R5aj/4GOc+dvcSgWp/CT9dGWQM/8+35sl0KhvBZosuCvVI3LMTPeR9+4QAbShHzU9YdrCl9dbKtOBqkdaUppeeFPBOAwqrU001dl/63eiv5q1ObiVbSqTgMnn8nSnn6RgfTBqEyo/MeaYxgHhgG4I9WuD+c0E33CpqAEbgOnFqRYkvc9NNXw0zpA5MQCUVqJvPViKN958KxvDcRGY4PlyFJGk7ZJvR1ieBuQaioF/GT0k01E+AZVKeYK95iQeZxJsELBaAARgUl+5k3WQcCCGEUsIJw+/VJnLZWOfLf08h7eGFArsDCPOQUj2jw0/vOKN3RhzG6XAI9Cc4in5QJtTRh4/WZFCVLBRUEF5yewDeQ1O37VQ2ADKXIKOy9n42BYKNVJrClGmtaC+BW6lr8f+4jw6UYUuO/+ij1lBy4iUTJqqqDuqdv7uuBhjt4tz8wGEvtqEO+MfLSY3hTWl7A8VUI1mLgbC6DfNyTJXD1Nd0zdAh6nfv9A6l7gBunE0zKSQ/QMikQNR5
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS4PR11MB134916.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(23010399003)(1800799024)(376014)(56012099006)(5023799004)(11063799006)(18002099003)(22082099003)(6133799003)(261009223027099003)(261102123227099003)(261028144727099003)(261022115727099003)(261026140227099003)(261021121427099003)(261026135527099003)(261026130827099003)(261022075727099003)(10067099003)(261026121527099003)(261021133027099003)(261021123027099003)(261022105027099003)(261021130227099003)(261022113327099003)(261021135927099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ZGclD0LZ2pAYceUrrH2nhg2Ee45KkG/rZK4AJMdhLpbuLTEvjT3oMWfWwYEW?=
 =?us-ascii?Q?S2JlfAz4sOYoIXaPbUchmLViVh8hBl7M81kdkXUW2DOVMRsHtVl1WTlCeY4R?=
 =?us-ascii?Q?elJEh1yIesdaGpDYvN2J8zxKkDx6dCcOi9lnlf2MEsC1bOsW+P/19LmPaoqT?=
 =?us-ascii?Q?IYJWzPOtN9m6nMrxXqwCsJafbDC2IGpsCDdoDVaRS76O3JFyicERfv4MoIrR?=
 =?us-ascii?Q?LUAT+2uKDaIVtTA+GnwHwqINZ1hKLw1betHRoCE4uarQhS7dZFLAkw3Og4X5?=
 =?us-ascii?Q?oIfiYcj9GkErh9uDm43XIXEVzCP7MB2Q2UAcqd2RXVAtftjp41fU4k1z0lW4?=
 =?us-ascii?Q?XLOIbHUAXBsmoSvnXk2EL6E0+dQsi6BYdbi6zQpj20z26NhyT1fBOWCXU1uk?=
 =?us-ascii?Q?Fo22qK6UFcdlf8ye5npLfDmOS82dL2KXrBAgSJWnLGIpW3EcpBlGgwcwVOtg?=
 =?us-ascii?Q?hb2rnxmk5dkG0leZbk7NiTyJVmhY2DTgTxani1jfShdWCHLBNbLxpoKCVIl4?=
 =?us-ascii?Q?Iz1avcL+oaXd+niyWq4/RNdPDsZw8DZTAdgmnX/QCxkbGpuUyjPe3zQG8JxG?=
 =?us-ascii?Q?1RuxfzgAgDSn7Zfk6Ui6XIVoGEibK5peB/eJ1gSv6YYtqG1CqM7O2RHbTt5a?=
 =?us-ascii?Q?d6uJ3LAnrGmLw+hToHW+CxemERze4nCFjbuzG0/A2Hq0nqAiNa8Z+Wuph3sA?=
 =?us-ascii?Q?+IAaIWZxz7Emnn2qYUUvsmJVm4+PAm/cUxFkCkmidSGQ9Qcxo8bDTPl+YSYf?=
 =?us-ascii?Q?guxQ4DLLwzmYQJFxa8J55bdXC0rEwPzxskRL9kKcE6Um1XaID2xVj1zbQMeX?=
 =?us-ascii?Q?9AGOc3k82fP72IYyyuDT5yMLWkxjYngujNybh+Y6v0kD21EkYFQq9rYxHJEE?=
 =?us-ascii?Q?EBBkBYPMGmmWnQFX4pogR7s8iliNJkmt20+S2dFQ17WzeVboMPKq9DMuCMbt?=
 =?us-ascii?Q?IS9OumCppfht81+KFozpCqsnuZ9S2zDfHnE5jDIyj0wy0NhUEI8j1RVQyyAj?=
 =?us-ascii?Q?ZfQnwH9lINdAjPDC8j0Df43XQwSi9LevHaERFFUi3ywsdbKd2GxggMa3kEq4?=
 =?us-ascii?Q?zCd9fjAdF0jAo4tRGWOabWM1FR7tdv+JtU9gupL2R4a3JPp7rCz07kMFjEM4?=
 =?us-ascii?Q?1XZX0tImaDHZlawybZty4xFDnn4Q6IEiGBP+VPDaAPdlcLY7aGtXPRBo29an?=
 =?us-ascii?Q?FygV2H0yz3WXG4jpuzwXIRCo/ObuO8nqdNl88Sob3a0l+r2Gqet2Bu9fYluR?=
 =?us-ascii?Q?MrXNzC57UpJEautXXy0a7ZpIThbq6nqgjrxqPYF1hKiU3gsObO8MfMj+QLgU?=
 =?us-ascii?Q?pepbymuNFJgHzQu5XIh5++E/2M8xb1l2mULLyyn1cBKMkYnjdSCskG1NO8BL?=
 =?us-ascii?Q?w+ZlTw3XNCaDTh4xduIRTTcpeVjBSVZbWspWCI0sx0o4U/z08Q/u1oWgI0ww?=
 =?us-ascii?Q?+L5uecLESjMn/4cRhyjF5JQ/VneVuKgw4v5+EtMtnCEOIDqI5tBtZKaSCSUx?=
 =?us-ascii?Q?XNMbfa48i3V9dCT7KxGKIF02vlNCGjrOiMHFOwV1NXY3n3oTzfJoye1c68KV?=
 =?us-ascii?Q?kX0N0xsimMXkqqJe1VocDVeRQsMlnQ7TtjyeUS66sYe2ZIB+UDN5ffxzaYkc?=
 =?us-ascii?Q?r/OJ/qYZ9yc6l8JyMPe8Hzm0R2isZbOZ33oUcGkiE+Hbwltv6oCIoSNOk22t?=
 =?us-ascii?Q?VWUr2GdOMQbwW1P8Bymz4S2oQy76SA+FdxOKq1JvSx9QVeFTy3sesoU813ZC?=
 =?us-ascii?Q?Xni1N5jcjefUObblxAfOKyKrcBySiCY=3D?=
X-Exchange-RoutingPolicyChecked: i8GkWi40ShTSozHs1/A2bx4mWUkvE0DhIXKj1bhaHwNPg1vdjM0707RKoe7gWuP5oBJy0h3WyAC+D/rvelHy3qB7wFoOPdcJODwhGfo5NXSrLP63355w9CCJF7j59YQ6uLO/lnQjODwbABtz5Rz9K5U3sq282xroRJLZc+eGOIaKcJ09tmTH2kwMSkMDu43CLz6OLAl+jUsFmNDXmYwMRypI1Wcf0ApMK/yrH7XGXRFQpNAK+ZBRdhSd78pVUwhp8Cen8V5OHrBcv2ezCDNL8lsFZB3l2/XUrWlO7Jp6Cqqpbbrtqv98tb592r/1KRK1032DbTiQSERc3+hFd3Pp4A==
X-MS-Exchange-CrossTenant-Network-Message-Id: 24c398d7-388d-4086-7c90-08df40b46304
X-MS-Exchange-CrossTenant-AuthSource: DS4PR11MB134916.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Nov 2026 11:59:21.0333 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: y3q+EPdvZwFU52FIuaHbk7EQvBo0GApMhyxySFwkVGEvUJ0XhMS88Xx75TCUoKQWfbLPlOTOpZSjZGCyIfHmXK1rxuCEU0Ek1hS9RXRSn9s=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4692
X-OriginatorOrg: intel.com
X-BeenThere: intel-gfx@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel graphics driver community testing & development
 <intel-gfx.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-gfx>
List-Post: <mailto:intel-gfx@lists.freedesktop.org>
List-Help: <mailto:intel-gfx-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-gfx>,
 <mailto:intel-gfx-request@lists.freedesktop.org?subject=subscribe>
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

_igt_reset_stolen() use via __drm_mm_interval_first(), but
does so without holding i915->mm.stolen_lock. Every writer of this
(i915_gem_stolen.c: drm_mm_insert_node_in_range(), drm_mm_reserve_node(),
drm_mm_remove_node()) takes stolen_lock, so the selftest's unlocked
reader can race.

This was observed as a NULL pointer dereference in
__drm_mm_interval_first() during igt_reset_device_stolen():

BUG: kernel NULL pointer dereference, address: 0000000000000010
...
RIP: 0010:__drm_mm_interval_first+0x2c/0x90
...
Call Trace:
  __igt_reset_stolen+0x565/0x6a0 [i915]
  igt_reset_device_stolen+0x1a/0x30 [i915]
  __i915_subtests+0xb8/0x250 [i915]
...

Also cap num_pages to i915->dsm.usable_size, which already excludes the
hardware reserved region from drm_mm.stolen's range, so poison/verify
writes never touch reserved stolen pages.

Hold stolen_lock across the reset too, so nothing can use stolen memory
between the poison pass and the verify pass.

Fixing the always false "page unused" check exposed false positives on
non-LLC platforms, where ring buffers are allocated from stolen. The
spinner rings are in use during the poison pass, but are filled with
POISON_FREE and released while the reset retires the requests. In the
verify pass they look unused but have a changed CRC. Track which pages
were actually poisoned and only verify those.

Fixes: 3da3c5c1c982 ("drm/i915: Exclude low pages (128KiB) of stolen from use")
Closes: https://gitlab.freedesktop.org/drm/i915/kernel/-/work_items/16841
Signed-off-by: Sebastian Brzezinka <sebastian.brzezinka@intel.com>
---
v1 -> v2:
- Fix always false !__drm_mm_interval_first() check (Andi)
- Extend stolen_lock over the poison/verify writes, not just
  the lookup (Andi)
- Move the lookup into stolen_page_unused() helper

v2 -> v3:
- Cap num_pages to i915->dsm.usable_size to avoid poisoning
  hardware reserved stolen pages (Shashiko)

v3 -> v4:
- Only verify pages poisoned before the reset; pages in use (e.g.
  rings) may be rewritten and freed during reset (CI)
---
 drivers/gpu/drm/i915/gt/selftest_reset.c | 45 +++++++++++++++++++-----
 1 file changed, 36 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/selftest_reset.c b/drivers/gpu/drm/i915/gt/selftest_reset.c
index 2cfc23c58e90..aae9b55ee023 100644
--- a/drivers/gpu/drm/i915/gt/selftest_reset.c
+++ b/drivers/gpu/drm/i915/gt/selftest_reset.c
@@ -14,6 +14,16 @@
 #include "selftests/igt_atomic.h"
 #include "selftests/igt_spinner.h"
 
+static bool stolen_page_unused(struct intel_gt *gt, resource_size_t page)
+{
+	lockdep_assert_held(&gt->i915->mm.stolen_lock);
+
+	return __drm_mm_interval_first(&gt->i915->mm.stolen,
+					page << PAGE_SHIFT,
+					((page + 1) << PAGE_SHIFT) - 1) ==
+	       &gt->i915->mm.stolen.head_node;
+}
+
 static int
 __igt_reset_stolen(struct intel_gt *gt,
 		   intel_engine_mask_t mask,
@@ -26,6 +36,7 @@ __igt_reset_stolen(struct intel_gt *gt,
 	intel_wakeref_t wakeref;
 	enum intel_engine_id id;
 	struct igt_spinner spin;
+	unsigned long *poisoned;
 	long max, count;
 	void *tmp;
 	u32 *crc;
@@ -34,7 +45,8 @@ __igt_reset_stolen(struct intel_gt *gt,
 	if (!drm_mm_node_allocated(&ggtt->error_capture))
 		return 0;
 
-	num_pages = resource_size(dsm) >> PAGE_SHIFT;
+	num_pages = min_t(resource_size_t, resource_size(dsm),
+			  gt->i915->dsm.usable_size) >> PAGE_SHIFT;
 	if (!num_pages)
 		return 0;
 
@@ -42,10 +54,16 @@ __igt_reset_stolen(struct intel_gt *gt,
 	if (!crc)
 		return -ENOMEM;
 
+	poisoned = bitmap_zalloc(num_pages, GFP_KERNEL);
+	if (!poisoned) {
+		err = -ENOMEM;
+		goto err_crc;
+	}
+
 	tmp = kmalloc(PAGE_SIZE, GFP_KERNEL);
 	if (!tmp) {
 		err = -ENOMEM;
-		goto err_crc;
+		goto err_poisoned;
 	}
 
 	igt_global_reset_lock(gt);
@@ -79,6 +97,8 @@ __igt_reset_stolen(struct intel_gt *gt,
 		i915_request_add(rq);
 	}
 
+	mutex_lock(&gt->i915->mm.stolen_lock);
+
 	for (page = 0; page < num_pages; page++) {
 		dma_addr_t dma = (dma_addr_t)dsm->start + (page << PAGE_SHIFT);
 		void __iomem *s;
@@ -95,10 +115,10 @@ __igt_reset_stolen(struct intel_gt *gt,
 				      ggtt->error_capture.start,
 				      PAGE_SIZE);
 
-		if (!__drm_mm_interval_first(&gt->i915->mm.stolen,
-					     page << PAGE_SHIFT,
-					     ((page + 1) << PAGE_SHIFT) - 1))
+		if (stolen_page_unused(gt, page)) {
 			memset_io(s, STACK_MAGIC, PAGE_SIZE);
+			__set_bit(page, poisoned);
+		}
 
 		in = (void __force *)s;
 		if (i915_memcpy_from_wc(tmp, in, PAGE_SIZE))
@@ -143,10 +163,13 @@ __igt_reset_stolen(struct intel_gt *gt,
 			in = tmp;
 		x = crc32_le(0, in, PAGE_SIZE);
 
-		if (x != crc[page] &&
-		    !__drm_mm_interval_first(&gt->i915->mm.stolen,
-					     page << PAGE_SHIFT,
-					     ((page + 1) << PAGE_SHIFT) - 1)) {
+		/*
+		 * Only check pages we poisoned: pages in use before the
+		 * reset (e.g. ring buffers) may legitimately be rewritten
+		 * and released during the reset.
+		 */
+		if (x != crc[page] && test_bit(page, poisoned) &&
+		    stolen_page_unused(gt, page)) {
 			pr_debug("unused stolen page %pa modified by GPU reset\n",
 				 &page);
 			if (count++ == 0)
@@ -159,6 +182,8 @@ __igt_reset_stolen(struct intel_gt *gt,
 	mb();
 	ggtt->vm.clear_range(&ggtt->vm, ggtt->error_capture.start, PAGE_SIZE);
 
+	mutex_unlock(&gt->i915->mm.stolen_lock);
+
 	if (count > 0) {
 		pr_info("%s reset clobbered %ld pages of stolen, last clobber at page %ld\n",
 			msg, count, max);
@@ -177,6 +202,8 @@ __igt_reset_stolen(struct intel_gt *gt,
 	igt_global_reset_unlock(gt);
 
 	kfree(tmp);
+err_poisoned:
+	bitmap_free(poisoned);
 err_crc:
 	kfree(crc);
 	return err;
-- 
2.55.0

