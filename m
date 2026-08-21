Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EDC5AC5DF87
	for <intel-gfx@archiver.kernel.org>; Fri, 21 Aug 2026 09:50:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5F4AF10F2AA;
	Fri, 21 Aug 2026 09:50:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FBQTVUtP";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B2E9E10F2AA
 for <intel-gfx@lists.freedesktop.org>; Fri, 21 Aug 2026 09:50:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1787305813; x=1818841813;
 h=message-id:subject:from:to:cc:date:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=SR4DWJiqGghBFTzS3KA9iUFdXu7xAoAxfyqQ3MDAWcc=;
 b=FBQTVUtPl0P83IluAf/I06E8aHNFN2CmiSLyFVXroGvOZlG3x5aJRowI
 ENWVXbrnWkZmCUwenmRhs6PsSQKLIlBwnra6z6mTi4TkJl6yTDyxCCK79
 1kkCvB4KQg2cz0E7RQPZRJ1qV5PSAEL0qpqHqapnUxiRRe6KJ93wChkfT
 7UvdLFIzMhvInHBTqgEGCeF94Z6v3RkYfBYrRtNEarGVoQAEljRaJIawY
 1eUZ99r+lhHhorOy0OglevLDUHBoeP4AmgBHR3lmKFmd3QTjMioBQ3C6Y
 zih3uTZkzQ3Fv6fBAVy5oaa0mje82FXDqkVLmzk8Bc98yuWb5pOgc2f3P w==;
X-CSE-ConnectionGUID: KKvht5PaQKen/y87lUucAw==
X-CSE-MsgGUID: 8mM5W4vkQ7KQlQsLJCgYlg==
X-IronPort-AV: E=McAfee;i="6800,10657,11881"; a="98447516"
X-IronPort-AV: E=Sophos;i="6.25,234,1779174000"; d="scan'208";a="98447516"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Aug 2026 02:50:12 -0700
X-CSE-ConnectionGUID: 1PROpwKxT+SxKbHirQrlqA==
X-CSE-MsgGUID: oIdSvDRGRhSh7sfO/n/mKQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,234,1779174000"; d="scan'208";a="263643428"
Received: from jkrzyszt-mobl2.ger.corp.intel.com ([10.245.246.165])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Aug 2026 02:50:09 -0700
Message-ID: <4bd61f0e5667100e9773e06c8cefe25a9f9c00ad.camel@linux.intel.com>
Subject: Re: [PATCH] PCI: Disable not supported reset methods on DG1 0x4905
From: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
To: Andi Shyti <andi.shyti@kernel.org>
Cc: Bjorn Helgaas <bhelgaas@google.com>, linux-pci@vger.kernel.org, 
 intel-gfx@lists.freedesktop.org, Joonas Lahtinen	
 <joonas.lahtinen@linux.intel.com>, Andi Shyti <andi.shyti@linux.intel.com>,
 Krzysztof Karas <krzysztof.karas@intel.com>, Sebastian Brzezinka
 <sebastian.brzezinka@intel.com>, Krzysztof Niemiec
 <krzysztof.niemiec@intel.com>, linux-kernel@vger.kernel.org
Date: Fri, 21 Aug 2026 11:50:07 +0200
In-Reply-To: <aogQ4fNchLVm9Pbg@zenone.zhora.eu>
References: <20260819102509.1662504-2-janusz.krzysztofik@linux.intel.com>
 <aogQ4fNchLVm9Pbg@zenone.zhora.eu>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173,
 80-298 Gdansk - KRS 101882 - NIP 957-07-52-316
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.60.2 
MIME-Version: 1.0
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

Hi Andi,

On Fri, 2026-08-21 at 10:51 +0200, Andi Shyti wrote:
> Hi Janusz,
>=20
> On Wed, Aug 19, 2026 at 12:24:53PM +0200, Janusz Krzysztofik wrote:
> > DRM CI consequently reports failing device reset attempts on Intel DG1
>=20
> do you mean "consistently reports"?

Yeah, consistently is the right word.

@Bjorn: should I submit v2, or can you handle that correction?

Thanks,
Janusz

>=20
> > discrete graphics adapters.  Manual reproduction attempts allowed to
> > narrow down the scope of that problem to a specific revision of that
> > hardware, SKU 8086:4905.  It has been confirmed that both reset methods
> > claimed by the device, i.e., flr and bus, suffer from that issue.
> >=20
> > Since consecutively failing device resets may lead to system hangs,
> > disable both useless reset methods.  A respective CI test will then be
> > skipped instead of aborting whole CI jobs.
> >=20
> > Closes: https://gitlab.freedesktop.org/drm/i915/kernel/-/work_items/118=
14
> > Signed-off-by: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
>=20
> Reviewed-by: Andi Shyti <andi.shyti@linux.intel.com>
>=20
> Thanks,
> Andi
