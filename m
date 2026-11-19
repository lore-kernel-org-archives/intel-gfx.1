Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C623606A339
	for <intel-gfx@archiver.kernel.org>; Thu, 19 Nov 2026 14:35:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=fof8vR7+;
	dkim=pass (1024-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=selector1 header.b=Ucu4DbcR
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6CBB61124AB;
	Thu, 19 Nov 2026 14:35:39 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D60591124AB
 for <intel-gfx@lists.freedesktop.org>; Thu, 19 Nov 2026 14:35:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795098929; x=1826634929;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=gxKNas6/JlDp2e6AzVoKC7YxbyHzjFLC9UoeAY9vyBo=;
 b=fof8vR7+14PYYn+cnRFdDyNlHv1VsasXTk/Fav6bkfg5yR3JcP4mR2Ex
 808A85WoojaMbS5u8gzATqwlWys23ghFmYv9tqzxl0tRS9Kr2AItpWvSD
 Uko3YHT6a5KF2+Jub1Z/Wc+Wx3FjlbxiRtpILU4rsrqeoxXCtNNsyp9em
 vhkloHjallqOAbPx2mFC/eCNNkTINrAArgF2AyyFwWEFNGRy/EaR7SWU2
 v3NAc/pXj2CD6YC0kmnUn/jZzVzkMFyXIGHCRa4D3AYILNkB1/+4yt7g+
 D4WM8cTqQEcIVD9y5eRR+Pk2v3kPzF8QYyaDezVG7faXwvoPZGJxgzuf7 Q==;
X-CSE-ConnectionGUID: oZ1XYg6QSa+jLfw9Riz8mA==
X-CSE-MsgGUID: XhIRtV3KRYyS2PgZY31RFw==
X-IronPort-AV: E=McAfee;i="6800,10657,11971"; a="3840650"
X-IronPort-AV: E=Sophos;i="6.27,221,1787036400"; 
   d="scan'208";a="3840650"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Nov 2026 06:35:28 -0800
X-CSE-ConnectionGUID: rkqnz51gRy+oeSb+t0TEUA==
X-CSE-MsgGUID: 17z91nUFQlaOXRQ9zDijUw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,221,1787036400"; d="scan'208";a="10442999"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Nov 2026 06:35:28 -0800
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Thu, 19 Nov 2026 06:35:27 -0800
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56 via Frontend Transport; Thu, 19 Nov 2026 06:35:27 -0800
Received: from BYAPR05CU005.outbound.protection.outlook.com (52.101.85.45) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Thu, 19 Nov 2026 06:35:27 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Sgk8rtjlsM93S1QPjqpNqscrqIQTowKaZ4Q8I00xzkiBKlFmJbI+FxjzHnrcerrbh0MfuBtoHo8LoroOcN1GuV8d+S/cGvbS7elKd6NoMSLT++gDAE1/Jypx2AKCRsMimk9ZQUc4yVUcs1Q2JkD9oNswCuPBkQlKRskW8+zopCSnUxdzxLTNMnLxReoxFsoNDMBU4ZJFr18NONYx+PFg7YZQ6Gn8UtUMxhLKuElApU5eRg1G77FIKcv0by49qWRR1kOYGa7jRFUWE7sL5Z7bXDSivDs6aqBWt/f9pR8AmFFRNZsrZAaTtYloWQQnFDsCLjdldPw9i27nFICRNVl1pA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rC8hvplAlxcz+8/jSIINhWq/lMljLym794Zgh6Bu9kU=;
 b=b/sG5/Z2Hq5vyqRs0Vxvq9RWA7O1IwS2lUgBb3a800lSaFZDFnBKCl/AZvY1PJ+nsfArC+H5bmlFVtPS5fUqnF6kN3KoLDQLimbwvLFxnQao0Cf2C8eGzy8xnQFNyxYfmTuqpEtOj3W1nk0ecYjncDs/iwvJGIGPzHJloG6B+yLa7QaPVl7hMQ12dTzgJSABpMQXoNWs+YOU46IkIYGo/XCzs/E1H7gdYQNIfZCPVPg2q9kQVt7Z99HELvmM62oydIkHT4b5TTv4uOeI+9kRa/447nqLCkEvN1DXY2fjkTD7Ni+PuhSrqsfB5PFykahv8w/2hRtgAdm/Y1r1VAk4Ng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rC8hvplAlxcz+8/jSIINhWq/lMljLym794Zgh6Bu9kU=;
 b=Ucu4DbcR8D0YIejwohYxOckRa0nVhzEAIxZd4u3GZNe7KEAXRIf86hqTfMrDEp5RQIolXlYfTEtnDQmblwcv56elAngqwXcTwOwdP8ztCEWF6Y1i0hplaPaoZIAecooxbLHcthbTwbg4wkO21vGzhOLMcKFtUFepkzH6AwHnr8M=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from EAYPR11MB115281.namprd11.prod.outlook.com
 (2603:10b6:303:2fa::10) by IA1PR11MB8832.namprd11.prod.outlook.com
 (2603:10b6:208:59a::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.10; Thu, 19 Nov
 2026 14:35:24 +0000
Received: from EAYPR11MB115281.namprd11.prod.outlook.com
 ([fe80::5eae:5253:53f8:c769]) by EAYPR11MB115281.namprd11.prod.outlook.com
 ([fe80::5eae:5253:53f8:c769%6]) with mapi id 15.21.0639.010; Thu, 19 Nov 2026
 14:35:24 +0000
From: Krzysztof Karas <krzysztof.karas@intel.com>
To: <intel-gfx@lists.freedesktop.org>
CC: Andi Shyti <andi.shyti@linux.intel.com>, Janusz Krzysztofik
 <janusz.krzysztofik@linux.intel.com>, Sebastian Brzezinka
 <sebastian.brzezinka@intel.com>, Krzysztof Niemiec
 <krzysztof.niemiec@intel.com>, Krzysztof Karas <krzysztof.karas@intel.com>
Subject: [PATCH 1/2] drm/i915: Annotate flexible array members that require
 minimal changes
Date: Thu, 19 Nov 2026 14:35:09 +0000
Message-Id: <20261119143510.2971237-2-krzysztof.karas@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261119143510.2971237-1-krzysztof.karas@intel.com>
References: <20261119143510.2971237-1-krzysztof.karas@intel.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: DU2PR04CA0189.eurprd04.prod.outlook.com
 (2603:10a6:10:28d::14) To EAYPR11MB115281.namprd11.prod.outlook.com
 (2603:10b6:303:2fa::10)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: EAYPR11MB115281:EE_|IA1PR11MB8832:EE_
X-MS-Office365-Filtering-Correlation-Id: 0006d615-99b0-4ea2-4393-08df464a5914
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|376014|366016|1800799024|18002099003|22082099003|11063799006|10067099003|56012099006|261022075727099003|261022115727099003|261022105027099003|261026130827099003|261026140227099003|261026121527099003|261022113327099003|261102123227099003|261028144727099003|261026135527099003|261021135927099003|261021133027099003|261021130227099003|261021123027099003|261021121427099003|261009223027099003;
X-Microsoft-Antispam-Message-Info: wAqlY/caT35/otD5smLlqWAsKgLwhrMfnJyEDaxLb8pAxonmfZuURUa2Lp/zkI40SYFpAURqi54zfhffkqzTy/EbZ505WkhmYDaO2veTuiIWxJ7bcQIHT4IckEkpJK2f5owj3T3FfNRneew71Tde2O+PrYdav6hLi+dXYRys77W/IoySP2Yt73GPffhXuqkJd/bxHLsR9wCdAVeEd9ZLjHQjANl+EvC7b2jF+4Nab/RpbjfjjN/MiK1zt4sDTmDbs5jCOnXyh61qiTgsdsZfoG4trv5rNUUTuLXvGgvqhTGONnq+b95f1J7yisVqryArGoZly9pFXYDIrlOmH8iiamZ9LWQotcdhMWHsibfRnNtR8WrKheN8fi/J5Lb28SJIFeLabpqvXeBherLbKOzk4jh/+VOT/hIrEd0iL39p1CXEQnVUNyccXfp77YCOK1y8goUsOl4qsZdv3tVkUdNMtwHXPQmCo2nk9TGREuYGRlYFw9VEo0zZwHAjHCxG6JLQo3yifk9INqY83sHUoJxbZUAt6qmA2BmnycWEIhBq9mI+O8AF6LBVlC7yM/vxCyN2ud0KHL36GrXIcg7VLpo7B+mrPgjFJppbg13XJk5F4PBSIVqqfcTm9ZByaZ0c9gZWVjZymxqPigBHjBZsnmw3p2rCIvtcLwDynobDaDI8WXM=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:EAYPR11MB115281.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(376014)(366016)(1800799024)(18002099003)(22082099003)(11063799006)(10067099003)(56012099006)(261022075727099003)(261022115727099003)(261022105027099003)(261026130827099003)(261026140227099003)(261026121527099003)(261022113327099003)(261102123227099003)(261028144727099003)(261026135527099003)(261021135927099003)(261021133027099003)(261021130227099003)(261021123027099003)(261021121427099003)(261009223027099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?StfGdmGYyLx/wmcMKgLVobDwmEKL1c0d3d3eCD5/nK+vkfGZAFAxROx3NEZ4?=
 =?us-ascii?Q?QKVsOLbbyYxj/ihco+ck7DZICk2QH1MB33NWXHqnqxgGaRWO/wpilfjGIxop?=
 =?us-ascii?Q?+glfbeYW7hOh8rPZFjEQ1e48huZkJz1II6MpSRAQAU1H7N+TqgJzNMTOP5t1?=
 =?us-ascii?Q?OPoQs7rMhjHPUaE43A94fNQrGii5DiUk/OxlGCRT1U4pIA2vSxuw9jhtnHdq?=
 =?us-ascii?Q?+fnzAQSrQnpsgAzYKgYixuT5Putrd/b5lLoWOiN9rIUnTP+BbPhTtfmHQMyU?=
 =?us-ascii?Q?wOz33MQH8YcnVO5YanlKtAcAiKNlVYH65oopNU99whxoniaPa1vD+Lj521Lm?=
 =?us-ascii?Q?SDHtvANplKJZGXYRUe4jhHukz4KCmbhN8xtIq3iG7dlAKOFOG16ITGdqCbNR?=
 =?us-ascii?Q?/TpA9D+eUu+19+zhS6BZjGoVJWg25WxBaBByFQ6eT1pmp1Ke3saWj4dL6IUB?=
 =?us-ascii?Q?IYkxqVMZN4IyfhprMjecxv0SP07JrvvkUbMt214HJuHnfKH3ud5K/G1lfurA?=
 =?us-ascii?Q?7jrF7Bv04FC5tVuuMFGFuRpeAHvvmrZqEfBgS+CDFfluNCcSB6fT1lkSePaX?=
 =?us-ascii?Q?xS14xkLltnbBWpaaPqZUkZx6/iLSB3HmJYVoPQlGeLkydasF8J0e70PT3BD0?=
 =?us-ascii?Q?t29TC1tc8n5K/FANNrwuW8Qrf5QpKDZ6mu+rgBnxzUp+DDMhC2m9+eyv+1Sd?=
 =?us-ascii?Q?zD0GxWl2gOiobe5OpsewGJWw3Z+OJJEBDdeGGm1crDltlydfp+oceMoc37mm?=
 =?us-ascii?Q?/LNh2UgQbgzTYVGZE5YIpU7CurPwWREhNkbmnaWhCdFuxNCEvnrrnEsCwVDG?=
 =?us-ascii?Q?QrGRnj7cJuwEoxaVPgZzYGvaF3/ZCJVgCYDJukD9vfwdXvY8wK8sVJEUuHgu?=
 =?us-ascii?Q?OBbqLDRIOtcDcAcRi6gWetiiVPLfYsjWgVoBd9qvqQFLqlifk4GgGIuNXVOH?=
 =?us-ascii?Q?34pegyEfM3Izujd2g1aNZewAM5D+8T4IuHzvTnHUBlaBpeCmRskkFLoReeYo?=
 =?us-ascii?Q?sWfM3oACfJHoeZxpJVqStAAhd0U0WL8DoiQOLx+hUIYTsjVNveuhJILasQpm?=
 =?us-ascii?Q?WWEA4mOWdwMnM3BT/mSTwZfuXk1VkMfo/CQANOTomtd/XTXqNYqeTcCD7ioJ?=
 =?us-ascii?Q?oQLw2IBT6ZkPCy+kJINXPbr1ZB5YTQbFoapmUz0/ij5etpOrVIN4kduCUOui?=
 =?us-ascii?Q?l62QOFotpWaz5dXVE0XqCoPvMXF3dN2ryVLjzm4lcxHGPZ+4IDXQIDtpzHfm?=
 =?us-ascii?Q?hU7HZ1u+noqPY0T2Wf0ZuD4Gz6Dorg7uuRFNTiB8VLWs6NWN9VBog7+QvyJN?=
 =?us-ascii?Q?Zg8SGjbcGZsHAYZNsqmkQiM1WKGp8E2ZHCk90wl4RcidjquuDEByzsmf3ixb?=
 =?us-ascii?Q?Us/fvQ30IRvl81JHBbpVeaGfnt9DOVGIukXkfdhKPSSBdZe9kj2bGjVQQI+f?=
 =?us-ascii?Q?JKnuixFzTb2B1VSjSBwCEiiBU/EnSPsuH0SL8VhaAMAxwZK1JDuxNL7RTR42?=
 =?us-ascii?Q?uAjaca7hr7O4MsykS3Sj1je1okYl8ykUIlyPBc9vpgiMhe4NydgFiRsKFnWj?=
 =?us-ascii?Q?EbGgJrmarbiomokWddMUAqucwZNj42w2NtAb7F2JhNQspA+bVA39bdpJsUxv?=
 =?us-ascii?Q?b9tlcEaroShK+8PhSDqcP/HHYJGhMwncM4TPVDrqrSkPEhH78g4Cqb9XtbA2?=
 =?us-ascii?Q?32i+Vhy/pAYV/VxkaX/RiD42LAgQZ/N/+My3KTTuTaYJj2IY+3J3dICD36wA?=
 =?us-ascii?Q?/BTK8Iz/EqH146sxZCm9LnDgOLTSFtY=3D?=
X-Exchange-RoutingPolicyChecked: lAaL8F5zCNR3KZsZnSvZD9fG9CP/tYjbOhaEoFk10MbbVrjM8TFQr80tWs1xysC+g09fu55DflxEdb/L+RfLz/YHmzxNldx9mlKyHz4WcIcfasI8D7jTkdDdfgV7VBi30r17dNCLc6nfVQVGVZoNQEMnvpwIiCs32wvh1B8jk/bPKkIf9VTgoZSCa7ydWKkS2UOo3AHpT4taCwcfDEkIuvpD3SuF4INWlL7r6R8UblpECP+SBKqb1ATkxusphnPF6TpyofYN7M5ZbbpzKZ7MqXOg3w8GfwYZgr+Y3rfCrfhjz/VzvBhDR9cXdDNPUuxnrV7B08NHrn3sqf35pQAS9g==
X-MS-Exchange-CrossTenant-Network-Message-Id: 0006d615-99b0-4ea2-4393-08df464a5914
X-MS-Exchange-CrossTenant-AuthSource: EAYPR11MB115281.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Nov 2026 14:35:24.6966 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JUKzStbaa1pNaiUo3BiX8OpMw94htF2tulITI8JlGrgFvfmtfGdreDrVx/ZznPEUkBSwDMXv9LXmVB4zUpeU7rJ8MtWSlr9Ud1UKkGsVQI4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB8832
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

Annotate flexible array members with __counted_by() attribute.
For starters, follow path of least resistance and pick the
entries that require minimal changes to the code.

Signed-off-by: Krzysztof Karas <krzysztof.karas@intel.com>
---
 drivers/gpu/drm/i915/display/intel_bios.c            | 8 ++++++--
 drivers/gpu/drm/i915/gem/i915_gem_context.c          | 6 ++++--
 drivers/gpu/drm/i915/gem/i915_gem_context_types.h    | 2 +-
 drivers/gpu/drm/i915/gem/selftests/mock_dmabuf.h     | 2 +-
 drivers/gpu/drm/i915/gt/intel_execlists_submission.c | 6 ++++--
 5 files changed, 16 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_bios.c b/drivers/gpu/drm/i915/display/intel_bios.c
index 7b6a6f8c3cf19..4c14593b7a000 100644
--- a/drivers/gpu/drm/i915/display/intel_bios.c
+++ b/drivers/gpu/drm/i915/display/intel_bios.c
@@ -148,7 +148,8 @@ static u32 raw_block_offset(const void *bdb, enum bdb_block_id section_id)
 struct bdb_block_entry {
 	struct list_head node;
 	enum bdb_block_id section_id;
-	u8 data[];
+	size_t data_size;
+	u8 data[] __counted_by(data_size);
 };
 
 static const void *
@@ -468,6 +469,7 @@ init_bdb_block(struct intel_display *display,
 	void *temp_block = NULL;
 	const void *block;
 	size_t block_size;
+	size_t data_size;
 
 	block = find_raw_section(bdb, section_id);
 
@@ -492,12 +494,14 @@ init_bdb_block(struct intel_display *display,
 	if (section_id == BDB_MIPI_SEQUENCE && *(const u8 *)block >= 3)
 		block_size += 5;
 
-	entry = kzalloc_flex(*entry, data, max(min_size, block_size) + 3);
+	data_size = max(min_size, block_size) + 3;
+	entry = kzalloc_flex(*entry, data, data_size);
 	if (!entry) {
 		kfree(temp_block);
 		return;
 	}
 
+	entry->data_size = data_size;
 	entry->section_id = section_id;
 	memcpy(entry->data, block - 3, block_size + 3);
 
diff --git a/drivers/gpu/drm/i915/gem/i915_gem_context.c b/drivers/gpu/drm/i915/gem/i915_gem_context.c
index c58ffa5a8fa6f..2efcc5d5d5ac1 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_context.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_context.c
@@ -1114,6 +1114,7 @@ static struct i915_gem_engines *alloc_engines(unsigned int count)
 	if (!e)
 		return NULL;
 
+	e->num_engines = count;
 	i915_sw_fence_init(&e->fence, engines_notify);
 	return e;
 }
@@ -1124,6 +1125,7 @@ static struct i915_gem_engines *default_engines(struct i915_gem_context *ctx,
 	const unsigned int max = I915_NUM_ENGINES;
 	struct intel_engine_cs *engine;
 	struct i915_gem_engines *e, *err;
+	unsigned int num_engines = 0;
 
 	e = alloc_engines(max);
 	if (!e)
@@ -1147,7 +1149,7 @@ static struct i915_gem_engines *default_engines(struct i915_gem_context *ctx,
 		}
 
 		e->engines[engine->legacy_idx] = ce;
-		e->num_engines = max(e->num_engines, engine->legacy_idx + 1);
+		num_engines = max(num_engines, engine->legacy_idx + 1);
 
 		if (engine->class == RENDER_CLASS)
 			sseu = rcs_sseu;
@@ -1159,6 +1161,7 @@ static struct i915_gem_engines *default_engines(struct i915_gem_context *ctx,
 		}
 
 	}
+	e->num_engines = num_engines;
 
 	return e;
 
@@ -1211,7 +1214,6 @@ static struct i915_gem_engines *user_engines(struct i915_gem_context *ctx,
 	e = alloc_engines(num_engines);
 	if (!e)
 		return ERR_PTR(-ENOMEM);
-	e->num_engines = num_engines;
 
 	for (n = 0; n < num_engines; n++) {
 		struct intel_context *ce, *child;
diff --git a/drivers/gpu/drm/i915/gem/i915_gem_context_types.h b/drivers/gpu/drm/i915/gem/i915_gem_context_types.h
index 0267c924634b0..951b46ae559fc 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_context_types.h
+++ b/drivers/gpu/drm/i915/gem/i915_gem_context_types.h
@@ -51,7 +51,7 @@ struct i915_gem_engines {
 	unsigned int num_engines;
 
 	/** @engines: Array of engines */
-	struct intel_context *engines[];
+	struct intel_context *engines[] __counted_by(num_engines);
 };
 
 /**
diff --git a/drivers/gpu/drm/i915/gem/selftests/mock_dmabuf.h b/drivers/gpu/drm/i915/gem/selftests/mock_dmabuf.h
index 22818bbb139d5..1bee91df73ea8 100644
--- a/drivers/gpu/drm/i915/gem/selftests/mock_dmabuf.h
+++ b/drivers/gpu/drm/i915/gem/selftests/mock_dmabuf.h
@@ -11,7 +11,7 @@
 
 struct mock_dmabuf {
 	int npages;
-	struct page *pages[];
+	struct page *pages[] __counted_by(npages);
 };
 
 static inline struct mock_dmabuf *to_mock(struct dma_buf *buf)
diff --git a/drivers/gpu/drm/i915/gt/intel_execlists_submission.c b/drivers/gpu/drm/i915/gt/intel_execlists_submission.c
index 841f719326756..ed3fc9b84f219 100644
--- a/drivers/gpu/drm/i915/gt/intel_execlists_submission.c
+++ b/drivers/gpu/drm/i915/gt/intel_execlists_submission.c
@@ -201,7 +201,7 @@ struct virtual_engine {
 
 	/* And finally, which physical engines this virtual engine maps onto. */
 	unsigned int num_siblings;
-	struct intel_engine_cs *siblings[];
+	struct intel_engine_cs *siblings[] __counted_by(num_siblings);
 };
 
 static struct virtual_engine *to_virtual_engine(struct intel_engine_cs *engine)
@@ -3931,6 +3931,7 @@ execlists_create_virtual(struct intel_engine_cs **siblings, unsigned int count,
 	if (!ve)
 		goto err;
 
+	ve->num_siblings = 0;
 	ve->base.i915 = i915;
 	ve->base.gt = siblings[0]->gt;
 	ve->base.uncore = siblings[0]->uncore;
@@ -4009,7 +4010,8 @@ execlists_create_virtual(struct intel_engine_cs **siblings, unsigned int count,
 		GEM_BUG_ON(RB_EMPTY_NODE(&ve->nodes[sibling->id].rb));
 		RB_CLEAR_NODE(&ve->nodes[sibling->id].rb);
 
-		ve->siblings[ve->num_siblings++] = sibling;
+		ve->num_siblings++;
+		ve->siblings[ve->num_siblings - 1] = sibling;
 		ve->base.mask |= sibling->mask;
 		ve->base.logical_mask |= sibling->logical_mask;
 
-- 
2.34.1

