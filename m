Return-Path: <SRS0=zXYq=KV=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E042CC47082
	for <intel-gfx@archiver.kernel.org>; Wed, 26 May 2021 16:11:45 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 90856613DC
	for <intel-gfx@archiver.kernel.org>; Wed, 26 May 2021 16:11:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 90856613DC
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1E10D6E84F;
	Wed, 26 May 2021 16:11:44 +0000 (UTC)
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7EC0C6E84F
 for <intel-gfx@lists.freedesktop.org>; Wed, 26 May 2021 16:11:43 +0000 (UTC)
IronPort-SDR: M2I5PWVQTF9AJjtEslzxe3l8UJsQIFZ6BDAxxBiOkqdl4P2pZnCBLovJY8SdP+R/cBry1agRWe
 yEL9JEQhNcow==
X-IronPort-AV: E=McAfee;i="6200,9189,9996"; a="202514518"
X-IronPort-AV: E=Sophos;i="5.82,331,1613462400"; d="scan'208";a="202514518"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 May 2021 09:11:42 -0700
IronPort-SDR: Uu/UCyGQiG4Dhrgysc1aHu7Z4njppyis2nspSjhTuCZ19cChdC9Di0lP9FZrixFEuLnh1S7pXo
 NThrHzq+wKIg==
X-IronPort-AV: E=Sophos;i="5.82,331,1613462400"; d="scan'208";a="477005711"
Received: from astiegle-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.54.167])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 May 2021 09:11:39 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: "Modem\, Bhanuprakash" <bhanuprakash.modem@intel.com>,
 "intel-gfx\@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>, "Varide\,
 Nischal" <nischal.varide@intel.com>, "Shankar\, Uma" <uma.shankar@intel.com>,
 "Gupta\, Anshuman" <anshuman.gupta@intel.com>
In-Reply-To: <CO6PR11MB5569B1A2A203BD64EEF631318D249@CO6PR11MB5569.namprd11.prod.outlook.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20210526181728.14817-1-bhanuprakash.modem@intel.com>
 <20210526181728.14817-2-bhanuprakash.modem@intel.com>
 <87o8cxbngy.fsf@intel.com>
 <CO6PR11MB5569B1A2A203BD64EEF631318D249@CO6PR11MB5569.namprd11.prod.outlook.com>
Date: Wed, 26 May 2021 19:11:35 +0300
Message-ID: <87cztdbhl4.fsf@intel.com>
MIME-Version: 1.0
Subject: Re: [Intel-gfx] [PATCH 1/2] drm/i915/xelpd: Enabling dithering
 after the CC1
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

On Wed, 26 May 2021, "Modem, Bhanuprakash" <bhanuprakash.modem@intel.com> wrote:
>> From: Jani Nikula <jani.nikula@linux.intel.com>
>> When you're sending someone else's patches, you need to add your own
>> Signed-off-by here.
>
> Patch 2/2 in this series has a dependency on this patch. And I haven't
> made any changes in this patch, so not added my Signed-off-by :-)

Signed-off-by isn't about changes.

https://developercertificate.org/

BR,
Jani.

-- 
Jani Nikula, Intel Open Source Graphics Center
_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
