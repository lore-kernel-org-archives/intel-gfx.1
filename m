Return-Path: <SRS0=h8SK=PP=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6FA99C433EF
	for <intel-gfx@archiver.kernel.org>; Wed, 27 Oct 2021 11:24:10 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 327096109E
	for <intel-gfx@archiver.kernel.org>; Wed, 27 Oct 2021 11:24:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 327096109E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7388B6E888;
	Wed, 27 Oct 2021 11:24:04 +0000 (UTC)
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E61836E888;
 Wed, 27 Oct 2021 11:24:02 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10149"; a="217309691"
X-IronPort-AV: E=Sophos;i="5.87,186,1631602800"; d="scan'208";a="217309691"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Oct 2021 04:24:02 -0700
X-IronPort-AV: E=Sophos;i="5.87,186,1631602800"; d="scan'208";a="529591431"
Received: from djustese-mobl.ger.corp.intel.com (HELO [10.249.254.205])
 ([10.249.254.205])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Oct 2021 04:24:00 -0700
Message-ID: <d74d99c9-3733-1dbe-53dd-60a599bf1a42@linux.intel.com>
Date: Wed, 27 Oct 2021 13:23:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Content-Language: en-US
To: Matthew Auld <matthew.auld@intel.com>, intel-gfx@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org
References: <20211021114410.2437099-1-matthew.auld@intel.com>
 <20211021114410.2437099-2-matthew.auld@intel.com>
From: =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>
In-Reply-To: <20211021114410.2437099-2-matthew.auld@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Subject: Re: [Intel-gfx] [PATCH 2/4] drm/i915/clflush: disallow on discrete
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


On 10/21/21 13:44, Matthew Auld wrote:
> We seem to have an unfortunate issue where we arrive from:
>
>      i915_gem_object_flush_if_display+0x86/0xd0 [i915]
>      intel_user_framebuffer_dirty+0x1a/0x50 [i915]
>      drm_mode_dirtyfb_ioctl+0xfb/0x1b0
>
> Which can be before the pages are populated(and pinned for display), and
> so i915_gem_object_has_struct_page() might still return true, as per the
> ttm backend. We could re-order the later get_pages() call here, but
> since on discrete everything should already be coherent, with the
> exception of the display engine, and even there display surfaces must be
> allocated in device local-memory anyway, so there should in theory be no
> conceivable reason to ever call i915_gem_clflush_object() on discrete.
>
> References: https://gitlab.freedesktop.org/drm/intel/-/issues/4320
> Signed-off-by: Matthew Auld <matthew.auld@intel.com>
> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>

Reviewed-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>


