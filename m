Return-Path: <SRS0=u2GV=OE=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C460FC433F5
	for <intel-gfx@archiver.kernel.org>; Tue, 14 Sep 2021 17:10:26 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 80DBC6113B
	for <intel-gfx@archiver.kernel.org>; Tue, 14 Sep 2021 17:10:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 80DBC6113B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F3FE689E08;
	Tue, 14 Sep 2021 17:10:25 +0000 (UTC)
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0BC7C89E08;
 Tue, 14 Sep 2021 17:10:24 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10107"; a="307625776"
X-IronPort-AV: E=Sophos;i="5.85,292,1624345200"; d="scan'208";a="307625776"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Sep 2021 10:10:22 -0700
X-IronPort-AV: E=Sophos;i="5.85,292,1624345200"; d="scan'208";a="544188720"
Received: from lveltman-mobl.ger.corp.intel.com (HELO localhost)
 ([10.251.216.6])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Sep 2021 10:10:17 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Nathan Chancellor <nathan@kernel.org>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Jason Ekstrand <jason@jlekstrand.net>, Thomas =?utf-8?Q?Hellstr=C3=B6m?=
 <thomas.hellstrom@linux.intel.com>, Matthew Auld <matthew.auld@intel.com>,
 "Michael J. Ruhl" <michael.j.ruhl@intel.com>, Nick Desaulniers
 <ndesaulniers@google.com>, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 clang-built-linux@googlegroups.com, llvm@lists.linux.dev
In-Reply-To: <YT+QmKyKCdotTcqA@archlinux-ax161>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20210824225427.2065517-1-nathan@kernel.org>
 <YT+QmKyKCdotTcqA@archlinux-ax161>
Date: Tue, 14 Sep 2021 20:10:14 +0300
Message-ID: <87wnnj13t5.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
Subject: Re: [Intel-gfx] [PATCH 0/3] drm/i915: Enable
 -Wsometimes-uninitialized
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

On Mon, 13 Sep 2021, Nathan Chancellor <nathan@kernel.org> wrote:
> On Tue, Aug 24, 2021 at 03:54:24PM -0700, Nathan Chancellor wrote:
>> Commit 46e2068081e9 ("drm/i915: Disable some extra clang warnings")
>> disabled -Wsometimes-uninitialized as noisy but there have been a few
>> fixes to clang that make the false positive rate fairly low so it should
>> be enabled to help catch obvious mistakes. The first two patches fix
>> revent instances of this warning then enables it for i915 like the rest
>> of the tree.
>> 
>> Cheers,
>> Nathan
>> 
>> Nathan Chancellor (3):
>>   drm/i915/selftests: Do not use import_obj uninitialized
>>   drm/i915/selftests: Always initialize err in
>>     igt_dmabuf_import_same_driver_lmem()
>>   drm/i915: Enable -Wsometimes-uninitialized
>> 
>>  drivers/gpu/drm/i915/Makefile                        | 1 -
>>  drivers/gpu/drm/i915/gem/selftests/i915_gem_dmabuf.c | 7 ++++---
>>  2 files changed, 4 insertions(+), 4 deletions(-)
>> 
>> 
>> base-commit: fb43ebc83e069625cfeeb2490efc3ffa0013bfa4
>> -- 
>> 2.33.0
>> 
>> 
>
> Ping, could this be picked up for an -rc as these are very clearly bugs?

Thanks for the patches and review. Pushed to drm-intel-gt-next and
cherry-picked to drm-intel-fixes, header to -rc2.

BR,
Jani.


-- 
Jani Nikula, Intel Open Source Graphics Center
