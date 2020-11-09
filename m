Return-Path: <SRS0=npFd=EP=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E450DC56201
	for <intel-gfx@archiver.kernel.org>; Mon,  9 Nov 2020 13:41:13 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8AD09206B2
	for <intel-gfx@archiver.kernel.org>; Mon,  9 Nov 2020 13:41:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8AD09206B2
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DE7938997C;
	Mon,  9 Nov 2020 13:41:12 +0000 (UTC)
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 23C388997C
 for <intel-gfx@lists.freedesktop.org>; Mon,  9 Nov 2020 13:41:12 +0000 (UTC)
IronPort-SDR: JpC2AD9ThtkgFFIqrXRSSqj324mhycG76CV8WhDUSBw8ZVmA4g3zo8pYMKtcvzOttp1DToHSlU
 tkUoTbI6E0mw==
X-IronPort-AV: E=McAfee;i="6000,8403,9799"; a="167214377"
X-IronPort-AV: E=Sophos;i="5.77,463,1596524400"; d="scan'208";a="167214377"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Nov 2020 05:41:11 -0800
IronPort-SDR: IswYyqL7gb1iL9dTt+QoS3xwBMADTVjYofHou5UZ21lQ6pgrLByuEf/vEHYWWFl+WN4UmWBq6B
 3Bql7tjyzL6g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,463,1596524400"; d="scan'208";a="359651434"
Received: from orsmsx604.amr.corp.intel.com ([10.22.229.17])
 by fmsmga002.fm.intel.com with ESMTP; 09 Nov 2020 05:41:11 -0800
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX604.amr.corp.intel.com (10.22.229.17) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Mon, 9 Nov 2020 05:41:11 -0800
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Mon, 9 Nov 2020 05:41:10 -0800
Received: from orsmsx611.amr.corp.intel.com ([10.22.229.24]) by
 ORSMSX611.amr.corp.intel.com ([10.22.229.24]) with mapi id 15.01.1713.004;
 Mon, 9 Nov 2020 05:41:10 -0800
From: "Ruhl, Michael J" <michael.j.ruhl@intel.com>
To: Chris Wilson <chris@chris-wilson.co.uk>, "intel-gfx@lists.freedesktop.org"
 <intel-gfx@lists.freedesktop.org>
Thread-Topic: [Intel-gfx] [CI 2/2] drm/i915/gem: Pull phys pread/pwrite
 implementations to the backend
Thread-Index: AQHWs4tLtM8Gll4VTUmNsMgJ3Z/WPKm/1Hmw
Date: Mon, 9 Nov 2020 13:41:10 +0000
Message-ID: <0543be4585504a51bd99e022b5575685@intel.com>
References: <20201105154934.16022-1-chris@chris-wilson.co.uk>
 <20201105154934.16022-2-chris@chris-wilson.co.uk>
In-Reply-To: <20201105154934.16022-2-chris@chris-wilson.co.uk>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-product: dlpe-windows
dlp-reaction: no-action
dlp-version: 11.5.1.3
x-originating-ip: [10.1.200.100]
MIME-Version: 1.0
Subject: Re: [Intel-gfx] [CI 2/2] drm/i915/gem: Pull phys pread/pwrite
 implementations to the backend
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

