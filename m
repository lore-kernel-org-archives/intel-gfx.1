Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28220C4453A
	for <intel-gfx@archiver.kernel.org>; Wed, 22 Jul 2026 10:28:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A8ABC10ED4D;
	Wed, 22 Jul 2026 10:28:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IKdk+uUC";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9713C10ED4B
 for <intel-gfx@lists.freedesktop.org>; Wed, 22 Jul 2026 10:28:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1784716124; x=1816252124;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=F4RbyWdjkpUERW0iT8svzCycvbL9EYjTmkySNshWd6Q=;
 b=IKdk+uUCLal8qVBsKQtsPvqHsv4yXgjlNlALyFLG9XxcRBmJtb2dZOAe
 2XfhgovkeN+WP4zAXEck4bjBDFVxRW8MG5cqQ/UzYXSWoceJzAdECZYQc
 kVlCtoRXA7TLU20AX1G43C5Xia+KpxHq6/mCPatZBOck5WtnIp+i/ZG9L
 RrsvglJTKqgVGEftdwBnSV+nfnd3JHVEnvGkGnWTSFJZJRkla1cpuVG2s
 adOIUSzNV3c0W61vp22n6RIfyGZlutnu7ppeNi+RdczpmiLGnoyNmZmen
 1sQwtk7HI67KtXgjQhZIBWIxrQCsQzV5jOGh0T50lYT5oL6sz0HP5YT81 w==;
