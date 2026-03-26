Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19A03106F2E1
	for <intel-gfx@archiver.kernel.org>; Thu, 26 Mar 2026 08:00:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4428910E9DD;
	Thu, 26 Mar 2026 08:00:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fiyoncna";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 089BD10E9EC
 for <intel-gfx@lists.freedesktop.org>; Thu, 26 Mar 2026 08:00:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1774512017; x=1806048017;
 h=mime-version:content-transfer-encoding:in-reply-to:
 references:subject:from:cc:to:date:message-id;
 bh=oIiLp5ZfImADkc3EC2hUzuGaLb3Er1qIa6J1NTjhOCA=;
 b=fiyoncna/s0myK0OUO0ko/R9y2lEMJy1DpewfRG2E3anrHx8XaDYbJ6L
 8lrBvgAizl+EIjOhs4DL6umm0sIuVKl8aHb+Jxl2giB8K4Y/ao2/cKGdk
 pdvE6qGTLgPzMGxWwZ6oVT2aVOUhyEkCigo95VAOGinslcQptV75hHma4
 0xaOk4LybMn6hh0B5h1wgDM+6v5DUTUmYRN27yYRJia045rgeFcIBTdec
 xGa+88sMIii5rSESi8a0lVqTw8weQfJ/Y+tsF4FQ5RyxXOSzCO6HhY/nc
 ZeRy3yjMzbjFkrG3qhQUzUIxzy/Ff5irJfTUNbwGlJKNtRxX6AQD4FoPg w==;
X-CSE-ConnectionGUID: o50ZJt89Rea4cxpnICir9Q==
X-CSE-MsgGUID: Jnk8Ww0OQxCs6IC7j1x1dQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11740"; a="75278895"
X-IronPort-AV: E=Sophos;i="6.23,141,1770624000"; d="scan'208";a="75278895"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Mar 2026 01:00:17 -0700
X-CSE-ConnectionGUID: VmsFet0NSh2IH9G4WHM6kg==
X-CSE-MsgGUID: FlEcHVVNS/u03BKdHFKmZQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,141,1770624000"; d="scan'208";a="229863743"
Received: from rvuia-mobl.ger.corp.intel.com (HELO localhost)
 ([10.245.245.213])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Mar 2026 01:00:15 -0700
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20260325212342.4388-1-c.manszewski@gmail.com>
References: <20260325212342.4388-1-c.manszewski@gmail.com>
Subject: Re: [PATCH v2] mailmap: update email address for Christoph Manszewski
From: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
Cc: linux-kernel@vger.kernel.org, Mika Kuoppala <mika.kuoppala@linux.intel.com>,
 Christoph Manszewski <c.manszewski@gmail.com>,
 Christoph Manszewski <christoph.manszewski@intel.com>
To: Christoph Manszewski <c.manszewski@gmail.com>,
 intel-gfx@lists.freedesktop.org
Date: Thu, 26 Mar 2026 10:00:11 +0200
Message-ID: <177451201165.80931.17441097839328820166@jlahtine-mobl>
User-Agent: alot/0.12.dev7+g16b50e5f
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

Quoting Christoph Manszewski (2026-03-25 23:23:42)
> Since I am moving from intel, map the intel mail to my personal Gmail
> address.
>=20
> Signed-off-by: Christoph Manszewski <christoph.manszewski@intel.com>

Applied to drm-intel-next. Thank you and best of luck for your
next steps!

Regards, Joonas