>-----Original Message-----
>From: Intel-gfx <intel-gfx-bounces@lists.freedesktop.org> On Behalf Of Chris
>Wilson
>Sent: Thursday, November 5, 2020 10:50 AM
>To: intel-gfx@lists.freedesktop.org
>Subject: [Intel-gfx] [CI 2/2] drm/i915/gem: Pull phys pread/pwrite
>implementations to the backend
>
>Move the specialised interactions with the physical GEM object from the
>pread/pwrite ioctl handler into the phys backend.
>
>Signed-off-by: Chris Wilson <chris@chris-wilson.co.uk>
>Reviewed-by: Matthew Auld <matthew.auld@intel.com>
>---
> drivers/gpu/drm/i915/gem/i915_gem_phys.c | 55
>++++++++++++++++++++++++
> drivers/gpu/drm/i915/i915_gem.c          | 26 -----------
> 2 files changed, 55 insertions(+), 26 deletions(-)
>
>diff --git a/drivers/gpu/drm/i915/gem/i915_gem_phys.c
>b/drivers/gpu/drm/i915/gem/i915_gem_phys.c
>index 28147aab47b9..3a4dfe2ef1da 100644
>--- a/drivers/gpu/drm/i915/gem/i915_gem_phys.c
>+++ b/drivers/gpu/drm/i915/gem/i915_gem_phys.c
>@@ -134,6 +134,58 @@ i915_gem_object_put_pages_phys(struct
>drm_i915_gem_object *obj,
> 			  vaddr, dma);
> }
>
>+static int
>+phys_pwrite(struct drm_i915_gem_object *obj,
>+	    const struct drm_i915_gem_pwrite *args)
>+{
>+	void *vaddr = sg_page(obj->mm.pages->sgl) + args->offset;
>+	char __user *user_data = u64_to_user_ptr(args->data_ptr);
>+	int err;
>+
>+	err = i915_gem_object_wait(obj,
>+				   I915_WAIT_INTERRUPTIBLE |
>+				   I915_WAIT_ALL,
>+				   MAX_SCHEDULE_TIMEOUT);
>+	if (err)
>+		return err;
>+
>+	/*
>+	 * We manually control the domain here and pretend that it
>+	 * remains coherent i.e. in the GTT domain, like shmem_pwrite.
>+	 */
>+	i915_gem_object_invalidate_frontbuffer(obj, ORIGIN_CPU);
>+
>+	if (copy_from_user(vaddr, user_data, args->size))
>+		return -EFAULT;
>+
>+	drm_clflush_virt_range(vaddr, args->size);
>+	intel_gt_chipset_flush(&to_i915(obj->base.dev)->gt);
>+
>+	i915_gem_object_flush_frontbuffer(obj, ORIGIN_CPU);
>+	return 0;

So the original code path (through pwrite_ioctl()) includes a pin/unpin.

That doesn't need to be done here?

Thanks,

Mike


>+}
>+
>+static int
>+phys_pread(struct drm_i915_gem_object *obj,
>+	   const struct drm_i915_gem_pread *args)
>+{
>+	void *vaddr = sg_page(obj->mm.pages->sgl) + args->offset;
>+	char __user *user_data = u64_to_user_ptr(args->data_ptr);
>+	int err;
>+
>+	err = i915_gem_object_wait(obj,
>+				   I915_WAIT_INTERRUPTIBLE,
>+				   MAX_SCHEDULE_TIMEOUT);
>+	if (err)
>+		return err;
>+
>+	drm_clflush_virt_range(vaddr, args->size);
>+	if (copy_to_user(user_data, vaddr, args->size))
>+		return -EFAULT;
>+
>+	return 0;
>+}
>+
> static void phys_release(struct drm_i915_gem_object *obj)
> {
> 	fput(obj->base.filp);
>@@ -144,6 +196,9 @@ static const struct drm_i915_gem_object_ops
>i915_gem_phys_ops = {
> 	.get_pages = i915_gem_object_get_pages_phys,
> 	.put_pages = i915_gem_object_put_pages_phys,
>
>+	.pread  = phys_pread,
>+	.pwrite = phys_pwrite,
>+
> 	.release = phys_release,
> };
>
>diff --git a/drivers/gpu/drm/i915/i915_gem.c
>b/drivers/gpu/drm/i915/i915_gem.c
>index d58fe1ddc3e1..58276694c848 100644
>--- a/drivers/gpu/drm/i915/i915_gem.c
>+++ b/drivers/gpu/drm/i915/i915_gem.c
>@@ -179,30 +179,6 @@ int i915_gem_object_unbind(struct
>drm_i915_gem_object *obj,
> 	return ret;
> }
>
>-static int
>-i915_gem_phys_pwrite(struct drm_i915_gem_object *obj,
>-		     struct drm_i915_gem_pwrite *args,
>-		     struct drm_file *file)
>-{
>-	void *vaddr = sg_page(obj->mm.pages->sgl) + args->offset;
>-	char __user *user_data = u64_to_user_ptr(args->data_ptr);
>-
>-	/*
>-	 * We manually control the domain here and pretend that it
>-	 * remains coherent i.e. in the GTT domain, like shmem_pwrite.
>-	 */
>-	i915_gem_object_invalidate_frontbuffer(obj, ORIGIN_CPU);
>-
>-	if (copy_from_user(vaddr, user_data, args->size))
>-		return -EFAULT;
>-
>-	drm_clflush_virt_range(vaddr, args->size);
>-	intel_gt_chipset_flush(&to_i915(obj->base.dev)->gt);
>-
>-	i915_gem_object_flush_frontbuffer(obj, ORIGIN_CPU);
>-	return 0;
>-}
>-
> static int
> i915_gem_create(struct drm_file *file,
> 		struct intel_memory_region *mr,
>@@ -872,8 +848,6 @@ i915_gem_pwrite_ioctl(struct drm_device *dev, void
>*data,
> 	if (ret == -EFAULT || ret == -ENOSPC) {
> 		if (i915_gem_object_has_struct_page(obj))
> 			ret = i915_gem_shmem_pwrite(obj, args);
>-		else
>-			ret = i915_gem_phys_pwrite(obj, args, file);
> 	}
>
> 	i915_gem_object_unpin_pages(obj);
>--
>2.20.1
>
>_______________________________________________
>Intel-gfx mailing list
>Intel-gfx@lists.freedesktop.org
>https://lists.freedesktop.org/mailman/listinfo/intel-gfx
_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