X-CSE-ConnectionGUID: nRG0bg+8TIyGwfvEoSDBlw==
X-CSE-MsgGUID: ONPSSe9bQhCM4UW9ogQFBQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11853"; a="85110227"
X-IronPort-AV: E=Sophos;i="6.25,178,1779174000"; d="scan'208";a="85110227"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jul 2026 03:28:43 -0700
X-CSE-ConnectionGUID: jrZXHVEPRAKeuWW1c3zpBg==
X-CSE-MsgGUID: x1p63RHRTu+mzymC1EYtww==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,178,1779174000"; d="scan'208";a="254143386"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jul 2026 03:28:43 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Wed, 22 Jul 2026 03:28:37 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43 via Frontend Transport; Wed, 22 Jul 2026 03:28:37 -0700
Received: from CO1PR03CU002.outbound.protection.outlook.com (52.101.46.23) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Wed, 22 Jul 2026 03:28:37 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AW95NQrvjx0V3d/rG30JOdFWnuK5df7Dnss36hYE99undugs7ydh5DaPX3370uXaHvZsvQpFKbsdJTk4ssFKz3E9eGFCIcl2RE1whb6tZgPenprIciyx5R74JrBvNdBUpI3LAflX6O8cMubQ8b7KnB6DFEeIX3fDRWVKZ7WTEpzmm/YvuHHYWZS5/KDICfyySSJB8rZ+wNM/AikFGVx1f7fHTiFI5+ArhoOR3eQ0nyMTDV61iTGLS24gs+/VoEkvYKqdJR/AZjbLU/XHafWh3NrhYMqKRYoqjyBGXRWKEL/Tsxmh8LrptRTzxMMSerIgrQc3jS/FkYFJcXSCGCKjUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dMTUBA4YNMv+jpSznxIEIGdB/zq7L4bmc+p/4UQB2Yc=;
 b=v4yDZXVeZLyNlPCyMHaiT6G1GVirnz9Lid1lvdgbH6YsCQs4GWnKLqJEKXmnGHWetNi3SXB+i/Zg5Sx/+6yr5IbLZBjKhbp99hFXkIhor5PqQEZ6iar3Bi57uK+ZYJctAbEI9pnqUMwQ9HQi9aO4Qr8MzVZavpTaMZY8E8BrwzAeW7As2GWHT2BE/L7giQzJWKOPmkqq/TARBYBc4LCzEN4NZc2KnJ7MaLNJnJhJY7JwiU3w64m64zYMcNfunLWzSrTQWpJ11R8wTLIkfE2sFvphZPRSDqrcQxoUGCxgU0Dycxy+SYF+cSPn3jF/5+d+4pkrb1GPhZm/onULamjhBw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW4PR11MB6909.namprd11.prod.outlook.com (2603:10b6:303:224::12)
 by MW6PR11MB8338.namprd11.prod.outlook.com (2603:10b6:303:247::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.18; Wed, 22 Jul
 2026 10:28:31 +0000
Received: from MW4PR11MB6909.namprd11.prod.outlook.com
 ([fe80::9eab:962:806:3794]) by MW4PR11MB6909.namprd11.prod.outlook.com
 ([fe80::9eab:962:806:3794%4]) with mapi id 15.21.0245.009; Wed, 22 Jul 2026
 10:28:31 +0000
From: Sebastian Brzezinka <sebastian.brzezinka@intel.com>
To: <intel-gfx@lists.freedesktop.org>
CC: Sebastian Brzezinka <sebastian.brzezinka@intel.com>,
 <andi.shyti@linux.intel.com>, <krzysztof.karas@intel.com>
Subject: [PATCH 2/6] drm/i915: Convert GEM/VMA core license headers to SPDX
Date: Wed, 22 Jul 2026 12:29:19 +0200
Message-ID: <833dd9c98f5858dc9315a24f61374be92af5a73d.1784713895.git.sebastian.brzezinka@intel.com>
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
X-MS-Office365-Filtering-Correlation-Id: 9f1161eb-2890-45c9-2d26-08dee7dbfa24
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|23010399003|366016|22082099003|18002099003|3023799007|56012099006|11063799006|10067099003;
X-Microsoft-Antispam-Message-Info: vwYOOzcLSnPDSBx7XRjKbFC4DMFV8q6mFFJA2rKuQVOotfsGOFGEmJd43Nk9zYfDQPvqOB6lZn8/NsOnI0SSgv/k4DqHeimyKtsZVYWmd3wQJWERurGunZMHJ2XTtRzUtYp0SyRzBvQQ+hUBPGQmO8flUaufyOM3e69G7Olyaujy0tcsR8AUCJ0Bha83yVnmgsI8OYIYrFlRWtgXo7UhOtJTjY+LcFOWb/lM+8JPyUf0rH7LAR7WmZ5XcmSY+6E6she27TELbv83rpDc3H9NrX3F1KBwnuM1Kz5sRhQLsWZGfeZoBtI3vsdlkEhj4qsdK3Xahz/+lt2AaTa0wC5NuU4i6mfeobi60W0tvEn8NR/9tFOq6YIZM9/g0jtNFz5JCvp0n4oPO9EsHOmvqusYbWtnozQ8tan/bUFNdfpa4D8a1Z7UNa/Ep7H2NkWUpYQW54TDP8fAo4vhrVHUl7ev+OWZLW9ojkTED42i8xevFJwBRMwHrdQVLvbp29pVVGLSQrzNLa4qT9x9jeZtExnN0T00paAcbCpy/bxujLoYo5mmX112/XsCYef2+sGZZHL+pcSapqQvf/0foCAKVg7L4lilJIMrTzuHjuPSumMl3KBuX7kXQz3UlPIZ0cl5eim+YzLDOTbHRWO7GwwAY/sqDKjidtrGcPc4HcFzoK5Gcnc=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB6909.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(23010399003)(366016)(22082099003)(18002099003)(3023799007)(56012099006)(11063799006)(10067099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dDhVQ1NKaTBaMWFONUQxWEM2b2hqWjV1SDJ5cVBXald0WVB3NVZqa1pVU0dX?=
 =?utf-8?B?aHhqbnpMMXMwRFV4enVaejFDai9oTUZ6a2tVeTVEd3V6aXI0MzkyKzYwZm1R?=
 =?utf-8?B?K1V6ckpTVjVHQ2hvRUc1bkFtSllsYU5Lem1RUWFOemlpREUzR3Y2cE0wa3pH?=
 =?utf-8?B?WGxTL1ZGOEdhNnhldmpkZFBxb2xza1Uxa0hwa1lBQmNtTUtSUitBRE1BOHBq?=
 =?utf-8?B?WkhsdkF2TTZHcFIvYmZLV08waDJWZjc3NUNoemtKa0FOREpCQ3FuWTA2QTJt?=
 =?utf-8?B?bVY0MDlkOERwdW9VMGg0c1g2M2pSNVhKK1Y1ZENsaGNFRmZiRnNsSGkwdHU5?=
 =?utf-8?B?eDhWczJyb2xVaFk3TzQ5TGI3WlBzOWhnKzVIZnBTRUZQblhjeUM1U2hMNWtY?=
 =?utf-8?B?cVNsRUZjUzRWWm8rUDRqR1ZnVitlVVpid2E3VHZLUWRBdTBjSFFpWE4wQXNa?=
 =?utf-8?B?Z1dnRU14UmxFUXQ3Y09VdzUyYlRnV2hza3lhbHZmQW5YOGdBQVFtVENwcjMy?=
 =?utf-8?B?cGxuYVdiQ1FJcVNMMkJYNlRIT050L0lHcE1nZkV1RkxiTmVJcEZaejg4UHds?=
 =?utf-8?B?ZTlJWjZXeTh0NzFkTnZzSFRGNkFBSkN6eDhkYWMzcVpsaWdZWTZJa3psK3pW?=
 =?utf-8?B?ZlhVSWMrSXVTNnlIcUx2enpzZ3ZKTk1lWS9ranhKR3dPRDBBR002VTljYkxW?=
 =?utf-8?B?UmxMeUZBVHltdGlBTmhhaTdhZmIwUnhOTmd1MUVWZEl5TXFYNGJPZzdQcWV3?=
 =?utf-8?B?aExpdGduTThuN3RCVHRqZ3cxQTB2eXJiY3BlUFNkOVZ6MTNFdlR4Yk9YNmxJ?=
 =?utf-8?B?ejRoTEkyd0RidnNlMXBtdUJHQ3Vab1pqM3NGekJ1WFk5eWFtVHVpejlOUGtm?=
 =?utf-8?B?aFhHMTFPaFFja2Ntb3hNU3YwVmFLbVppRW0vSjJMU3Rzc0JqdEYxaWJSQ1Rl?=
 =?utf-8?B?bTJYVExxN1Y3alR5SjkwNDFWQ3BDbEptemRQOHRscEN6TTIzSnB3M1BYNEZ2?=
 =?utf-8?B?dUt2V21ZSC9kZVdQdTRRR3d5ZEJydE92M0x1UjFDWm1uYm1mZENwNjNETUFY?=
 =?utf-8?B?NlVBREx3NStBaXh6MlFYVGI2R2d4UzlNN0pxcGx4dmNiWTNDQmVyZENMcW9x?=
 =?utf-8?B?cUNxWjFJRGVMK0ExUHVBOEhXQy90TjZrUTBkY2lDRWdTUTJuYUx6ZEUvczJX?=
 =?utf-8?B?YzF1cUlQbXhZZXRJUjI0cUw0ZWowMnQzbnpYcFZQbFdBVjQ0MWtsd0QwV1VK?=
 =?utf-8?B?Tms4V3lGWjY1OVk5UjVJUWRwa0hRWHZ4eENMcXRQK2tqR3F5QzRFWEhIaXU2?=
 =?utf-8?B?eDl2MDVRblVOb2ZMbnQ3VGluaTFpeDkxb2RvNzU0VTdNWXd4bW5mb0tyOCto?=
 =?utf-8?B?ZGhxS2RXWUNmOHlIdTdwOUN0ZDRySmVQZlIwSFkzRllXZUtQZDlPYmIrellr?=
 =?utf-8?B?WXI4WjcybGQ2R1ZDUjhDWjBBSjlaVkdDTkFwak5RQjIyTzVpY091TnE0dUdN?=
 =?utf-8?B?M2ZCRGZDQk1oY3ZrUGVRMWFHVHVrVjcwK3lxN0hKYVFPL25qNXgxNmU4Tkpz?=
 =?utf-8?B?U1lTUzRBcXZyTDdwYmlWL3cyelRyaklkL3B1OUhVOWxlMk0vclcvTnkzU1dw?=
 =?utf-8?B?UU1ITzJzaFZacjNoak5RUmlTQ0I5KzFudmxCTmxCb0RHS0VKRHl6dWJYNnNr?=
 =?utf-8?B?RmlLaUR3VnpCaEx3aTlhUWNGNUJLSTR0QjNiOE1HWWZOR2sxdStETGd6UEpC?=
 =?utf-8?B?MXZ0STQrWEVnaW5ZbzVxdGxiWHo0L2lnZ1I2aDMxblhZYVdUdy9CVGNGczQv?=
 =?utf-8?B?cXBwYkQ3c0xsdGd6TTZCcHlJNXhqTE1ENUJmY28yRXhBZnlPOW1yYytFYUZz?=
 =?utf-8?B?Z25FYkpoSjVPaUI0TUNOVk5OUlZ4TTE4N3AzQlR3R3JDQWh4S1lhVzgySm5Z?=
 =?utf-8?B?eGc1ckp2bSsxVitQWnoyd0cveDg5YnFjVEwwbDZudWVUVHRSVUZzQTloZnB5?=
 =?utf-8?B?NEtrTzVPNTNHa3cvMEhhNlZnd2pWNExMN3pWOW1mZGVzUjNQOVpsekZRemJ5?=
 =?utf-8?B?K1V4bld3MVU2SkovdEs4ZTB6a2VrREJtZ0QyUjcxbTRlQ0w2QS9aamp1WC9D?=
 =?utf-8?B?Q0RUZ2tneXFCcCtuT29ndmFBSzlQSmMvMVQ0c3kwRmMwNmViWUlDdTlZVEpP?=
 =?utf-8?B?UnlUeW9BaThZczdobFdQZlBaU29mZVpGcStZY1cwZDRwSnZzakNZMGthQlpS?=
 =?utf-8?B?OHoveW0vRUJpZnVaWU9vZ2Zma0xQSlBOZURMS2dGNUw1akptNHl0OEs5TDBx?=
 =?utf-8?B?Q3pZdWZHZFlYM3NYOCtlM2hGb2ZpQlFhd0FjMnMvR0E2a1VQUjlTWWsxeldH?=
 =?utf-8?Q?6tPwS4B46dreMy74=3D?=
X-Exchange-RoutingPolicyChecked: FpL197czHdONxteInYKl0nGXb9K1/Ico6o4m1UHl9qonTRSqoMD8VJQ2BbbVR1ZHKK5Ub3qDRMae0lIP9oRtzPRjQj8U7gep8zM6pJaYDwgVmy8p38sMQyK1ccgv4EDdRMTRrSj7QOTpMIZXS2+OL1tk6pySktSNdLqOhI1l88HMY9eRO465qIDeFnopOkqCZp/uWKjvH783iWRIszgj/ZzqtaK4Fur+NXnbfn9CUG6Mpf3R3zYImjpxW/4abp8IeXsGsLCSyHXDoS3IM4CvLvzPwzTpzacSkRjBvcC6AEOkYS1L00sV3mjl1TbhZOmPOYsSfXskUbB6fdGWmHlIhQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: 9f1161eb-2890-45c9-2d26-08dee7dbfa24
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB6909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jul 2026 10:28:31.6889 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xAbDYcmuo+ptLMyJ67EEuTXNMMtXbIHCAFs9IKcjBT3a3CvqQHXQw2m51BWNKG7wWHkfnNEafgSd+IF3vvW9xT5ogSxCmvcOIRCAwFfqHaU=
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

Replace the verbose MIT license boilerplate in the core GEM object
management and VMA files with the corresponding SPDX-License-Identifier
tag, preserving existing copyright and authorship notices.

No functional changes.

Signed-off-by: Sebastian Brzezinka <sebastian.brzezinka@intel.com>
---
 drivers/gpu/drm/i915/i915_gem.c       | 21 +--------------------
 drivers/gpu/drm/i915/i915_gem.h       | 21 +--------------------
 drivers/gpu/drm/i915/i915_gem_evict.c | 21 +--------------------
 drivers/gpu/drm/i915/i915_vma.c       | 21 +--------------------
 drivers/gpu/drm/i915/i915_vma.h       | 21 +--------------------
 5 files changed, 5 insertions(+), 100 deletions(-)

diff --git a/drivers/gpu/drm/i915/i915_gem.c b/drivers/gpu/drm/i915/i915_gem.c
index a432daf8038a..db380a83eb58 100644
--- a/drivers/gpu/drm/i915/i915_gem.c
+++ b/drivers/gpu/drm/i915/i915_gem.c
@@ -1,28 +1,9 @@
+// SPDX-License-Identifier: MIT
 /*
  * Copyright © 2008-2015 Intel Corporation
  *
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
  * Authors:
  *    Eric Anholt <eric@anholt.net>
- *
  */
 
 #include <linux/dma-fence-array.h>
diff --git a/drivers/gpu/drm/i915/i915_gem.h b/drivers/gpu/drm/i915/i915_gem.h
index 20b3cb29cfff..e62fd23a2b4e 100644
--- a/drivers/gpu/drm/i915/i915_gem.h
+++ b/drivers/gpu/drm/i915/i915_gem.h
@@ -1,25 +1,6 @@
+/* SPDX-License-Identifier: MIT */
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
 
 #ifndef __I915_GEM_H__
diff --git a/drivers/gpu/drm/i915/i915_gem_evict.c b/drivers/gpu/drm/i915/i915_gem_evict.c
index c02ebd6900ae..f1a041cdc861 100644
--- a/drivers/gpu/drm/i915/i915_gem_evict.c
+++ b/drivers/gpu/drm/i915/i915_gem_evict.c
@@ -1,29 +1,10 @@
+// SPDX-License-Identifier: MIT
 /*
  * Copyright © 2008-2010 Intel Corporation
  *
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
  * Authors:
  *    Eric Anholt <eric@anholt.net>
  *    Chris Wilson <chris@chris-wilson.co.uuk>
- *
  */
 
 #include "gem/i915_gem_context.h"
diff --git a/drivers/gpu/drm/i915/i915_vma.c b/drivers/gpu/drm/i915/i915_vma.c
index afc192d9931b..767a4952c331 100644
--- a/drivers/gpu/drm/i915/i915_vma.c
+++ b/drivers/gpu/drm/i915/i915_vma.c
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
 
 #include <linux/sched/mm.h>
diff --git a/drivers/gpu/drm/i915/i915_vma.h b/drivers/gpu/drm/i915/i915_vma.h
index 892306ab935d..7acebe32fbda 100644
--- a/drivers/gpu/drm/i915/i915_vma.h
+++ b/drivers/gpu/drm/i915/i915_vma.h
@@ -1,25 +1,6 @@
+/* SPDX-License-Identifier: MIT */
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
 
 #ifndef __I915_VMA_H__
-- 
2.53.0

