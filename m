Return-Path: <SRS0=0ugA=J2=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 03275C433B4
	for <intel-gfx@archiver.kernel.org>; Thu, 29 Apr 2021 16:03:51 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9F76E613EE
	for <intel-gfx@archiver.kernel.org>; Thu, 29 Apr 2021 16:03:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9F76E613EE
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 08FE56F3A1;
	Thu, 29 Apr 2021 16:03:50 +0000 (UTC)
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 05C176F389;
 Thu, 29 Apr 2021 16:03:47 +0000 (UTC)
IronPort-SDR: tL8KcpbMqLCFWEn9YQnggKDC0Pqnk05yAdBhyvlgKvPA19Lvwm2tmWnFyCKOXu3Y/p1LHzkM0J
 ruCUp2qYb1lA==
X-IronPort-AV: E=McAfee;i="6200,9189,9969"; a="197085910"
X-IronPort-AV: E=Sophos;i="5.82,259,1613462400"; d="scan'208";a="197085910"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Apr 2021 09:03:47 -0700
IronPort-SDR: y8XVbx/ihyo+qfrJtWIA9to3H9luoKwFNojvlVHbtNO3lBS3KitNnAneKk4BcamwUtdUSfx2gV
 BA9JR9JM8irg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.82,259,1613462400"; d="scan'208";a="386995075"
Received: from orsmsx606.amr.corp.intel.com ([10.22.229.19])
 by orsmga003.jf.intel.com with ESMTP; 29 Apr 2021 09:03:47 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX606.amr.corp.intel.com (10.22.229.19) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2106.2; Thu, 29 Apr 2021 09:03:47 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2106.2; Thu, 29 Apr 2021 09:03:46 -0700
Received: from orsmsx611.amr.corp.intel.com ([10.22.229.24]) by
 ORSMSX611.amr.corp.intel.com ([10.22.229.24]) with mapi id 15.01.2106.013;
 Thu, 29 Apr 2021 09:03:46 -0700
From: "Ruhl, Michael J" <michael.j.ruhl@intel.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, "jani.nikula@linux.intel.com"
 <jani.nikula@linux.intel.com>, "joonas.lahtinen@linux.intel.com"
 <joonas.lahtinen@linux.intel.com>, "Vivi, Rodrigo" <rodrigo.vivi@intel.com>,
 "airlied@linux.ie" <airlied@linux.ie>, "daniel@ffwll.ch" <daniel@ffwll.ch>,
 "chris@chris-wilson.co.uk" <chris@chris-wilson.co.uk>
Thread-Topic: [PATCH v8 3/5] drm/i915: Remove reference to struct
 drm_device.pdev
Thread-Index: AQHXPOWTi79es347TEqKSxAvAlm8VKrLqIdQ
Date: Thu, 29 Apr 2021 16:03:46 +0000
Message-ID: <45a9a3815d094c9c83a9149fc3bea446@intel.com>
References: <20210429105101.25667-1-tzimmermann@suse.de>
 <20210429105101.25667-4-tzimmermann@suse.de>
In-Reply-To: <20210429105101.25667-4-tzimmermann@suse.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-product: dlpe-windows
dlp-reaction: no-action
dlp-version: 11.6.0.76
x-originating-ip: [10.1.200.100]
MIME-Version: 1.0
Subject: Re: [Intel-gfx] [PATCH v8 3/5] drm/i915: Remove reference to struct
 drm_device.pdev
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
Cc: "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

>-----Original Message-----
>From: dri-devel <dri-devel-bounces@lists.freedesktop.org> On Behalf Of
>Thomas Zimmermann
>Sent: Thursday, April 29, 2021 6:51 AM
>To: jani.nikula@linux.intel.com; joonas.lahtinen@linux.intel.com; Vivi, Rodrigo
><rodrigo.vivi@intel.com>; airlied@linux.ie; daniel@ffwll.ch; chris@chris-
>wilson.co.uk
>Cc: intel-gfx@lists.freedesktop.org; Thomas Zimmermann
><tzimmermann@suse.de>; dri-devel@lists.freedesktop.org
>Subject: [PATCH v8 3/5] drm/i915: Remove reference to struct
>drm_device.pdev
>
>References to struct drm_device.pdev should not be used any longer as
>the field will be moved into the struct's legacy section. Fix a rsp
>comment.
>
>v8:
>	* fix commit message (Michael)

Reviewed-by: Michael J. Ruhl <michael.j.ruhl@intel.com>

m

>Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
>---
> drivers/gpu/drm/i915/intel_runtime_pm.h | 2 +-
> 1 file changed, 1 insertion(+), 1 deletion(-)
>
>diff --git a/drivers/gpu/drm/i915/intel_runtime_pm.h
>b/drivers/gpu/drm/i915/intel_runtime_pm.h
>index 1e4ddd11c12b..183ea2b187fe 100644
>--- a/drivers/gpu/drm/i915/intel_runtime_pm.h
>+++ b/drivers/gpu/drm/i915/intel_runtime_pm.h
>@@ -49,7 +49,7 @@ enum i915_drm_suspend_mode {
>  */
> struct intel_runtime_pm {
> 	atomic_t wakeref_count;
>-	struct device *kdev; /* points to i915->drm.pdev->dev */
>+	struct device *kdev; /* points to i915->drm.dev */
> 	bool available;
> 	bool suspended;
> 	bool irqs_enabled;
>--
>2.31.1
>
>_______________________________________________
>dri-devel mailing list
>dri-devel@lists.freedesktop.org
>https://lists.freedesktop.org/mailman/listinfo/dri-devel
_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
