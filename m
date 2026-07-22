Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB6C6C4453A
	for <intel-gfx@archiver.kernel.org>; Wed, 22 Jul 2026 10:28:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2FD2F10E1C4;
	Wed, 22 Jul 2026 10:28:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="icgw1ZKw";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A346310E1C4
 for <intel-gfx@lists.freedesktop.org>; Wed, 22 Jul 2026 10:28:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1784716112; x=1816252112;
 h=from:to:cc:subject:date:message-id:
 content-transfer-encoding:mime-version;
 bh=Om4YX+QKNdI1btB/Ed4REPbf/3MUsttMlkrqt3hOCTY=;
 b=icgw1ZKwovUFJz75cO5oDdm7wEdpi8AjU3x3uSPScJjLuqjgKlUCpKXr
 7cDx5SCa394HVt2NF7q7y//7p5AGDIfejsoL31xYMgRIhPsH0ysu+ZGMr
 LKZceMJJEq8snVj0YqLf82qbTjyWUKC8crcwISbt/yRcnftALaHxm917r
 ANzl/E/dIrw+0bZ1ZDylR1A9E5I/fi3z5V49OQSVhsR++JF5v1IKHKDcW
 tuPAQpPN0PY+LIuNfV+dB2VZAgXUG666TY9Bw2+3KgZ8eZiRGDKBnyg8u
 uI1sd4HqykxsBrt2HhmcM/uIquKaIJkYiZSv1/U1xDcKIDejURMbNngQY g==;
