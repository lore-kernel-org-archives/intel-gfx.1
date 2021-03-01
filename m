Return-Path: <SRS0=Mptj=H7=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 52030C433E0
	for <intel-gfx@archiver.kernel.org>; Mon,  1 Mar 2021 12:33:39 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DD02E64E31
	for <intel-gfx@archiver.kernel.org>; Mon,  1 Mar 2021 12:33:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DD02E64E31
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 61E996E038;
	Mon,  1 Mar 2021 12:33:38 +0000 (UTC)
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C1A946E038
 for <intel-gfx@lists.freedesktop.org>; Mon,  1 Mar 2021 12:33:36 +0000 (UTC)
IronPort-SDR: bEo9inIKDKqUtnYHDf/3p/7M0GxtMKu/S3NXDpXBI9t7FoLhs/t7yXyhgAj76X3YDcqQVhjyvv
 zQghaqiYnrpw==
X-IronPort-AV: E=McAfee;i="6000,8403,9909"; a="186561151"
X-IronPort-AV: E=Sophos;i="5.81,215,1610438400"; d="scan'208";a="186561151"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Mar 2021 04:33:35 -0800
IronPort-SDR: zppyfdXU5QvJl1RJocMEzyXKeStU7c36DtaZ7JYbXq0FqPYgFRBWiBhsmQ4p92q35z+jSxNMvr
 7WMXiULCDUtQ==
X-IronPort-AV: E=Sophos;i="5.81,215,1610438400"; d="scan'208";a="406204935"
Received: from dumser-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.252.43.117])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Mar 2021 04:33:31 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: "Winkler\, Tomas" <tomas.winkler@intel.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>,
 Vignesh Raghavendra <vigneshr@ti.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, "Vivi\,
 Rodrigo" <rodrigo.vivi@intel.com>
In-Reply-To: <c430158c27c5460ba13a989c6f9646d7@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20210216181925.650082-1-tomas.winkler@intel.com>
 <878s7narev.fsf@intel.com> <c430158c27c5460ba13a989c6f9646d7@intel.com>
Date: Mon, 01 Mar 2021 14:33:29 +0200
Message-ID: <875z2bdpeu.fsf@intel.com>
MIME-Version: 1.0
Subject: Re: [Intel-gfx] [RFC PATCH 0/9] drm/i915/spi: discrete graphics
 internal spi
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
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>, "Usyskin,
 Alexander" <alexander.usyskin@intel.com>, "Lubart,
 Vitaly" <vitaly.lubart@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

On Wed, 17 Feb 2021, "Winkler, Tomas" <tomas.winkler@intel.com> wrote:
>> 
>> On Tue, 16 Feb 2021, Tomas Winkler <tomas.winkler@intel.com> wrote:
>> > Intel discrete graphic devices have internal spi storage, that holds
>> > firmware and oprom images. The spi device is exposed to the user space
>> > via mtd framework to be accessed during manufacturing.
>> > The device is hardware locked after manufacturing and only read access
>> > is provided.
>> >
>> > The i915 plays role of a multi function device (mfd) and spi device is
>> > exposed as its child device. i915_spi platform driver binds to this
>> > device.
>> >
>> > Because the graphic card may undergo reset at any time and basically
>> > hot unplug all its child devices, this series also provides a fix to
>> > the mtd framework to make the reset graceful.
>> >
>> > Tomas Winkler (9):
>> >   drm/i915/spi: add spi device for discrete graphics
>> >   drm/i915/spi: intel_spi_region map
>> >   drm/i915/spi: add driver for on-die spi device
>> >   drm/i915/spi: implement region enumeration
>> >   drm/i915/spi: implement spi access functions
>> >   drm/i915/spi: spi register with mtd
>> >   drm/i915/spi: mtd: implement access handlers
>> >   drm/i915/spi: serialize spi access
>> >   mtd: use refcount to prevent corruption
>> >
>> >  drivers/gpu/drm/i915/Kconfig             |   3 +
>> >  drivers/gpu/drm/i915/Makefile            |   6 +
>> >  drivers/gpu/drm/i915/i915_drv.c          |   9 +
>> >  drivers/gpu/drm/i915/i915_drv.h          |   4 +
>> >  drivers/gpu/drm/i915/i915_reg.h          |   1 +
>> >  drivers/gpu/drm/i915/spi/intel_spi.c     |  62 +++
>> >  drivers/gpu/drm/i915/spi/intel_spi.h     |  24 +
>> 
>> I'm open to discussion, but after glancing through the series I've got a gut
>> feeling spi/ subdir should be purely about the separate module, and the
>> above two files should be in i915/ directory instead.
>
> Maybe, I don't have strong feelings about that, it is just a decision from which point you want to look at that.

*shrug*

No strong feelings either, and I don't think the decision is carved in
stone. We can move them around later if we want.

Up to you.

BR,
Jani.


>> 
>> As it is, I think it's a bit confusing that spi/ is both about the spi kernel module
>> and a singly .c file that's really part of i915.ko. Perhaps that messes up the
>> conventional descending to subdirs in the kernel build too?
>
> The intention was to make this capsulated from the file system point of view. 
> In general the spi driver could be somewhere in mtd directory, but it doesn't really fit exactly there either.
> I don't have a strong opinion about that, if you do I yield. 
>
>
> Thanks
> Tomas
>

-- 
Jani Nikula, Intel Open Source Graphics Center
_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
