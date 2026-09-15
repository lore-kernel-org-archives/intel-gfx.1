Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F3C8C88E75
	for <intel-gfx@archiver.kernel.org>; Tue, 15 Sep 2026 08:53:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E45CE10FAF6;
	Tue, 15 Sep 2026 08:53:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fvF83l5M";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CB41C10FAF6;
 Tue, 15 Sep 2026 08:53:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1789462427; x=1820998427;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=HF9T3z+4BS2w/YNaKaMR44jXn8ShV9WXkRB7q/M/E7I=;
 b=fvF83l5MDJBPUEYNmRMbmfnE74q181P3smmlAFoQTljXyvUz6P72zBYS
 /jKoepG7bk/sGa0CyalzebRYmSxJ6qHh6wMKLhL1SuaK/MGa3lG18rRdp
 c5jInTBjhl2WMz6AJ3kBTOFXorG4pXMq4/w+itdheUrKZKB0xJhfkC9ke
 7uEF6AZWiAlJFHKcgJ9FlHLGs8u9/JlQK8RY3mZjieEZt7BrVC7RLE4sM
 ttddtlcypdhr5CBtcBMjd+VHwbGC1CkuHdeK8H46KPNgCLGFEhWl8EB7m
 s4Up2adNHJ9FBC3FXUOO80hB1LBgeKOPAGgjk6fHgCgEqTZ39h37XI7Co Q==;
X-CSE-ConnectionGUID: CggLIvT/QByQAQdBVQ93AA==
X-CSE-MsgGUID: xF0VLJDgQNaIDe/zqQkMTw==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="115355169"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; d="scan'208";a="115355169"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Sep 2026 01:53:47 -0700
X-CSE-ConnectionGUID: kuU4+FbEQ8u4ZtvB0waY/g==
X-CSE-MsgGUID: KdkA236dQSO6KAj4UQr3NQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; d="scan'208";a="278180655"
Received: from abityuts-desk1.ger.corp.intel.com (HELO localhost)
 ([10.245.245.243])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Sep 2026 01:53:45 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: "Gao, Fred" <fred.gao@intel.com>, "intel-gfx@lists.freedesktop.org"
 <intel-gfx@lists.freedesktop.org>, "I915-ci-infra@lists.freedesktop.org"
 <I915-ci-infra@lists.freedesktop.org>
Cc: "Wang, Chenchen" <chenchen.wang@intel.com>
Subject: RE: =?utf-8?Q?=E2=9C=97?= i915.CI.BAT: failure for drm/i915/panel:
 Only consider seamless DRRS modes as the highest mode
In-Reply-To: <PH7PR11MB7643C825B918DABFBA9F69979DBA2@PH7PR11MB7643.namprd11.prod.outlook.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <20260914085525.2669889-1-fred.gao@intel.com>
 <178939899718.159168.66979253943613325@61270ab9df2a>
 <PH7PR11MB7643C825B918DABFBA9F69979DBA2@PH7PR11MB7643.namprd11.prod.outlook.com>
Date: Tue, 15 Sep 2026 11:53:43 +0300
Message-ID: <61870fda5e45d89f46f0cfb41fce1ebdc96f7865@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
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

On Tue, 15 Sep 2026, "Gao, Fred" <fred.gao@intel.com> wrote:
> Hi I915 CI infra team,
>    The below 2 issues are not related to my display patch, pls double check

Please use plain text and proper quoting when interacting on the public
mailing list.

BR,
Jani.


-- 
Jani Nikula, Intel