X-CSE-ConnectionGUID: DMuhMeHDSRSfifO2Rc2afg==
X-CSE-MsgGUID: GfKILSKpQCWVRAseMGr7Dw==
X-IronPort-AV: E=McAfee;i="6800,10657,11853"; a="85293922"
X-IronPort-AV: E=Sophos;i="6.25,178,1779174000"; d="scan'208";a="85293922"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jul 2026 03:28:31 -0700
X-CSE-ConnectionGUID: omdSGLEhQz6oGL+806vFqA==
X-CSE-MsgGUID: 8FaXryM4RS+teiF5cG3y9Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,178,1779174000"; d="scan'208";a="257517960"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jul 2026 03:28:31 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Wed, 22 Jul 2026 03:28:30 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43 via Frontend Transport; Wed, 22 Jul 2026 03:28:30 -0700
Received: from MW6PR02CU001.outbound.protection.outlook.com (52.101.48.22) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Wed, 22 Jul 2026 03:28:30 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rm1oqZ2V/9DrBZ1LAm5+rNODRjTjE0nN8jiat6hSDzhOkXyh1agpp9dV0swJVGHceDyPNicyJhNe+XDENtWzj4tbohcHZPurjjTVak25IiXbC78TG/WnzhJWDg3OvARibrihJRd4KPTp/kyJd9doGeJOHA/EAo2CRyglqSy+5fOH7EA7u28rBHOsPxDO3h8nqZQuuVn/G4PBwFu/7y5/cEzZpaPi6ymbgyS2FI6lMMt/kDmLQJHqcOnglp2ZOYJF6p4unGyvE7pcu5PiRALDGXMhErHpL1koLER5uAGh2MaqTq25h+X8ZA9i2R1SeRfPkeB71mQL3GnowXF4SHR+0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=riOiDxDUNkLoJRu5mm+SvLsASAJH+ZIFisbA8elw0EA=;
 b=ZboQFAWpZ7zGJyF4lfi/Y2+ahDqGCjxJSKqclMKfJt2WQ80KXxwacjjxQiYIh8X1PeI3rqvZsIRi+2u+kAmvktATUP2yzuB1byhauly8thjq2dye/2YF5xAYuM5uOXCgP3DKgzMQo4jW9qEvpK1R9Y3fOnqZ4jBx0XzRaAESYL0oy0lJcrxtIGTc644GVZXh72LMy67YCGSzvKU5uxEHb6un0tP+kakvIFnkxtTgwUinJndJ1hD4QCk/oHXoWHqw7ugfFCCn2Cp3tf9PEly+AqZmkn/k9VJhuXNOvKiNt2/u3MHqkxHTZnYyz6D3q6qnhAi6Quyd8lnGDXTmGQHzIg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW4PR11MB6909.namprd11.prod.outlook.com (2603:10b6:303:224::12)
 by MW6PR11MB8338.namprd11.prod.outlook.com (2603:10b6:303:247::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.18; Wed, 22 Jul
 2026 10:28:28 +0000
Received: from MW4PR11MB6909.namprd11.prod.outlook.com
 ([fe80::9eab:962:806:3794]) by MW4PR11MB6909.namprd11.prod.outlook.com
 ([fe80::9eab:962:806:3794%4]) with mapi id 15.21.0245.009; Wed, 22 Jul 2026
 10:28:27 +0000
From: Sebastian Brzezinka <sebastian.brzezinka@intel.com>
To: <intel-gfx@lists.freedesktop.org>
CC: Sebastian Brzezinka <sebastian.brzezinka@intel.com>,
 <andi.shyti@linux.intel.com>, <krzysztof.karas@intel.com>
Subject: [PATCH 0/6] drm/i915: Convert core license headers to SPDX
Date: Wed, 22 Jul 2026 12:29:17 +0200
Message-ID: <cover.1784713895.git.sebastian.brzezinka@intel.com>
X-Mailer: git-send-email 2.53.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: DB9PR06CA0016.eurprd06.prod.outlook.com
 (2603:10a6:10:1db::21) To MW4PR11MB6909.namprd11.prod.outlook.com
 (2603:10b6:303:224::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB6909:EE_|MW6PR11MB8338:EE_
X-MS-Office365-Filtering-Correlation-Id: e8abd9fe-fdff-4863-0c89-08dee7dbf7ab
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|23010399003|366016|18002099003|3023799007|56012099006|11063799006|10067099003;
X-Microsoft-Antispam-Message-Info: 4+6W/lxYx/QNXH00nI4oZgysM1s8Mfh98JM4c1iiDr09bWrxzZirKlsGlbTK9/osSVp3JRxr7UU4o9nXSdv/vRO4BaO1WUkFNMqWXtyBDGMIczOQdwpYfaQDCOAKMGx7xF4R/tvHuZEZcITWcESlxaRVXy1KvksvpBeEm9Gkit3rkPyaVssT34Y4c9SIQ3qUlbbr6xsbxw8tPQ3w040SC12FgK7ZsWA2mN0qCGTHAQyOvdwQxuQTnwGoJoySObLLDBZ9SApCBI5nd4IwHRX884ZxxXtr0PZyM5ZBM9uc39tpLv1LVk0+TsEum3Lo9zjM3YewFWHVcSOU3kMSalTd9sbvl/DxvNJxyJI06PVlBPSwhzPKUE7yUjfeDwA1GNGZnckd1B4hcvUcHvBnah3WeI0e4SA4RGySGJYGlfV5mffp8JD1AQ03kHiwGCbClpTkZ88zpq0uE9ju3sy0ZNwqXlEW/1xZf50r1+P/F0YIIbbrSIRG1yFnByNWkxXIIgKZk4L+ya5thLGxmyJPNiorMs3pMbvs72cXBC7YNZ4EtGIce1S+KE4xbMj/NvSFpYnw/BygtL/Q/gpGmPPfIavaIvu2GAcO4dg+z2MqNW8PU4U0227EbJtWi/oX7q5pPSBtbQAS+Tdw/URDkPkye4BAwJaYQ/SarDFUnyLEn/KHhIs=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB6909.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(23010399003)(366016)(18002099003)(3023799007)(56012099006)(11063799006)(10067099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?OGH7vfqwd+xUV3xnpdvAWuhpcgXPjzic9/YXjz99cVusvxXs7+sBizXqx4S9?=
 =?us-ascii?Q?41+k6xVafsl5P9a8mZGqUefgp5bDKes0EmVmouAl7DIbDB4GQX7vCqsVodoc?=
 =?us-ascii?Q?gt7PDL7+nEMvwd6+d+29+14phX6Skp2xQPH/dC1bzmq3UFt8Bb0woQCs7pPt?=
 =?us-ascii?Q?jZ1cUTmjWegXg3ZqoCGaLQF6VCLTugl65mS2oUXZI6KazudSju68H/otvnDg?=
 =?us-ascii?Q?AC9AyyK4fp3qzoDhiDtJad/EoqkLsv0YG0rShKE+WYW75uCbikT/LguMjB3I?=
 =?us-ascii?Q?hzsw5gp+vJazFPIfHkG6/XGq7QzQZOv+HeevAqnzOR9uYDov+h7cPwluXtH4?=
 =?us-ascii?Q?lr9kl/Kstq0lW6deP3gx+YoUyPwf57eQAKOKuTGedehKKP0SWvlPzFjocibK?=
 =?us-ascii?Q?nJZGTQQUVYqv7cLSd5HvgJjAmjKh3cl9BwDoBHNcxYlwLn9p4+GX26P+AKB7?=
 =?us-ascii?Q?zMtxNBZsf8BaOjQdJG45/JU8gMze/m7z+ERBa1+Gr0pEK8wxeiGS2rpOgFGZ?=
 =?us-ascii?Q?AD4D6rqlVGvw5v1SxSEO+oVTHf9O+xI/mBtXn7BJQjqDWaZUgJXJFt9iYgFF?=
 =?us-ascii?Q?YlLNMe2zuYWaBJsBzBXXZ/ahWpZq4v31VuYjKH7+yqkzIdGMT/xidOljrxoE?=
 =?us-ascii?Q?MlAgy9w9pw0fTlsEq2zQy/SqZE05kKaR74G0CIL93XpOEf6oBtpBHJBFJE43?=
 =?us-ascii?Q?FilVOpHKxIw2SxsVdxjaa/fLWIZCpp4XCXTZ61pIHnNzz5Cq3lk7munB24eO?=
 =?us-ascii?Q?3TIPccm+ikBBIu/mARnNf8ZrMuLEcrHfUX/S8n8yGqEYLOeZy0K0wPw0VVRW?=
 =?us-ascii?Q?DlADv3xt08HTUt/QY2tWSNYzyNP0peD/NKDXBxgjzFDr813KAUQiZR7OEmAq?=
 =?us-ascii?Q?ly7ja4lMhX4NXwi8rvxJccZMaV+XLX2oY69WoFZbIryVnl2wjqVIXbzlqGoY?=
 =?us-ascii?Q?fpgUdIGKULHCRjp7249IH359uZI6SzFbrJdZN077TxclvxfDkwMZUUGKtMBO?=
 =?us-ascii?Q?q+U/Di9M9w0r+MsgMotulVAm68FE1gH9g10J9jLieqW1BChCgZ6vKOecb9+Y?=
 =?us-ascii?Q?BPqbCJuKb7cUr+XM8Jh1hg8DuaLQZxKO/bXI+wEYKJWBMNwCgFEdDbbZgN/O?=
 =?us-ascii?Q?sSEiDc6JWbaeuzM95u/vUcqzQV8nqFvgAlgAiqnAQr35xBqoSCv+tu1ruCal?=
 =?us-ascii?Q?RRZMvZxRRb0gP9UPKEv0rZ0OvYlG2F3gj9d69VAMYBPVThv9HMFkWicESxv9?=
 =?us-ascii?Q?PoZzzB0LMnBkjsETwx1c1Tu1zSm3qXvyjGw4Sb2ugIiZvUxo7MF12rZv6GPM?=
 =?us-ascii?Q?Fi1EdypMhWhgerIEvvAH7CHC+pZ2NbsrTgRoVqFasSDnUO8wXMiBhlR+UU5r?=
 =?us-ascii?Q?GgwVEkUJPfMPtXWyF0otJeJjtoftZMjNykNXqjoGQ6i3WlHkjrdCvTplgyrg?=
 =?us-ascii?Q?3ryJ2iVxzTFBwDKoH22CPj99iSJeEWuy6p2t4pCnaMY2qEHXMYnMfJfXnfcK?=
 =?us-ascii?Q?O/ajJ9GFqsKJEHyGBjTmHfKfgU3UGl2TKQIVQz44s3c8LN30GAG9CdKxZmV5?=
 =?us-ascii?Q?TOcOuAAlQvDzcc7MoUe4mj9BYs5LeNUqDiNq//1O5C3R6UUX7MER5fxviIPK?=
 =?us-ascii?Q?jwgfNsbW9C0HKow6sCud0FhUImqZvi/j6WTJA7TCgjG7ECQYAR68fryv0iFU?=
 =?us-ascii?Q?YTYyLM/TDxMm2+sOKsaMBKCkK1RlKNhkdET2h/uzLOHdZggqcjhZZZpni+Y8?=
 =?us-ascii?Q?cSCnS/wD5SnH7BSjamCaRqPKejL1sSI=3D?=
X-Exchange-RoutingPolicyChecked: ierLfq7sa/NkO7r/wKWlPhDmNpqSwJRX30f0cZWxIpP4817timv4ewFFAsw81KDQHi+U9c9p9QMq/XGrjUY7U21wvi3pIIPdhY4YW587/yjTI5oLniyoNzgdPBel6F9Y4CG5t5Q9WiCbtw2zUM2NQuO/ZNtlJehfFSwPhMIcrXkAXCYkTTU6IiJDGv7dQYopGqW9erLeKeuDSPFF9Sc9BDZFRRo/rYGxkwEM03PXTiZvcB558UlQKvvh5mVtvwuzxNenF68894H5NCLDO0P6DtUlUwQIclHgEJxSfwfVsNKIjDw0drO9GvIgNEUBcFSTGrr6MOqoATfKTTqe1rzVZw==
X-MS-Exchange-CrossTenant-Network-Message-Id: e8abd9fe-fdff-4863-0c89-08dee7dbf7ab
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB6909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jul 2026 10:28:27.5297 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qJvt/KlEYXHfTukzN1pKIurC/s23fPaODOCtPVxQrXFhiELl4F0rUpqOMw7MBL42fj3TIOmSG/7ycPly4Ac4qfk2BiY+Ai44Xnz3XAvhBWU=
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

Most i915 core files still carry the full, verbatim MIT license
boilerplate instead of the much shorter SPDX-License-Identifier
tag. This series replaces that boilerplate with the appropriate
SPDX tag across the i915 core (drivers/gpu/drm/i915/*.c, *.h),
while preserving each file's existing copyright and authorship
notices.

Sebastian Brzezinka (6):
  drm/i915: Convert driver init/PCI/params license headers to SPDX
  drm/i915: Convert GEM/VMA core license headers to SPDX
  drm/i915: Convert request/sync core license headers to SPDX
  drm/i915: Convert IRQ/uncore/power license headers to SPDX
  drm/i915: Convert debugfs/error/cmd-parser license headers to SPDX
  drm/i915: Convert GVT/vgpu/perf/device-info license headers to SPDX

 drivers/gpu/drm/i915/i915_cmd_parser.c    | 21 +-----------------
 drivers/gpu/drm/i915/i915_debugfs.c       | 21 +-----------------
 drivers/gpu/drm/i915/i915_driver.c        | 25 ++--------------------
 drivers/gpu/drm/i915/i915_drv.h           | 25 ++--------------------
 drivers/gpu/drm/i915/i915_gem.c           | 21 +-----------------
 drivers/gpu/drm/i915/i915_gem.h           | 21 +-----------------
 drivers/gpu/drm/i915/i915_gem_evict.c     | 21 +-----------------
 drivers/gpu/drm/i915/i915_gpu_error.c     | 21 +-----------------
 drivers/gpu/drm/i915/i915_ioc32.c         | 21 ++----------------
 drivers/gpu/drm/i915/i915_irq.c           | 26 +++--------------------
 drivers/gpu/drm/i915/i915_memcpy.c        | 21 +-----------------
 drivers/gpu/drm/i915/i915_mm.c            | 21 +-----------------
 drivers/gpu/drm/i915/i915_params.c        | 21 +-----------------
 drivers/gpu/drm/i915/i915_params.h        | 21 +-----------------
 drivers/gpu/drm/i915/i915_pci.c           | 21 +-----------------
 drivers/gpu/drm/i915/i915_perf.c          | 21 +-----------------
 drivers/gpu/drm/i915/i915_pvinfo.h        | 20 +----------------
 drivers/gpu/drm/i915/i915_reg.h           | 24 +++------------------
 drivers/gpu/drm/i915/i915_request.c       | 21 +-----------------
 drivers/gpu/drm/i915/i915_request.h       | 21 +-----------------
 drivers/gpu/drm/i915/i915_selftest.h      | 20 +----------------
 drivers/gpu/drm/i915/i915_syncmap.c       | 21 +-----------------
 drivers/gpu/drm/i915/i915_syncmap.h       | 21 +-----------------
 drivers/gpu/drm/i915/i915_sysfs.c         | 21 +-----------------
 drivers/gpu/drm/i915/i915_utils.h         | 21 +-----------------
 drivers/gpu/drm/i915/i915_vgpu.c          | 20 +----------------
 drivers/gpu/drm/i915/i915_vgpu.h          | 20 +----------------
 drivers/gpu/drm/i915/i915_vma.c           | 21 +-----------------
 drivers/gpu/drm/i915/i915_vma.h           | 21 +-----------------
 drivers/gpu/drm/i915/intel_clock_gating.c | 21 +-----------------
 drivers/gpu/drm/i915/intel_device_info.c  | 21 +-----------------
 drivers/gpu/drm/i915/intel_device_info.h  | 21 +-----------------
 drivers/gpu/drm/i915/intel_gvt.c          | 20 +----------------
 drivers/gpu/drm/i915/intel_gvt.h          | 20 +----------------
 drivers/gpu/drm/i915/intel_runtime_pm.c   | 21 +-----------------
 drivers/gpu/drm/i915/intel_uncore.c       | 20 +----------------
 drivers/gpu/drm/i915/intel_uncore.h       | 21 +-----------------
 37 files changed, 44 insertions(+), 742 deletions(-)

-- 
2.53.0

