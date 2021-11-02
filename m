Return-Path: <SRS0=WhEZ=PV=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7CAF7C433F5
	for <intel-gfx@archiver.kernel.org>; Tue,  2 Nov 2021 07:27:38 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4F39C60F58
	for <intel-gfx@archiver.kernel.org>; Tue,  2 Nov 2021 07:27:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 4F39C60F58
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 459776FBE9;
	Tue,  2 Nov 2021 07:27:37 +0000 (UTC)
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 22F386FBE8
 for <intel-gfx@lists.freedesktop.org>; Tue,  2 Nov 2021 07:27:36 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10155"; a="211959386"
X-IronPort-AV: E=Sophos;i="5.87,202,1631602800"; d="scan'208";a="211959386"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Nov 2021 00:27:05 -0700
X-IronPort-AV: E=Sophos;i="5.87,202,1631602800"; d="scan'208";a="667009120"
Received: from psverdru-mobl.amr.corp.intel.com (HELO ldmartin-desk2)
 ([10.251.133.36])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Nov 2021 00:27:02 -0700
Date: Tue, 2 Nov 2021 00:27:00 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: =?utf-8?B?Sm9zw6k=?= Roberto de Souza <jose.souza@intel.com>
Message-ID: <20211102072700.ked3qhnyldx4rgba@ldmartin-desk2>
References: <20211020002353.193893-1-jose.souza@intel.com>
 <20211020002353.193893-3-jose.souza@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20211020002353.193893-3-jose.souza@intel.com>
Subject: Re: [Intel-gfx] [PATCH 3/3] drm/i915: Rename GT_STEP to
 GRAPHICS_STEP
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
Cc: intel-gfx@lists.freedesktop.org
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

On Tue, Oct 19, 2021 at 05:23:53PM -0700, Jose Souza wrote:
>As now graphics and media can have different steppings this patch is
>renaming all _GT_STEP macros to _GRAPHICS_STEP.
>
>Future platforms will properly choose between _MEDIA_STEP and
>_GRAPHICS_STEP for each new workaround.
>
>Cc: Matt Atwood <matthew.s.atwood@intel.com>
>Cc: Radhakrishna Sripada <radhakrishna.sripada@intel.com>
>Signed-off-by: José Roberto de Souza <jose.souza@intel.com>


Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>


Lucas De Marchi
